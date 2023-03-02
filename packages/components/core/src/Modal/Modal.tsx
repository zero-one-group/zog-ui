import {
  CheckCircleOutlined,
  CloseCircleOutlined,
  ExclamationCircleOutlined,
  InfoCircleOutlined,
} from '@ant-design/icons';
import * as Dialog from '@radix-ui/react-dialog';
import { keyframes } from '@stitches/react';
import { ComponentProps, createContext, ReactNode, useContext } from 'react';
import { Space } from '../Space';
import { CSS, styled } from '../stitches.config';

const overlayShow = keyframes({
  '0%': { opacity: 0 },
  '100%': { opacity: 1 },
});

const contentShow = keyframes({
  '0%': { opacity: 0, transform: 'translate(-50%, -48%) scale(.96)' },
  '100%': { opacity: 1, transform: 'translate(-50%, -50%) scale(1)' },
});

const ModalOverlay = styled(Dialog.Overlay, {
  backgroundColor: '$blackA9',
  position: 'fixed',
  inset: 0,
  animation: `${overlayShow} 150ms cubic-bezier(0.16, 1, 0.3, 1)`,
});

const ModalContent = styled(Dialog.Content, {
  fontFamily: '$untitled',
  backgroundColor: 'white',
  borderRadius: 6,
  boxShadow:
    'hsl(206 22% 7% / 35%) 0px 10px 38px -10px, hsl(206 22% 7% / 20%) 0px 10px 20px -15px',
  position: 'fixed',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  width: '90vw',
  maxWidth: '450px',
  maxHeight: '85vh',
  padding: 25,
  animation: `${contentShow} 150ms cubic-bezier(0.16, 1, 0.3, 1)`,
  '&:focus': { outline: 'none' },
});

const DialogTitle = styled(Dialog.Title, {
  position: 'relative',
  margin: 0,
  fontWeight: 500,
  color: '$gray12',
  fontSize: '1rem',
});

const DialogDescription = styled(Dialog.Description, {
  margin: '10px 0 20px',
  color: '$mauve11',
  fontSize: 15,
  lineHeight: 1.5,
});

const IconButton = styled('button', {
  all: 'unset',
  fontFamily: 'inherit',
  cursor: 'pointer',
  borderRadius: '4px',
  height: 25,
  width: 25,
  display: 'inline-flex',
  alignItems: 'center',
  justifyContent: 'center',
  color: '$gray10',
  position: 'absolute',
  top: 0,
  right: 0,
  transition: 'all 0.2s linear',
  '&:hover': { backgroundColor: '$gray4', color: '$gray12' },
  '&:focus': { boxShadow: `0 0 0 2px $gray10` },
});

const IntentIcon = styled('div', {
  fontSize: '22px',
  marginRight: '1rem',
  variants: {
    intent: {
      info: {
        color: '$blue9',
      },
      error: {
        color: '$red9',
      },
      success: {
        color: '$green9',
      },
      warning: {
        color: '$yellow9',
      },
    },
  },
});

const ContentWithIntent = styled('div', {
  flex: 1,
});

const ModalTitle = styled(DialogTitle, {
  variants: {
    withIntent: {
      true: {
        marginTop: '5px',
      },
    },
  },
});

export type ModalIntentState =
  | 'info'
  | 'success'
  | 'warning'
  | 'error'
  | 'default';

export type ModalContextProps = {
  intent: ModalIntentState;
};

const ModalContext = createContext<ModalContextProps>({
  intent: 'default',
});

export function Modal({ children, ...props }: Dialog.DialogProps) {
  return <Dialog.Root {...props}>{children}</Dialog.Root>;
}

Modal.Trigger = ({ children, ...props }: Dialog.DialogTriggerProps) => {
  return (
    <Dialog.Trigger asChild {...props}>
      {children}
    </Dialog.Trigger>
  );
};

export type ModalContent = {
  intent?: ModalIntentState;
  infoIcon?: ReactNode;
  successIcon?: ReactNode;
  warningIcon?: ReactNode;
  errorIcon?: ReactNode;
  overlayCss?: CSS;
} & Dialog.DialogContentProps;

Modal.Content = ({
  children,
  intent = 'default',
  infoIcon,
  successIcon,
  warningIcon,
  errorIcon,
  overlayCss,
  ...props
}: ModalContent) => {
  const renderIntentIcons = (intent: ModalIntentState) => {
    switch (intent) {
      case 'info':
        return infoIcon ? infoIcon : <InfoCircleOutlined />;
      case 'success':
        return successIcon ? successIcon : <CheckCircleOutlined />;
      case 'error':
        return errorIcon ? errorIcon : <CloseCircleOutlined />;
      case 'warning':
        return warningIcon ? warningIcon : <ExclamationCircleOutlined />;
    }
  };

  return (
    <ModalContext.Provider value={{ intent }}>
      <Dialog.Portal>
        <ModalOverlay css={{ ...overlayCss }} />
        <ModalContent {...props}>
          {intent !== 'default' ? (
            <Space>
              <IntentIcon intent={intent}>
                {renderIntentIcons(intent)}
              </IntentIcon>
              <ContentWithIntent>{children}</ContentWithIntent>
            </Space>
          ) : (
            children
          )}
        </ModalContent>
      </Dialog.Portal>
    </ModalContext.Provider>
  );
};

Modal.Close = ({ children, ...props }: Dialog.DialogCloseProps) => {
  return (
    <Dialog.Close asChild {...props}>
      {children}
    </Dialog.Close>
  );
};

type ModalCloseIconProps = { children: ReactNode };

Modal.CloseIcon = ({ children }: ModalCloseIconProps) => {
  return (
    <Modal.Close>
      <IconButton aria-label="Close">{children}</IconButton>
    </Modal.Close>
  );
};

Modal.Title = ({ children, ...props }: ComponentProps<typeof ModalTitle>) => {
  // eslint-disable-next-line react-hooks/rules-of-hooks
  const { intent } = useContext(ModalContext);
  return (
    <ModalTitle withIntent={intent !== 'default'} {...props}>
      {children}
    </ModalTitle>
  );
};

Modal.Description = DialogDescription;
