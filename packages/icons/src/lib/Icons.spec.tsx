import { render } from '@testing-library/react';

import Icons from './Icons';

describe('Icons', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Icons />);
    expect(baseElement).toBeTruthy();
  });
});
