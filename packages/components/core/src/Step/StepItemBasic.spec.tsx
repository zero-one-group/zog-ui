import { render } from '@testing-library/react';

import { StepItemBasic } from './StepItemBasic';

describe('Switch', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <StepItemBasic
        orientation={'horizontal'}
        state={'stepProgress'}
        step={0}
      />
    );
    expect(baseElement).toBeTruthy();
  });
});
