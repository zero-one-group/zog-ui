import { render } from '@testing-library/react';

import CircleBar from './CircleBar';

describe('ProgressBar', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<CircleBar value={0} />);
    expect(baseElement).toBeTruthy();
  });
});
