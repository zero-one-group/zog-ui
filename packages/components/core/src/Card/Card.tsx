import { ComponentProps, ReactNode, useId } from 'react';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme = 'primary') => {
  return {
    $$primaryColor: `$colors-${colorScheme}9`,
  };
};

const Box = styled('div', {
  fontFamily: '$untitled',
  boxSizing: 'border-box',
});

const StyledCard = styled(Box, {
  background: 'white',
  border: 'none',
  margin: 0,
  padding: 0,
  fontSize: '14px',
  borderRadius: '5px',
  overflow: 'hidden',
  boxShadow:
    '0 1px 2px 0 rgb(0 0 0 / 3%), 0 1px 6px -1px rgb(0 0 0 / 2%), 0 2px 4px 0 rgb(0 0 0 / 2%)',
  variants: {
    bordered: {
      true: {
        boxShadow: 'unset',
        border: '1px solid #f0f0f0',
      },
    },
  },
});

const StyledHead = styled(Box, {
  display: 'flex',
  justifyContent: 'center',
  flexDirection: 'column',
  minHeight: '56px',
  marginBottom: '-1px',
  padding: '0 24px',
  color: '$blackA12',
  fontSize: '16px',
  background: 'transparent',
  borderBottom: '1px solid #f0f0f0',
  // borderRadius: 8px 8px 0 0,
});

const StyledTitleWrapper = styled(Box, {
  display: 'flex',
  alignItems: 'center',
});

const StyledTitle = styled('div', {
  fontWeight: '500',
  flex: 1,
});

const StyledExtra = styled('div', {
  fontSize: '14px',
  '& > a': {
    textDecoration: 'none',
  },
  color: '$$primaryColor',
});

const StyledBody = styled(Box, {
  padding: '24px',
});

const StyledCover = styled('div', {
  '&>*': {
    display: 'block',
    width: '100%',
  },
  variants: {
    bordered: {
      true: {
        marginTop: '-1px',
        marginInline: '-1px',
      },
    },
  },
});

const StyledActions = styled('ul', {
  display: 'flex',
  justifyContent: 'center',
  flexDirection: 'row',
  minHeight: '40px',
  margin: 0,
  padding: 0,
  color: '$blackA9',
  fontSize: '16px',
  background: 'transparent',
  borderTop: '1px solid #f0f0f0',
  listStyle: 'none',
});

const StyledActionLi = styled('li', {
  flex: 1,
  margin: '12px 0',
  textAlign: 'center',
  '&:not(:last-child)': {
    borderInlineEnd: '1px solid #f0f0f0',
  },
});

const StyledActionItem = styled('span', {
  position: 'relative',
  display: 'block',
  minWidth: '28px',
  fontSize: '14px',
  lineHeight: '1.5714285714285714',
  cursor: 'pointer',
  '&:hover': {
    color: '$$primaryColor',
  },
});

function isExist(variable: any) {
  return variable !== undefined && variable !== null;
}

type Action = {
  onClick?: ComponentProps<typeof StyledActionItem>['onClick'];
  component: ReactNode;
};

export type CardProps = {
  colorScheme?: string;
  title?: ReactNode;
  extra?: ReactNode;
  cover?: ReactNode;
  actions?: Action[];
} & ComponentProps<typeof StyledCard>;

export function Card({
  bordered = true,
  colorScheme = 'primary',
  css,
  title,
  extra,
  children,
  cover,
  actions,
  ...props
}: CardProps) {
  const uniqId = useId();
  return (
    <StyledCard
      bordered={bordered}
      css={{ ...css, ...getColorSchemeVariants(colorScheme) }}
      {...props}
    >
      {isExist(title) || isExist(extra) ? (
        <StyledHead>
          <StyledTitleWrapper>
            <StyledTitle>{title}</StyledTitle>
            <StyledExtra>{extra}</StyledExtra>
          </StyledTitleWrapper>
        </StyledHead>
      ) : null}
      {cover ? <StyledCover bordered={bordered}>{cover}</StyledCover> : null}
      <StyledBody>{children}</StyledBody>
      {actions && actions?.length > 0 ? (
        <StyledActions>
          {actions.map((action, i) => (
            <StyledActionLi key={`${uniqId}-${i}`}>
              <StyledActionItem onClick={action.onClick}>
                {action.component}
              </StyledActionItem>
            </StyledActionLi>
          ))}
        </StyledActions>
      ) : null}
    </StyledCard>
  );
}

export default Card;
