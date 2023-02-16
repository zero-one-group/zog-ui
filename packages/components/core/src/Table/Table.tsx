import { CaretDownOutlined, CaretUpOutlined } from '@ant-design/icons';
import {
  ColumnDef,
  flexRender,
  getCoreRowModel,
  getSortedRowModel,
  Header,
  SortDirection,
  SortingState,
  useReactTable,
} from '@tanstack/react-table';
import { useState } from 'react';
import { styled } from '../stitches.config';

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
        fontWeight: 500,
        textAlign: 'left',
        '&[colspan]:not([colspan="1"])': {
          textAlign: 'center',
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
      },
    },
  },
});

const StyledHeaderColumn = styled('div', {
  display: 'flex',
  variants: {
    sortable: {
      true: {
        cursor: 'pointer',
      },
    },
  },
});

const StyledHeaderColumnName = styled('div', {
  flex: '1',
});

const StyledHeaderColumnSortIcons = styled('div', {
  marginLeft: '$1',
  display: 'flex',
  flexDirection: 'column',
  fontSize: '9px',
  variants: {
    sort: {
      asc: {
        '& span:first-of-type': { color: '$blue9' },
      },
      desc: {
        '& span:last-of-type': {
          color: '$blue9',
        },
      },
      default: {
        color: '$gray8',
      },
    },
  },
});

export interface TableProps<T> {
  dataSource: T[];
  columns: ColumnDef<T>[];
  size?: 'sm' | 'md' | 'lg';
  bordered?: boolean;
  enableSorting?: boolean;
}

export function Table<T>({
  dataSource,
  columns,
  size = 'lg',
  bordered = false,
  enableSorting = false,
}: TableProps<T>) {
  const [data, setData] = useState(() => [...dataSource]);
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
  });

  const renderHeader = (header: Header<T, unknown>) => {
    const sortedVariant = header.column.getIsSorted()
      ? (header.column.getIsSorted() as SortDirection)
      : 'default';
    const shouldShowSorting = header.column.getCanSort() && enableSorting;

    return (
      <th key={header.id} colSpan={header.colSpan}>
        {header.isPlaceholder ? null : (
          <StyledHeaderColumn
            sortable={shouldShowSorting}
            onClick={header.column.getToggleSortingHandler()}
          >
            <StyledHeaderColumnName>
              {flexRender(header.column.columnDef.header, header.getContext())}
            </StyledHeaderColumnName>
            {shouldShowSorting ? (
              <StyledHeaderColumnSortIcons sort={sortedVariant}>
                <CaretUpOutlined />
                <CaretDownOutlined />
              </StyledHeaderColumnSortIcons>
            ) : null}
          </StyledHeaderColumn>
        )}
      </th>
    );
  };

  return (
    <div>
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
    </div>
  );
}

export default Table;
