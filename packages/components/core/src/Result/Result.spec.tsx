import { render } from '@testing-library/react';

import Result from './Result';

describe('Result', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Result />);
    expect(baseElement).toBeTruthy();
  });
});
