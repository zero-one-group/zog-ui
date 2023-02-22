import { RightOutlined } from '@ant-design/icons';
import {
  autoUpdate,
  flip,
  FloatingFocusManager,
  FloatingNode,
  FloatingPortal,
  FloatingTree,
  offset,
  Placement,
  safePolygon,
  shift,
  useClick,
  useDismiss,
  useFloating,
  useFloatingNodeId,
  useFloatingParentNodeId,
  useFloatingTree,
  useHover,
  useInteractions,
  useListNavigation,
  useMergeRefs,
  useRole,
  useTypeahead,
} from '@floating-ui/react';
import {
  Children,
  cloneElement,
  ComponentProps,
  forwardRef,
  isValidElement,
  ReactNode,
  useEffect,
  useRef,
  useState,
} from 'react';
import {
  StyledMenuContent,
  StyledMenuItem,
  StyledMenuRoot,
} from './Menu.styles';

// #region Types
export type MenuRootProps = ComponentProps<typeof StyledMenuRoot> & {
  open?: boolean;
  placement?: Placement;
  icon?: ReactNode;
};

export type MenuItemProps = ComponentProps<typeof StyledMenuItem> & {
  icon?: ReactNode;
};
// #endregion Types

// #region MenuComponent
const MenuComponent = forwardRef<HTMLButtonElement, MenuRootProps>(
  (
    {
      title,
      open = false,
      icon,
      placement = 'bottom-start',
      children,
      disabled,
      size = 'md',
      ...props
    },
    forwardedRef
  ) => {
    // #region State
    const [isOpen, setIsOpen] = useState(open);
    const [activeIndex, setActiveIndex] = useState<number | null>(null);
    // #endregion State

    // #region Refs
    const listItemRefs = useRef<(HTMLButtonElement | null)[]>([]);
    const listContentRefs = useRef(
      Children.map(children, (child) => {
        return isValidElement(child) ? child.props.title : null;
      }) as (string | null)[]
    );
    // #endregion Refs

    // #region Floating Node
    const tree = useFloatingTree();
    const nodeId = useFloatingNodeId();
    const parentId = useFloatingParentNodeId();
    const isNested = parentId !== null;
    // #endregion Floating Node

    // #region Floating
    const { x, y, strategy, refs, context } = useFloating({
      nodeId,
      open: isOpen,
      onOpenChange: setIsOpen,
      placement: isNested ? 'right-start' : placement,
      middleware: [offset(), flip(), shift()],
      whileElementsMounted: autoUpdate,
    });
    // #endregion Floating

    // #region Floating Interactions
    const hover = useHover(context, {
      delay: {
        open: 50,
      },
      handleClose: safePolygon({
        restMs: 25,
        blockPointerEvents: true,
      }),
    });
    const click = useClick(context, {
      event: 'mousedown',
      toggle: !isNested,
      ignoreMouse: isNested,
    });
    const role = useRole(context, {
      role: 'menu',
    });
    const dismiss = useDismiss(context);
    const listNavigation = useListNavigation(context, {
      listRef: listItemRefs,
      activeIndex,
      nested: isNested,
      onNavigate: setActiveIndex,
    });
    const typeahead = useTypeahead(context, {
      listRef: listContentRefs,
      onMatch: isOpen ? setActiveIndex : undefined,
      activeIndex,
    });

    const { getReferenceProps, getFloatingProps, getItemProps } =
      useInteractions([hover, click, role, listNavigation, typeahead, dismiss]);
    // #endregion Floating Interactions

    const referenceRef = useMergeRefs([forwardedRef, refs.setReference]);

    // #region Effects
    useEffect(() => {
      if (!tree) return;

      const handleTreeClick = () => {
        setIsOpen(false);
      };

      const onSubMenuOpen = (event: { nodeId: string; parentId: string }) => {
        if (event.nodeId !== nodeId && event.parentId === parentId) {
          setIsOpen(false);
        }
      };

      tree.events.on('click', handleTreeClick);
      tree.events.on('menuopen', onSubMenuOpen);

      return () => {
        tree.events.off('click', handleTreeClick);
        tree.events.off('menuopen', onSubMenuOpen);
      };
    }, [tree, nodeId, parentId]);

    useEffect(() => {
      if (isOpen && tree) {
        tree.events.emit('menuopen', { nodeId, parentId });
      }
    }, [tree, isOpen, nodeId, parentId]);
    // #endregion Effects

    return (
      <FloatingNode id={nodeId}>
        <StyledMenuRoot
          ref={referenceRef}
          as={isNested ? StyledMenuItem : undefined}
          disabled={disabled}
          size={size}
          data-open={isOpen}
          {...getReferenceProps({
            ...props,
            onClick: (event) => {
              event.stopPropagation();
            },
            role: isNested ? 'menuitem' : undefined,
            title,
          })}
        >
          {icon ?? null}
          <p>{title}</p>
          {isNested ? <RightOutlined className="right-icon" /> : null}
        </StyledMenuRoot>
        <FloatingPortal>
          {isOpen ? (
            <FloatingFocusManager
              context={context}
              modal={false}
              initialFocus={isNested ? -1 : 0}
              returnFocus={!isNested}
            >
              <StyledMenuContent
                ref={refs.setFloating}
                css={{
                  position: strategy,
                  top: y ?? 0,
                  left: x ?? 0,
                  width: 'max-content',
                }}
                {...getFloatingProps()}
              >
                {Children.map(children, (child, index) => {
                  if (!isValidElement(child)) return null;

                  return cloneElement(
                    child,
                    getItemProps({
                      tabIndex: activeIndex === index ? 0 : -1,
                      role: 'menuitem',
                      ref: (node: HTMLButtonElement) => {
                        listItemRefs.current[index] = node;
                      },
                      onClick: (event) => {
                        child.props.onClick?.(event);
                        tree?.events.emit('click');
                      },
                      onMouseEnter: () => {
                        if (isOpen) {
                          setActiveIndex(index);
                        }
                      },
                    })
                  );
                })}
              </StyledMenuContent>
            </FloatingFocusManager>
          ) : null}
        </FloatingPortal>
      </FloatingNode>
    );
  }
);
// #endregion MenuComponent

// #region MenuItem
const Item = forwardRef<HTMLButtonElement, MenuItemProps>(
  (
    { children, role = 'menuitem', size = 'md', title, icon, ...props },
    ref
  ) => {
    return (
      <StyledMenuItem
        ref={ref}
        role={role}
        size={size}
        title={title}
        {...props}
      >
        {icon ?? null}
        {title}
      </StyledMenuItem>
    );
  }
);
// #endregion MenuItem

// #region Root
const Root = forwardRef<HTMLButtonElement, MenuRootProps>((props, ref) => {
  const parentId = useFloatingParentNodeId();

  if (parentId === null) {
    return (
      <FloatingTree>
        <MenuComponent ref={ref} {...props} />
      </FloatingTree>
    );
  }

  return <MenuComponent ref={ref} {...props} />;
});
// #endregion Root

export const Menu = Object.assign(Root, { Item });
