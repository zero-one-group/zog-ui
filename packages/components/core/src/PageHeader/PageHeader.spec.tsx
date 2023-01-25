import { render } from '@testing-library/react';

import { PageHeader } from './PageHeader';

describe('PageHeader', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<PageHeader />);
    expect(baseElement).toBeTruthy();
  });
  it('should render title subtitle extra successfully', () => {
    const { baseElement, getByText } = render(
      <PageHeader
        title="Page Title"
        subtitle="Page Subtitle"
        extra="Heading Extra"
      />
    );
    expect(baseElement).toBeTruthy();
    expect(getByText('Page Title')).toBeInTheDocument();
    expect(getByText('Page Subtitle')).toBeInTheDocument();
    expect(getByText('Heading Extra')).toBeInTheDocument();
  });
});
