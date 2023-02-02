import { LeftOutlined, RightOutlined } from '@ant-design/icons';
import { Box } from '../Box';
import { Button } from '../Button';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import { DOTS, usePagination, usePaginationProps } from './use-pagination';

import {
  ComponentPropsWithoutRef,
  ElementType,
  ReactNode,
  useState,
} from 'react';

export type PaginationProps = ComponentPropsWithoutRef<ElementType> &
  usePaginationProps & {
    previousIcon?: ReactNode;
    nextIcon?: ReactNode;
    simple?: boolean;
    showTotal?: boolean;
    showSizeChange?: boolean;
    showQuickJumper?: boolean;
    onChangePage: (currentPage: number) => void;
    listCustomSizePage?: number[];
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
const SizeChanger = styled('select', {
  width: '100px',
  height: '37px',
  fontSize: '16px',
  padding: '0px 7px',
});
const QuickJumper = styled('input', {
  width: '50px',
  height: '37px',
  fontSize: '16px',
  padding: '0px 7px',
});
export const Pagination = ({
  currentPage,
  totalCount,
  siblingCount,
  pageSize,
  previousIcon,
  nextIcon,
  onChangePage,
  showTotal,
  colorScheme,
  showSizeChange,
  onChangePagePageSize,
  listCustomSizePage,
  showQuickJumper,
  ...props
}: PaginationProps) => {
  const [customPageSize, setCustomPageSize] = useState(pageSize);
  const paginationRange = usePagination({
    currentPage,
    totalCount,
    siblingCount,
    pageSize: customPageSize,
  });

  const lastPage = paginationRange
    ? paginationRange[paginationRange.length - 1]
    : 0;

  const onPrevious = () => {
    if (currentPage !== 1) {
      onChangePage(currentPage - 1);
    }
  };

  const onNext = () => {
    if (currentPage !== lastPage) {
      onChangePage(currentPage + 1);
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
        intent="secondary"
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
              intent={item === currentPage ? 'primary' : 'secondary'}
              onClick={() => onChangePage(Number(item))}
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
        intent="secondary"
        colorScheme={colorScheme}
      >
        {nextIcon ? nextIcon : <RightOutlined />}
      </ItemPagination>
      {showSizeChange ? (
        <SizeChanger
          onChange={(pageSize) => {
            setCustomPageSize(Number(pageSize.target.value));
          }}
        >
          {listCustomSizePage ? (
            listCustomSizePage.map((item) => (
              <option value={item}>{item}/page</option>
            ))
          ) : (
            <option value="10">10/page</option>
          )}
        </SizeChanger>
      ) : null}
      {showQuickJumper ? (
        <>
          <p>Goto</p>
          <QuickJumper
            onChange={(page) => onChangePage(Number(page.target.value))}
          />
        </>
      ) : null}
    </Space>
  );
};

export default Pagination;
