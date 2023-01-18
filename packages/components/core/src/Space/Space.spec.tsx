import { render } from '@testing-library/react';

import { Space } from './Space';

describe('Space', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Space />);
    expect(baseElement).toBeTruthy();
  });
});
