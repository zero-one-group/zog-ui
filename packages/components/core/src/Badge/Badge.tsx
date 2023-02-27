import { styled } from '../stitches.config';
import { Space } from '../Space';
import { Text } from '../Text';
import type * as Stitches from '@stitches/react';

export interface BadgeProps {
  label?: string | number;
  count?: string | number;
}
const StyledBadge = styled('span', {
  backgroundColor: '$gray4',
  color: '$gray11',
  minWidth: '6px',
  minHeight: '6px',
  border: '1px solid $gray4',
  borderRadius: '32px',
  display: 'block',
  boxSizing: 'border-box',
  variants: {
    size: {
      sm: {
        minWidth: '16px',
        minHeight: '16px',
        padding: '0px 4px',
      },
      md: {
        padding: '2px 6px',
        minWidth: '20px',
        minHeight: '20px',
      },
      lg: {
        padding: '4px 8px',
        minWidth: '24px',
        minHeight: '24px',
      },
    },
    roundedFull: {
      true: {
        borderRadius: '100%',
        display: 'inline-block',
      },
    },
    count: {
      true: {
        textAlign: 'center',
      },
    },
  },
  defaultVariants: {
    size: 'md',
  },
});
export function Badge({
  label,
  count,
  ...props
}: BadgeProps & Stitches.VariantProps<typeof StyledBadge>) {
  return (
    <Space align="center">
      <StyledBadge size="sm" count={Boolean(count)} {...props}>
        {count}
      </StyledBadge>
      {label ? (
        <Text
          css={{
            marginLeft: '4px',
            marginBottom: '0',
            marginTop: '0',
          }}
        >
          {label}
        </Text>
      ) : null}
    </Space>
  );
}

export default Badge;
