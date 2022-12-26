import { render } from '@testing-library/react';

import Sub from './Sub';

describe('Sub', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Sub />);
    expect(baseElement).toBeTruthy();
  });
});
