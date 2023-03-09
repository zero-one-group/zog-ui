import { render } from '@testing-library/react';

import { Box } from './Box';

describe('Box', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Box />);
    expect(baseElement).toBeTruthy();
  });

  it('should have correct text', () => {
    const { getByText } = render(<Box>It's Box</Box>);

    expect(getByText("It's Box")).toBeInTheDocument();
  });

  it('should render anchor element', () => {
    const { getByRole } = render(
      <Box asChild>
        <a href="https://google.com">Render as anchor element</a>
      </Box>
    );

    expect(getByRole('link')).toBeInTheDocument();
  });
  it('should render className on the child element', () => {
    const className = 'google-link';
    const { container } = render(
      <Box asChild className={className}>
        <a href="https://google.com">Render as anchor element</a>
      </Box>
    );
    // targeting the box
    expect(container.firstChild).toHaveClass(className);
  });
});
