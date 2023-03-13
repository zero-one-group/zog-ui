import { render } from '@testing-library/react';

import PopConfirm from './PopConfirm';

describe('PopConfirm', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<PopConfirm />);
    expect(baseElement).toBeTruthy();
  });
});
