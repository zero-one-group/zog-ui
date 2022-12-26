import { render } from '@testing-library/react';

import DesignSystemProvider from './DesignSystemProvider';

describe('DesignSystemProvider', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<DesignSystemProvider />);
    expect(baseElement).toBeTruthy();
  });
});
