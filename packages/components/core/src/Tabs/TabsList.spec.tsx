import { render } from '@testing-library/react';

import TabsList from './TabsList';
import Tabs from './Tabs';

describe('Tabs', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Tabs>
        <TabsList>TabList</TabsList>
      </Tabs>
    );
    expect(baseElement).toBeTruthy();
  });
});
