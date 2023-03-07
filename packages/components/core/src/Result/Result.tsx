import { ReactNode } from 'react';
import { Space } from '../Space';
import { Text } from '../Text';
import { styled } from '../stitches.config';
import type * as Stitches from '@stitches/react';

export interface ResultProps {
  icon: ReactNode;
  description: string;
  extraDescription?: string | ReactNode;
  action: ReactNode;
  css?: Stitches.CSS;
}
const StyledResult = styled(Space, {
  display: 'flex',
  flexDirection: 'column',
  alignItems: 'center',
});
export function Result({
  icon,
  description,
  extraDescription,
  action,
  css,
  ...props
}: ResultProps) {
  return (
    <StyledResult css={css} {...props}>
      {icon}
      <Text css={{ color: '$gray12' }}>{description}</Text>
      <Text css={{ marginTop: '-12px', color: '$gray8', fontSize: '14px' }}>
        {extraDescription}
      </Text>
      <Space gap="8px">{action}</Space>
    </StyledResult>
  );
}

export default Result;
