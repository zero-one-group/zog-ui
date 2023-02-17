import { render } from '@testing-library/react';

import { NotificationProvider } from './Notification';

describe('Notification', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<NotificationProvider />);
    expect(baseElement).toBeTruthy();
  });
});
