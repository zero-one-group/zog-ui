import { Button } from '../Button';
import { styled } from '../stitches.config';

export const StyledMenuRoot = styled(Button, {
  display: 'flex',
  justifyContent: 'space-between',
  alignItem: 'center',
  gap: 4,
  '& > .right-icon': {
    display: 'flex',
    justifyContent: 'end',
    flex: 1,
  },
});

export const StyledMenuItem = styled(Button, {
  display: 'flex',
  justifyContent: 'flex-start',
  alignItems: 'center',
  gap: 4,
  backgroundColor: 'White',
  width: '100%',
  border: 'none',
  borderRadius: '$2',
  textAlign: 'left',
  minWidth: '110px',
  margin: 0,
  outline: 0,
  padding: '4px 14px',
  '&[data-open], &:focus, &:not([disabled]):active': {
    backgroundColor: '$gray4',
  },
});

export const StyledMenuContent = styled('div', {
  backgroundColor: 'White',
  backdropFilter: 'blur(10px)',
  padding: '$2',
  borderRadius: '$2',
  boxShadow:
    'hsl(206 22% 7% / 35%) 0px 10px 38px -10px, hsl(206 22% 7% / 20%) 0px 10px 20px -15px',
  width: 'max-content',
  display: 'flex',
  flexDirection: 'column',
  gap: 4,
  outline: 'none',
  zIndex: 2,
});
