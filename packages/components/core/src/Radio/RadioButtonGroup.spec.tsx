import { render } from '@testing-library/react';
import RadioButton from './RadioButton';

import RadioButtonGroup from './RadioButtonGroup';

describe('Radio', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <RadioButtonGroup>
        <RadioButton name="list" id="list-item" label="html" />
      </RadioButtonGroup>
    );
    expect(baseElement).toBeTruthy();
  });
});
