import { styled } from '../stitches.config';

export const Table = styled('table', {
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

export default Table;
