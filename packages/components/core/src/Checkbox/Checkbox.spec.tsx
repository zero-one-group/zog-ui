import { render } from '@testing-library/react';

import { Checkbox } from './Checkbox';

describe('Checkbox', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Checkbox />);
    expect(baseElement).toBeTruthy();
  });
  it('should has check element when checked', () => {
    const { getByRole } = render(<Checkbox checked />);
    expect(getByRole('checkbox').hasChildNodes()).toBe(true);
  });
  it('should has disabled attribute when checkbox disabled', () => {
    const { getByRole } = render(<Checkbox checked disabled />);
    expect(getByRole('checkbox')).toHaveAttribute('disabled');
  });
});
