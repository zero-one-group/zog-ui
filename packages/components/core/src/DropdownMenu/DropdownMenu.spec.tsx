import { render } from '@testing-library/react';
import userEvent from '@testing-library/user-event';

import { DropdownMenu } from './DropdownMenu';

describe('DropdownMenu', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<DropdownMenu />);
    expect(baseElement).toBeTruthy();
  });

  it('should show menu item when click dropdown trigger', async () => {
    const { getByRole, findAllByRole, findByRole } = render(
      <DropdownMenu>
        <DropdownMenu.Trigger>Click Me</DropdownMenu.Trigger>
        <DropdownMenu.Portal>
          <DropdownMenu.Content>
            <DropdownMenu.Item>Item 1</DropdownMenu.Item>
            <DropdownMenu.Item>Item 2</DropdownMenu.Item>
          </DropdownMenu.Content>
        </DropdownMenu.Portal>
      </DropdownMenu>
    );

    const triggerButton = getByRole('button', {
      name: 'Click Me',
    });

    await userEvent.click(triggerButton);

    const menu = await findByRole('menu');
    const menuItems = await findAllByRole('menuitem');

    expect(menu).toBeVisible();
    expect(menuItems).toHaveLength(2);
  });
});
