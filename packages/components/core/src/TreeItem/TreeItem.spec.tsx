import { render } from '@testing-library/react';

import TreeItem from './TreeItem';

describe('TreeItem', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<TreeItem />);
    expect(baseElement).toBeTruthy();
  });
});
