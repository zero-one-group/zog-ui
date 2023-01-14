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
      <Box as="a" href="https://google.com">
        Render as anchor element
      </Box>
    );

    expect(getByRole('link')).toBeInTheDocument();
  });
});
