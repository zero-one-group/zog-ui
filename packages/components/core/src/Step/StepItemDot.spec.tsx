import { render } from '@testing-library/react';

import { StepItemDot } from './StepItemDot';

describe('Switch', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <StepItemDot orientation={'horizontal'} state={'stepProgress'} step={0} />
    );
    expect(baseElement).toBeTruthy();
  });
});
