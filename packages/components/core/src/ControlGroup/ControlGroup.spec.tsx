import { render } from '@testing-library/react';

import ControlGroup from './ControlGroup';

describe('ControlGroup', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<ControlGroup />);
    expect(baseElement).toBeTruthy();
  });
});
