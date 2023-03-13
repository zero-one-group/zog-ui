import { render } from '@testing-library/react';

import Collapse from './Collapse';

describe('Anchor', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Collapse header="this is panel" content="this is content"></Collapse>
    );
    expect(baseElement).toBeTruthy();
  });
});
