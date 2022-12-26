import { render } from '@testing-library/react';

import Sup from './Sup';

describe('Sup', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Sup />);
    expect(baseElement).toBeTruthy();
  });
});
