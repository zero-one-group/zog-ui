import { render } from '@testing-library/react';

import { StepItemNavigation } from './StepItemNavigation';

describe('Switch', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <StepItemNavigation
        orientation={'horizontal'}
        state={'stepProgress'}
        step={0}
      />
    );
    expect(baseElement).toBeTruthy();
  });
});
