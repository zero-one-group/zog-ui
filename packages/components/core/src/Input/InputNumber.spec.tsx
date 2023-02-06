import { render } from '@testing-library/react';

import { InputNumber } from './InputNumber';

describe('InputNumber', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<InputNumber />);
    expect(baseElement).toBeTruthy();
  });
});
