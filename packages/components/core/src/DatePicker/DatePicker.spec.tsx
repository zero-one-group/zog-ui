import { render } from '@testing-library/react';

import { DatePicker } from './DatePicker';

describe('DatePicker', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<DatePicker />);
    expect(baseElement).toBeTruthy();
  });
});
