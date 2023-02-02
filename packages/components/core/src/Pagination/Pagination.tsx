import { LeftOutlined, RightOutlined } from '@ant-design/icons';
import { Box } from '../Box';
import { Button } from '../Button';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import { DOTS, usePagination, usePaginationProps } from './use-pagination';

import { ComponentPropsWithoutRef, ElementType, ReactNode } from 'react';

export type PaginationProps = ComponentPropsWithoutRef<ElementType> &
  usePaginationProps & {
    previousIcon?: ReactNode;
    nextIcon?: ReactNode;
    simple?: boolean;
    showTotal?: boolean;
    onChange: (currentPage: number) => void;
    colorScheme?: string;
  };

const ItemPagination = styled(Button, {
  border: '1px solid $gray1',
  backgroundColor: 'transparent',
  boxShadow: 'none',
  variants: {
    simple: {
      true: {
        border: 'none',
      },
    },
  },
});

export const Pagination = ({
  currentPage,
  totalCount,
  siblingCount,
  pageSize,
  previousIcon,
  nextIcon,
  onChange,
  showTotal,
  colorScheme,
  ...props
}: PaginationProps) => {
  const paginationRange = usePagination({
    currentPage,
    totalCount,
    siblingCount,
    pageSize,
  });

  const lastPage = paginationRange
    ? paginationRange[paginationRange.length - 1]
    : 0;

  const onPrevious = () => {
    if (currentPage !== 1) {
      onChange(currentPage - 1);
    }
  };

  const onNext = () => {
    if (currentPage !== lastPage) {
      onChange(currentPage + 1);
    }
  };

  return (
    <Space gap="m" align="center" {...props}>
      {showTotal ? (
        <Space
          gap="s"
          css={{ fontSize: '$4' }}
          align="center"
          justify="space-between"
        >
          Total <span>{totalCount}</span> items
        </Space>
      ) : null}
      <ItemPagination
        simple={props.simple}
        onClick={onPrevious}
        type="secondary"
        size="lg"
        variant="outlined"
        disabled={currentPage === 1}
        colorScheme={colorScheme}
      >
        {previousIcon ? previousIcon : <LeftOutlined />}
      </ItemPagination>
      {paginationRange &&
        paginationRange.map((item) => {
          if (item === DOTS) {
            return <Box css={{ color: '$gray7' }}>{DOTS}</Box>;
          }
          return (
            <ItemPagination
              simple={props.simple}
              onClick={() => onChange(Number(item))}
              type={item === currentPage ? 'primary' : 'secondary'}
              size="lg"
              variant="outlined"
              colorScheme={colorScheme}
            >
              {item}
            </ItemPagination>
          );
        })}
      <ItemPagination
        simple={props.simple}
        onClick={onNext}
        size="lg"
        variant="outlined"
        disabled={currentPage === lastPage}
        type="secondary"
        colorScheme={colorScheme}
      >
        {nextIcon ? nextIcon : <RightOutlined />}
      </ItemPagination>
    </Space>
  );
};

export default Pagination;
