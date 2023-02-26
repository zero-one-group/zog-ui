import { render } from '@testing-library/react';

import { FormItem } from './FormItem';

describe('FormItem', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<FormItem />);
    expect(baseElement).toBeTruthy();
  });
});
