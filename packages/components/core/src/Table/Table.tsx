import {
  CaretDownOutlined,
  CaretUpOutlined,
  FilterFilled,
} from '@ant-design/icons';
import {
  ColumnDef,
  flexRender,
  getCoreRowModel,
  getFilteredRowModel,
  getPaginationRowModel,
  getSortedRowModel,
  Header,
  SortDirection,
  SortingState,
  TableOptions,
  useReactTable,
} from '@tanstack/react-table';
import { ComponentProps, useState } from 'react';
import { Pagination } from '../Pagination';
import { styled } from '../stitches.config';
import TableFilter from './TableFilter';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgTable: colorScheme ? `$colors-${colorScheme}9` : '$colors-primary9',
  };
};

const StyledTableWrapper = styled('div', {
  display: 'flex',
  flexDirection: 'column',
  gap: '$4',
  alignItems: 'end',
});

const StyledTable = styled('table', {
  width: '100%',
  fontFamily: '$untitled',
  fontSize: '14px',
  border: 'none',
  borderCollapse: 'collapse',
  '& thead': {
    borderBottom: '1px solid $gray4',
    '&>tr': {
      backgroundColor: '$gray2',
      '&>th': {
        position: 'relative',
        fontWeight: 500,
        textAlign: 'left',
        '&[colspan]:not([colspan="1"])': {
          textAlign: 'center',
        },
        '&:not(:last-child)::after': {
          content: '',
          position: 'absolute',
          width: '1px',
          height: '16px',
          backgroundColor: '$gray5',
          right: 0,
          top: '50%',
          transform: 'translateY(-50%)',
        },
      },
    },
  },
  '& thead>tr>th, tbody>tr>td': {
    padding: '1rem',
  },
  '& tbody>tr': {
    borderBottom: '1px solid $gray4',
    transition: 'background-color .1s linear',
    '&:hover': {
      backgroundColor: '$gray2',
    },
  },
  variants: {
    size: {
      sm: {
        '& thead>tr>th, tbody>tr>td': {
          padding: '.5rem',
        },
      },
      md: {
        '& thead>tr>th, tbody>tr>td': {
          padding: '12px 8px',
        },
      },
      lg: {
        '& thead>tr>th, tbody>tr>td': {
          padding: '1rem',
        },
      },
    },
    bordered: {
      true: {
        '& th, td': {
          border: '1px solid $gray4',
        },
        '& thead>tr>th:not(:last-child)::after': {
          content: 'none',
        },
      },
    },
  },
});

const StyledHeaderColumn = styled('div', {
  display: 'flex',
  alignItems: 'center',
  variants: {
    sortable: {
      true: {
        cursor: 'pointer',
        userSelect: 'none',
      },
    },
  },
});

const StyledHeaderColumnName = styled('div', {
  flex: '1',
});

const StyledHeaderColumnIcons = styled('div', {
  marginLeft: '$2',
  fontSize: '10px',
  color: '$gray8',
});

const StyledHeaderColumnSortIcons = styled(StyledHeaderColumnIcons, {
  display: 'flex',
  fontSize: '8px',
  flexDirection: 'column',
  variants: {
    sort: {
      asc: {
        '& span:first-of-type': { color: '$$bgTable' },
      },
      desc: {
        '& span:last-of-type': {
          color: '$$bgTable',
        },
      },
    },
  },
});

const StyledHeaderColumnFilterIcons = styled(StyledHeaderColumnIcons, {
  padding: '1px 2px',
  borderRadius: '4px',
  '&:hover': {
    color: '$gray10',
    backgroundColor: '$gray6',
  },
  variants: {
    filtered: {
      true: {
        color: '$$bgTable',
        '&:hover': {
          color: '$$bgTable',
        },
      },
    },
  },
});

export type TableProps<T> = {
  colorScheme?: string;
  dataSource: T[];
  columns: ColumnDef<T>[];
  size?: 'sm' | 'md' | 'lg';
  bordered?: boolean;
  enableSorting?: boolean;
  enableFiltering?: boolean;
  initialState?: TableOptions<T>['initialState'];
} & ComponentProps<typeof StyledTableWrapper>;

export function Table<T>({
  colorScheme,
  dataSource,
  columns,
  size = 'lg',
  bordered = false,
  enableSorting = false,
  enableFiltering = false,
  initialState,
  css,
}: TableProps<T>) {
  const [data] = useState(() => [...dataSource]);
  const [sorting, setSorting] = useState<SortingState>([]);

  const table = useReactTable({
    data,
    columns,
    state: {
      sorting: enableSorting ? sorting : undefined,
    },
    getCoreRowModel: getCoreRowModel(),
    onSortingChange: enableSorting ? setSorting : undefined,
    getSortedRowModel: enableSorting ? getSortedRowModel() : undefined,
    getPaginationRowModel: getPaginationRowModel(),
    getFilteredRowModel: enableFiltering ? getFilteredRowModel() : undefined,
    initialState: {
      ...initialState,
    },
  });

  const renderHeader = (header: Header<T, unknown>) => {
    const sortedDirection = header.column.getIsSorted()
      ? (header.column.getIsSorted() as SortDirection)
      : undefined;
    const shouldShowSorting = header.column.getCanSort() && enableSorting;

    const isFiltered = header.column.getIsFiltered()
      ? header.column.getIsFiltered()
      : undefined;
    const shouldShowFiltering = header.column.getCanFilter() && enableFiltering;

    return (
      <th key={header.id} colSpan={header.colSpan}>
        {header.isPlaceholder ? null : (
          <StyledHeaderColumn sortable={shouldShowSorting}>
            <StyledHeaderColumnName
              onClick={header.column.getToggleSortingHandler()}
            >
              {flexRender(header.column.columnDef.header, header.getContext())}
            </StyledHeaderColumnName>
            {shouldShowSorting ? (
              <StyledHeaderColumnSortIcons sort={sortedDirection}>
                <CaretUpOutlined />
                <CaretDownOutlined />
              </StyledHeaderColumnSortIcons>
            ) : null}
            {shouldShowFiltering ? (
              <StyledHeaderColumnFilterIcons filtered={isFiltered}>
                <TableFilter
                  colorScheme={colorScheme}
                  column={header.column}
                  table={table}
                >
                  <FilterFilled />
                </TableFilter>
              </StyledHeaderColumnFilterIcons>
            ) : null}
          </StyledHeaderColumn>
        )}
      </th>
    );
  };

  return (
    <StyledTableWrapper
      css={{
        ...getColorSchemeVariants(colorScheme),
        ...css,
      }}
    >
      <StyledTable size={size} bordered={bordered}>
        <thead>
          {table.getHeaderGroups().map((headerGroup) => (
            <tr key={headerGroup.id}>
              {headerGroup.headers.map(renderHeader)}
            </tr>
          ))}
        </thead>
        <tbody>
          {table.getRowModel().rows.map((row) => (
            <tr key={row.id}>
              {row.getVisibleCells().map((cell) => (
                <td key={cell.id}>
                  {flexRender(cell.column.columnDef.cell, cell.getContext())}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </StyledTable>
      <Pagination
        colorScheme={colorScheme}
        siblingCount={1}
        pageSize={table.getState().pagination.pageSize}
        totalCount={table.getPrePaginationRowModel().rows.length}
        currentPage={table.getState().pagination.pageIndex + 1}
        onChangePage={(page) => table.setPageIndex(page - 1)}
      />
    </StyledTableWrapper>
  );
}

export default Table;
