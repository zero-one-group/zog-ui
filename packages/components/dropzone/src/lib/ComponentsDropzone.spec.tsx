import { render } from '@testing-library/react';

import ComponentsDropzone from './ComponentsDropzone';

describe('ComponentsDropzone', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<ComponentsDropzone />);
    expect(baseElement).toBeTruthy();
  });
});
