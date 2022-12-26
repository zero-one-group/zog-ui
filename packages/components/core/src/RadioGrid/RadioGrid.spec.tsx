import { render } from '@testing-library/react';

import RadioGrid from './RadioGrid';

describe('RadioGrid', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<RadioGrid />);
    expect(baseElement).toBeTruthy();
  });
});
