import { render } from '@testing-library/react';

import VerifiedBadge from './VerifiedBadge';

describe('VerifiedBadge', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<VerifiedBadge />);
    expect(baseElement).toBeTruthy();
  });
});
