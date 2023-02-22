import { render } from '@testing-library/react';

import { Form } from './Form';

describe('Form', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Form />);
    expect(baseElement).toBeTruthy();
  });
});
