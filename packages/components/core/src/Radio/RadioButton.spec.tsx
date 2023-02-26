import { render } from '@testing-library/react';

import RadioButton from './RadioButton';

describe('Radio', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <RadioButton name="list" label="HTML" id="web" />
    );
    expect(baseElement).toBeTruthy();
  });
});
