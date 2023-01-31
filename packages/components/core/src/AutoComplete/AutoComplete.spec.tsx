import { render } from '@testing-library/react';

import AutoComplete from './AutoComplete';

describe('AutoComplete', () => {
  it('should render successfully with no options', () => {
    const { baseElement } = render(<AutoComplete />);
    expect(baseElement).toBeTruthy();
  });
});
