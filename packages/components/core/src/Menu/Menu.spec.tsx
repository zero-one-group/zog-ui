import { render } from '@testing-library/react';
import userEvent from '@testing-library/user-event';

import { Menu } from './Menu';

describe('Menu', () => {
  it('should render successfully', async () => {
    const { baseElement, getAllByRole, getByRole } = render(
      <Menu title="Edit">
        <Menu.Item title="Undo" onClick={() => console.log('Undo')} />
        <Menu.Item title="Redo" disabled />
        <Menu.Item title="Cut" />
        <Menu title="Copy as">
          <Menu.Item title="Text" />
          <Menu.Item title="Video" />
          <Menu title="Image">
            <Menu.Item title=".png" />
            <Menu.Item title=".jpg" />
            <Menu.Item title=".svg" />
            <Menu.Item title=".gif" />
          </Menu>
          <Menu.Item title="Audio" />
        </Menu>
        <Menu title="Share">
          <Menu.Item title="Mail" />
          <Menu.Item title="Instagram" />
        </Menu>
      </Menu>
    );

    const buttonMenu = getByRole('button', {
      name: 'Edit',
    });

    expect(buttonMenu).toBeVisible();

    await userEvent.click(buttonMenu);

    expect(getAllByRole('menuitem')).toHaveLength(5);

    expect(baseElement).toBeTruthy();
  });
});
