import { render } from '@testing-library/react';

import AutoComplete from './AutoComplete';

describe('AutoComplete', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<AutoComplete />);
    expect(baseElement).toBeTruthy();
  });
});
