import { render } from '@testing-library/react';
import Tabs from './Tabs';

import TabsContent from './TabsContent';

describe('Tabs', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Tabs>
        <TabsContent value="tab1" />
      </Tabs>
    );
    expect(baseElement).toBeTruthy();
  });
});
