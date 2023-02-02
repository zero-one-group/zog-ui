import { render } from '@testing-library/react';

import { SearchBox } from './SearchBox';

describe('SearchBox', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<SearchBox />);
    expect(baseElement).toBeTruthy();
  });
});
