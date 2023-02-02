import { render } from '@testing-library/react';

import ZeroProvider from './ZeroProvider';

describe('ZeroProvider', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<ZeroProvider />);
    expect(baseElement).toBeTruthy();
  });
});
