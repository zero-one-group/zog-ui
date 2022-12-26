import { render } from '@testing-library/react';

import Overlay from './Overlay';

describe('Overlay', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Overlay />);
    expect(baseElement).toBeTruthy();
  });
});
