import { styled } from '../stitches.config';

const StyledSpan = styled('span');

const StyledDivider = styled('div', {
  border: '0.2px $gray10',
  width: '100%',
  position: 'relative',
  variants: {
    border: {
      solid: {
        borderStyle: 'solid',
      },
      dashed: {
        borderStyle: 'dashed',
      },
    },
    orientation: {
      left: {
        '&> span': {
          position: 'absolute',
          top: '-11px',
          padding: '0 12px',
          left: '10px',
        },
      },
      center: {
        '&> span': {
          position: 'absolute',
          top: '-11px',
          padding: '0 12px',
          textAlign: 'center',
          width: '100%',
        },
      },
      right: {
        '&> span': {
          position: 'absolute',
          top: '-11px',
          padding: '0 12px',
          right: '10px',
        },
      },
    },
  },
  defaultVariants: {
    orientation: 'center',
    border: 'solid',
  },
});

export type DividerComponent = {
  children: string;
};

export const Divider = ({ children, ...props }: DividerComponent) => {
  return (
    <StyledDivider {...props}>
      {children ? (
        <StyledSpan
          css={{
            '&::before': {
              content: children,
              padding: '5px',
              backgroundColor: '$gray1',
            },
          }}
        />
      ) : null}
    </StyledDivider>
  );
};
