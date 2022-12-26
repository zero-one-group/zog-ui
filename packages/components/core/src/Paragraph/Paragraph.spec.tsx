import { render } from '@testing-library/react';

import Paragraph from './Paragraph';

describe('Paragraph', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Paragraph />);
    expect(baseElement).toBeTruthy();
  });
});
