import { render } from '@testing-library/react';

import Anchor from './Anchor';

describe('Anchor', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Anchor />);
    expect(baseElement).toBeTruthy();
  });
});
