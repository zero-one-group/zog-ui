import { styled } from '../stitches.config';

export const Anchor = styled('a', {
  fontSize: '14px',
  textDecoration: 'none',
  '&:hover': {
    textDecoration: 'underline',
  },
});

export default Anchor;
