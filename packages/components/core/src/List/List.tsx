import { ComponentProps, Fragment, useMemo } from 'react';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$colorPrimaryList: colorScheme
      ? `$colors-${colorScheme}9`
      : '$colors-primary9',
  };
};

const StyledListWrapper = styled('div', {
  boxSizing: 'border-box',
  margin: 0,
  padding: 0,
  color: '$grayA12',
  fontSize: '14px',
  fontFamily: '$untitled',
  variants: {
    bordered: {
      true: {
        border: '1px solid $gray6',
      },
    },
    hasFooter: {
      false: {
        '& .list-item:last-child': {
          borderBlockEnd: 'none',
        },
      },
    },
    size: {
      sm: {
        '& .list-header, .list-footer, .list-item': {
          paddingBlock: '8px',
          paddingInline: '16px',
        },
      },
      md: {
        '& .list-header, .list-footer, .list-item': {
          paddingBlock: '12px',
          paddingInline: '24px',
        },
      },
      lg: {
        '& .list-header, .list-footer, .list-item': {
          paddingBlock: '16px',
          paddingInline: '24px',
        },
      },
    },
  },
});

const StyledListUnordered = styled('div', {
  boxSizing: 'border-box',
  margin: 0,
  padding: 0,
  listStyle: 'none',
});

const StyledItemBase = styled('div', {
  boxSizing: 'border-box',
});

const StyledItemList = styled(StyledItemBase, {
  borderBlockEnd: '1px solid $grayA6',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'space-between',
});

const StyledItemListMeta = styled('div', {
  display: 'flex',
  alignItems: 'flex-start',
  flex: 1,
});

const StyledItemAvatar = styled('div', {
  marginInlineEnd: '16px',
});

const StyledItemContent = styled('div', {
  width: '0',
  flex: '1 0',
});

const StyledItemTitle = styled('h4', {
  marginTop: 0,
  marginBottom: '$2',
  color: '$gray12',
});

const StyledItemDescription = styled('div', {
  color: '$gray9',
});

const StyledItemActions = styled('ul', {
  display: 'flex',
  justifyContent: 'center',
  marginInlineStart: '48px',
  listStyle: 'none',
});

const StyledItemAction = styled('li', {
  flex: 1,
  paddingInline: '$2',
  cursor: 'pointer',
  textAlign: 'center',
  color: '$$colorPrimaryList',
  '&:not(:last-child)': {
    borderInlineEnd: '1px solid #f0f0f0',
  },
});

const StyledHeader = styled(StyledItemBase, {
  borderBlockEnd: '1px solid $grayA6',
});

const StyledFooter = styled(StyledItemBase, {});

export type ListItemMetaProps = {
  avatar?: React.ReactNode;
  title?: React.ReactNode;
  description?: React.ReactNode;
};

export type ListItemProps = {
  children?: React.ReactNode;
  actions?: React.ReactNode[];
  meta: ListItemMetaProps;
};

const ListItem = ({ children, meta, actions, ...props }: ListItemProps) => {
  const metaContents = useMemo(() => {
    return meta ? (
      <StyledItemListMeta>
        {meta.avatar ? (
          <StyledItemAvatar> {meta.avatar}</StyledItemAvatar>
        ) : null}
        <StyledItemContent>
          {meta.title ? <StyledItemTitle>{meta.title}</StyledItemTitle> : null}
          {meta.description ? (
            <StyledItemDescription>{meta.description}</StyledItemDescription>
          ) : null}
        </StyledItemContent>
      </StyledItemListMeta>
    ) : null;
  }, [meta]);

  const actionContents = useMemo(() => {
    return actions && actions.length > 0 ? (
      <StyledItemActions>
        {actions.map((action) => (
          <StyledItemAction>{action}</StyledItemAction>
        ))}
      </StyledItemActions>
    ) : null;
  }, [actions]);

  return (
    <StyledItemList role="listitem" className="list-item" {...props}>
      {metaContents}
      {children}
      {actionContents}
    </StyledItemList>
  );
};

export type ListProps<T> = {
  colorScheme?: string;
  bordered?: boolean;
  header?: React.ReactNode;
  footer?: React.ReactNode;
  children?: React.ReactNode;
  dataSource?: T[];
  renderItem?: (item: T, index: number) => React.ReactNode;
  size?: 'sm' | 'md' | 'lg';
} & ComponentProps<typeof StyledListWrapper>;

export function List<T>({
  header,
  footer,
  bordered,
  dataSource = [],
  size = 'md',
  renderItem,
  colorScheme,
  css,
  ...props
}: ListProps<T>) {
  const renderListItem = (item: T, index: number) => {
    if (renderItem !== undefined) {
      const key = `list-item-${index}`;
      return <Fragment key={key}>{renderItem(item, index)}</Fragment>;
    }
  };

  const renderList = () => {
    if (dataSource.length > 0) {
      const items = dataSource.map((item, index) =>
        renderListItem(item, index)
      );
      return <StyledListUnordered role="list">{items}</StyledListUnordered>;
    }
    return null;
  };

  return (
    <StyledListWrapper
      bordered={bordered}
      size={size}
      hasFooter={footer !== undefined}
      css={{
        ...getColorSchemeVariants(colorScheme),
        ...css,
      }}
      {...props}
    >
      {header ? (
        <StyledHeader className="list-header">{header}</StyledHeader>
      ) : null}
      {renderList()}
      {footer ? (
        <StyledFooter className="list-footer">{footer}</StyledFooter>
      ) : null}
    </StyledListWrapper>
  );
}

List.Item = ListItem;

export default List;
