import { render } from '@testing-library/react';

import Pagination from './Pagination';

describe('Pagination', () => {
  it('should render successfully', () => {
    const { baseElement } = render(
      <Pagination
        onChange={jest.fn()}
        pageSize={6}
        totalCount={100}
        currentPage={1}
        siblingCount={2}
      />
    );
    expect(baseElement).toBeTruthy();
  });
});
