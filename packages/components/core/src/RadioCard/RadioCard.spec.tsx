import { render } from '@testing-library/react';

import RadioCard from './RadioCard';

describe('RadioCard', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<RadioCard />);
    expect(baseElement).toBeTruthy();
  });
});
