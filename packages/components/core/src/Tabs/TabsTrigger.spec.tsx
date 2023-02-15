import { render } from '@testing-library/react';
import Tabs from './Tabs';

import TabsTrigger from './TabsTrigger';
import TabsList from './TabsList';

describe('Tabs', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Tabs>
        <TabsList>
          <TabsTrigger value="tab0">Tabs</TabsTrigger>
        </TabsList>
      </Tabs>
    );
    expect(baseElement).toBeTruthy();
  });
});
