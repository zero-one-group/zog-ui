import { render } from '@testing-library/react';

import Kbd from './Kbd';

describe('Kbd', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Kbd />);
    expect(baseElement).toBeTruthy();
  });
});
