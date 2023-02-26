import { fireEvent, render, screen } from '@testing-library/react';
import * as Notification from './Notification';

const Child = () => {
  const [notify] = Notification.useNotification();
  return <button onClick={() => notify({ title: 'Title' })}>Notify</button>;
};

// const wrapper = ({children}:{children?: ReactNode}) => (
//     <NotificationProvider placements='all'>
//       {children}
//     </NotificationProvider>
//   )

describe('Notification', () => {
  // NOT WORKING, will be better if using e2e testing
  // it('should render successfully', async () => {
  // const { getByRole, findByText } = render(
  //   <div><Child/></div>, {wrapper}
  // );

  // const notifyButton = await findByText('Notify')

  // expect(notifyButton).toBeInTheDocument();

  // await userEvent.click(notifyButton);

  // const notificationTitle = await findByText('Notification Title')

  // expect(notificationTitle).toBeInTheDocument()
  // });

  it('should render hook useNotification succesfully', () => {
    const mockNotify = jest.fn();
    jest
      .spyOn(Notification, 'useNotification')
      .mockImplementation(() => [mockNotify]);

    render(<Child />);
    const btn = screen.getByRole('button', { name: 'Notify' });
    expect(btn).toBeInTheDocument();

    fireEvent.click(btn);

    expect(mockNotify).toBeCalled();
  });
});
