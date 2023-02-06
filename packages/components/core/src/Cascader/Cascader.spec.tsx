import { render } from '@testing-library/react';

import Cascader from './Cascader';

describe('Cascader', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Cascader options={[]} />);
    expect(baseElement).toBeTruthy();
  });
});
