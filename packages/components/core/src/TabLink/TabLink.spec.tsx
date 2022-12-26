import { render } from '@testing-library/react';

import TabLink from './TabLink';

describe('TabLink', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<TabLink />);
    expect(baseElement).toBeTruthy();
  });
});
