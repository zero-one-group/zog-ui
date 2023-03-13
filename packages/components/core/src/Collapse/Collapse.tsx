import { styled } from '../stitches.config';
import * as Collapsible from '@radix-ui/react-collapsible';
import React, { ReactNode } from 'react';
import { DownOutlined, RightOutlined } from '@ant-design/icons/lib/icons';
import { Text } from '../Text';
import { Space } from '../Space';
import type * as Stitches from '@stitches/react';

export interface CollapseProps {
  header: ReactNode | string;
  content: ReactNode | string;
  css?: Stitches.CSS;
}

RightOutlined.toString = () => '.anticon-right';
DownOutlined.toString = () => '.anticon-down';

const StyledHeader = styled(Space, {
  alignItems: 'center',
  border: '1px solid $gray8',
  padding: '12px 16px',
  color: '$gray12',
  [`& ${RightOutlined}`]: {
    marginRight: '4px',
  },
  [`& ${DownOutlined}`]: {
    marginRight: '4px',
  },
});

const StyledContent = styled('div', {
  border: '1px solid $gray8',
  padding: '12px 16px',
  color: '$gray12',
  borderTopWidth: 0,
});

const StyledCollapsibleRoot = styled(Collapsible.Root, {
  '+ div': {
    div: {
      borderTopWidth: 0,
    },
  },
});

export function Collapse({ header, content, css }: CollapseProps) {
  const [open, setOpen] = React.useState(false);
  return (
    <StyledCollapsibleRoot open={open} onOpenChange={setOpen} css={css}>
      <Collapsible.Trigger asChild>
        <StyledHeader>
          {open ? <DownOutlined /> : <RightOutlined />}
          <Text css={{ margin: 0 }}>{header}</Text>
        </StyledHeader>
      </Collapsible.Trigger>
      <Collapsible.Content>
        <StyledContent>{content}</StyledContent>
      </Collapsible.Content>
    </StyledCollapsibleRoot>
  );
}
export default Collapse;
