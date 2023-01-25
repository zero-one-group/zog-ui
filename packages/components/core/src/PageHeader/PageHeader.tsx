import { ComponentProps, ReactElement, ReactNode } from 'react';
import { styled } from '../stitches.config';
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Breadcrumb, BreadcrumbProps } from '../Breadcrumb';
import { Avatar } from '../Avatar';

const StyledPageHeader = styled('div', {
  boxSizing: 'border-box',
  fontFamily: '$untitled',
  padding: '16px 24px',
});

const StyledHeading = styled('div', {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  flexWrap: 'wrap',
  gap: '$1',
  minHeight: 32,
});
const StyledHeadingLeft = styled('div', {
  display: 'flex',
  alignItems: 'center',
});
const StyledHeadingTitle = styled('span', {
  fontSize: '$4',
  fontWeight: '500',
  whiteSpace: 'nowrap',
  overflow: 'hidden',
  textOverflow: 'ellipsis',
  mr: '$2',
});
const StyledHeadingSubtitle = styled('span', {
  fontSize: '$2',
  color: '$gray10',
  whiteSpace: 'nowrap',
  overflow: 'hidden',
  textOverflow: 'ellipsis',
  mr: '$2',
});
const StyledHeadingExtra = styled('div', {
  whiteSpace: 'nowrap',
});

const StyledPageHeaderBack = styled('div', {
  fontSize: '$3',
  mr: '$2',
});
const StyledPageHeaderBackButton = styled('div', {
  fontSize: '$3',
  display: 'inline-block',
  background: 'transparent',
  cursor: 'pointer',
});

const StyledPageHeaderAvatar = styled(Avatar, {
  mr: '$2',
});

const StyledPageHeaderContent = styled('div', {
  pt: '$2',
});

type PageHeaderOwnProps = {
  title?: ReactNode;
  subtitle?: ReactNode;
  extra?: ReactNode;
  onBack?: () => void;
  backIcon?: ReactNode;
  breadcrumb?: BreadcrumbProps;
  avatar?: ComponentProps<typeof Avatar>;
};

export type PageHeaderProps = ComponentProps<typeof StyledPageHeader>;

export type PageHeaderComponent = (
  props: PageHeaderOwnProps & PageHeaderProps
) => ReactElement;

export const PageHeader: PageHeaderComponent = ({
  children,
  title,
  subtitle,
  extra,
  onBack,
  backIcon,
  breadcrumb,
  avatar,
  ...props
}) => (
  <StyledPageHeader {...props}>
    {breadcrumb && <Breadcrumb {...breadcrumb} />}
    <StyledHeading
      css={{
        mt: breadcrumb ? '$2' : undefined,
      }}
    >
      <StyledHeadingLeft>
        {onBack && (
          <StyledPageHeaderBack>
            <StyledPageHeaderBackButton role="button" onClick={onBack}>
              {backIcon ?? <ArrowLeftOutlined />}
            </StyledPageHeaderBackButton>
          </StyledPageHeaderBack>
        )}
        {avatar && <StyledPageHeaderAvatar size="3" {...avatar} />}
        <StyledHeadingTitle>{title}</StyledHeadingTitle>
        <StyledHeadingSubtitle>{subtitle}</StyledHeadingSubtitle>
      </StyledHeadingLeft>
      {extra && <StyledHeadingExtra>{extra}</StyledHeadingExtra>}
    </StyledHeading>
    {children && <StyledPageHeaderContent>{children}</StyledPageHeaderContent>}
  </StyledPageHeader>
);
