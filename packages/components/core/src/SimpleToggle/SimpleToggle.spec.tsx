import { render } from '@testing-library/react';

import SimpleToggle from './SimpleToggle';

describe('SimpleToggle', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<SimpleToggle />);
    expect(baseElement).toBeTruthy();
  });
});
