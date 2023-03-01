import { render } from '@testing-library/react';

import { Breadcrumb, BreadcrumbItem } from './Breadcrumb';

describe('Breadcrumb', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Breadcrumb>
        <BreadcrumbItem>zero-one-group</BreadcrumbItem>
        <BreadcrumbItem>zero-one-software</BreadcrumbItem>
        <BreadcrumbItem>zog-design-system</BreadcrumbItem>
      </Breadcrumb>
    );
    expect(baseElement).toBeTruthy();
  });
});
