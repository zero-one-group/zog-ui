import { ComponentProps, Fragment } from 'react';
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

const StyledHeader = styled(StyledItemBase, {
  borderBlockEnd: '1px solid $grayA6',
});

const StyledFooter = styled(StyledItemBase, {});

export type ListItemProps = {
  children?: React.ReactNode;
  actions?: React.ReactNode[];
};

const ListItem = ({ children, ...props }: ListItemProps) => {
  return (
    <StyledItemList role="listitem" className="list-item" {...props}>
      {children}
    </StyledItemList>
  );
};

export type ListItemMetaProps = {
  children?: React.ReactNode;
  avatar?: React.ReactNode;
  title?: React.ReactNode;
  description?: React.ReactNode;
};

const ListItemMeta = ({
  children,
  avatar,
  title,
  description,
  ...props
}: ListItemMetaProps) => {
  return (
    <StyledItemListMeta {...props}>
      {avatar ? <StyledItemAvatar> {avatar}</StyledItemAvatar> : null}
      <StyledItemContent>
        {title ? <StyledItemTitle>{title}</StyledItemTitle> : null}
        {description ? (
          <StyledItemDescription>{description}</StyledItemDescription>
        ) : null}
      </StyledItemContent>
      {children}
    </StyledItemListMeta>
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
List.ItemMeta = ListItemMeta;

export default List;
