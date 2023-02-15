import { Fragment } from 'react';
import { styled } from '../stitches.config';

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

const StyledListUnordered = styled('ul', {
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
  variants: {},
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
  return <StyledItemList className="list-item">{children}</StyledItemList>;
};

export type ListProps<T> = {
  bordered?: boolean;
  header?: React.ReactNode;
  footer?: React.ReactNode;
  children?: React.ReactNode;
  dataSource?: T[];
  renderItem?: (item: T, index: number) => React.ReactNode;
  size?: 'sm' | 'md' | 'lg';
};

export function List<T>({
  header,
  footer,
  bordered,
  dataSource = [],
  size = 'md',
  renderItem,
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
      return <StyledListUnordered>{items}</StyledListUnordered>;
    }
    return null;
  };

  return (
    <StyledListWrapper
      bordered={bordered}
      size={size}
      hasFooter={footer !== undefined}
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
