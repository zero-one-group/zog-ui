import { styled } from '../stitches.config';
import type * as Stitches from '@stitches/react';

export interface RibbonProps {
  label?: string | number;
  css?: Stitches.CSS
}
const StyledRibbon = styled('span', {
  width: '150px',
  height: '150px',
  overflow: 'hidden',
  position: 'absolute',
  top: '-10px',
  left: '-10px',
  '&::after': {
    position: 'absolute',
    zIndex: -1,
    content: "''",
    display: 'block',
    border: '5px solid $gray4',
    top: '78px',
  },
  span: {
    position: 'absolute',
    display: 'block',
    width: '225px',
    padding: '15px 0',
    backgroundColor: '$primary9',
    boxShadow: '0 5px 10px rgba(0,0,0,.1)',
    color: '$gray1',
    font: "700 18px/1 'Lato', sans-serif",
    textShadow: '0 1px 1px rgba(0,0,0,.2)',
    textTransform: 'uppercase',
    textAlign: 'center',
    right: '-25px',
    top: '30px',
  },
  variants: {
    placement: {
      left: {
        '&::after': {
          left: '0',
          borderBottomColor: 'transparent',
          borderLeftColor: 'transparent',
        },
      },
      right: {
        '&::after': {
          right: '0',
          borderBottomColor: 'transparent',
          borderRightColor: 'transparent',
        },
      },
    },
  },
  defaultVariants: {
    placement: 'left',
  },
});
export function Ribbon({
  label,
  css,
  ...props
}: RibbonProps & Stitches.VariantProps<typeof StyledRibbon>) {
  return (
    <StyledRibbon {...props} css={css}>
      <span>{label}</span>
    </StyledRibbon>
  );
}

export default Ribbon;
