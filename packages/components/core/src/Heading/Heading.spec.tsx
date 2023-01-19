import { render } from '@testing-library/react';

import { Heading } from './Heading';

describe('Heading', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Heading />);
    expect(baseElement).toBeTruthy();
  });

  it('should render polymorphic component', () => {
    const { getByRole } = render(
      <Heading as="a" href="https://google.com">
        It's Anchor Component
      </Heading>
    );

    expect(getByRole('link')).toBeInTheDocument();
  });
});
