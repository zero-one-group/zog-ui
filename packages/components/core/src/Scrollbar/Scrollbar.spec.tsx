import { render } from '@testing-library/react';

import Scrollbar from './Scrollbar';

describe('Scrollbar', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Scrollbar />);
    expect(baseElement).toBeTruthy();
  });
});
