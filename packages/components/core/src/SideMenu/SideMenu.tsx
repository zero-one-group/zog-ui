import { Root as RadixAccordionRoot } from '@radix-ui/react-accordion';
import { ComponentProps, forwardRef, ReactNode, useState } from 'react';
import { Button } from '../Button';
import { CSS } from '../stitches.config';
import {
  StyledSideMenuDownIcon,
  StyledSideMenuItem,
  StyledSideMenuItemContent,
  StyledSideMenuRoot,
  StyledSideMenuSub,
  StyledSideMenuSubContent,
  StyledSideMenuSubTrigger,
} from './SideMenu.styles';

// #region SideMenuRoot
export type SideMenuRootProps = ComponentProps<typeof StyledSideMenuRoot>;
const SideMenuRoot = forwardRef<HTMLUListElement, SideMenuRootProps>(
  (props, ref) => {
    return <StyledSideMenuRoot ref={ref} {...props} />;
  }
);
// #endregion SideMenuRoot

// #region SideMenuItem
export type SideMenuItemProps = ComponentProps<typeof StyledSideMenuItem> & {
  title: string;
  icon?: ReactNode;
};
export const SideMenuItem = forwardRef<HTMLLIElement, SideMenuItemProps>(
  ({ title, icon, children, ...props }, ref) => {
    return (
      <StyledSideMenuItem ref={ref} {...props}>
        <Button
          size="md"
          css={{
            border: 'none',
            backgroundColor: '$gray3',
            cursor: 'pointer',
            transitionDuration: '300ms',
            '&:hover': {
              backgroundColor: '$gray4',
            },
          }}
        >
          <StyledSideMenuItemContent>
            {icon ?? null}
            {title}
          </StyledSideMenuItemContent>
        </Button>
        {children}
      </StyledSideMenuItem>
    );
  }
);
// #endregion SideMenuItem

// #region SideMenuSub
export type SideMenuSubProps = ComponentProps<
  typeof StyledSideMenuSub<CSS, 'li'>
> & {
  title: string;
  icon?: ReactNode;
  value: string;
  defaultExpanded?: boolean;
};
export const SideMenuSub = forwardRef<HTMLLIElement, SideMenuSubProps>(
  ({ value, children, icon, defaultExpanded, title, ...props }, ref) => {
    const [accValue, setAccValue] = useState<string[]>([]);

    return (
      <RadixAccordionRoot
        asChild
        type="multiple"
        defaultValue={defaultExpanded ? [value] : undefined}
        value={accValue}
        onValueChange={setAccValue}
      >
        <StyledSideMenuItem ref={ref} className="submenu-item" {...props}>
          <StyledSideMenuSub value={value}>
            <StyledSideMenuSubTrigger
              asChild
              css={{
                mb: accValue.find((v) => value === v) ? 4 : undefined,
              }}
            >
              <Button
                size="md"
                css={{
                  border: 'none',
                  backgroundColor: '$gray3',
                  cursor: 'pointer',
                  '&:hover': {
                    backgroundColor: '$gray4',
                  },
                }}
              >
                <StyledSideMenuItemContent>
                  {icon ?? null}
                  {title}
                </StyledSideMenuItemContent>
                <StyledSideMenuDownIcon />
              </Button>
            </StyledSideMenuSubTrigger>
            {children}
          </StyledSideMenuSub>
        </StyledSideMenuItem>
      </RadixAccordionRoot>
    );
  }
);
// #endregion SideMenuSub

// #region SideMenuSubContent
export type SideMenuSubContentProps = ComponentProps<
  typeof StyledSideMenuSubContent
>;
export const SideMenuSubContent = forwardRef<
  HTMLDivElement,
  SideMenuSubContentProps
>(({ children, ...props }, ref) => {
  return (
    <StyledSideMenuSubContent ref={ref} {...props}>
      <ul>{children}</ul>
    </StyledSideMenuSubContent>
  );
});
// #endregion SideMenuSubContent

export const SideMenu = Object.assign(SideMenuRoot, {
  Item: SideMenuItem,
  Sub: SideMenuSub,
  SubContent: SideMenuSubContent,
});
