import { RightOutlined } from '@ant-design/icons';
import { Divider } from '../Divider';
import { styled } from '../stitches.config';

import { StepItemProps } from './Step';
import { StepItemBasic } from './StepItemBasic';

const StyledStepItemNavigation = styled('div', {
  width: 'fit-content',
  position: 'relative',
  hr: {
    width: '264px',
    margin: 0,
    marginTop: '$2',
  },
  'span:nth-child(2)': {
    position: 'absolute',
    right: '0',
    top: '12px',
  },
});

export const StepItemNavigation = ({
  label,
  description,
  state,
  step,
  icon,
  size,
}: StepItemProps) => {
  return (
    <StyledStepItemNavigation>
      <StepItemBasic
        description={description}
        label={label}
        orientation="horizontal"
        size={size}
        state={state}
        step={step}
        icon={icon}
        css={{
          margin: '0 auto',
          'div:last-child': {
            'div:first-child': {
              display: 'flex',
              alignItems: 'center',
              flexDirection: 'row',
            },
            hr: {
              display: 'none !important',
            },
          },
        }}
      />
      <RightOutlined />
      <Divider
        css={{
          mt: '$2',
          width: '264px',
        }}
        border="solid"
        orientation="center"
      />
    </StyledStepItemNavigation>
  );
};
