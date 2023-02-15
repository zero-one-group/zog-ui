import { render } from '@testing-library/react';

import List from './List';

describe('List', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<List />);
    expect(baseElement).toBeTruthy();
  });
});
