import { render } from '@testing-library/react';

import Slider from './Slider';

describe('Slider', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Slider />);
    expect(baseElement).toBeTruthy();
  });
});
