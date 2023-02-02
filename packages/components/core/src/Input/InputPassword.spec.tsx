import { render } from '@testing-library/react';

import { InputPassword } from './InputPassword';

describe('InputPassword', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<InputPassword />);
    expect(baseElement).toBeTruthy();
  });
});
