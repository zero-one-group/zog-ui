import { render } from '@testing-library/react';

import { Breadcrumb } from './Breadcrumb';

describe('Breadcrumb', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Breadcrumb
        items={[
          { title: 'Mantine', href: '#', current: false },
          { title: 'Mantine hooks', href: '#', current: false },
          { title: 'use-id', href: '#', current: true },
        ]}
        separator="/"
      />
    );
    expect(baseElement).toBeTruthy();
  });
});
