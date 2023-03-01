import clsx from 'clsx';
import { ComponentProps, createContext, ReactNode, useContext } from 'react';
import { styled } from '../stitches.config';

const StyedBreadcrumb = styled('nav', {
  boxSizing: 'border-box',
});

const StyedBreadcrumbWrapper = styled('ol', {
  boxSizing: 'border-box',
  display: 'flex',
  flexWrap: 'wrap',
  alignItems: 'center',
  gap: '$1',
  listStyle: 'none',
  paddingLeft: 0,
  margin: 0,
  fontFamily: '$untitled',
});

const StyledBreadcrumbItem = styled('li', {
  display: 'inline',
  '& > *': {
    color: '$gray9',
  },
  '& > span': {
    marginLeft: '$1',
  },
  '&:last-child': {
    color: '$gray12',
    '& > span': {
      display: 'none',
    },
  },
});

const StyledBreadcrumbItemSeparator = styled('span', {
  color: '$gray9',
});

export type BreadcrumbSeparator = ReactNode;

export type BreadcrumbProps = {
  separator?: BreadcrumbSeparator;
  children: ReactNode[];
} & ComponentProps<typeof StyedBreadcrumb>;

export type BreadcrumbItemProps = {
  children: ReactNode;
} & ComponentProps<typeof StyledBreadcrumbItem>;

export type BreadcrumbSeparatorProps = {
  children: ReactNode;
} & ComponentProps<typeof StyledBreadcrumbItemSeparator>;

export type BreadcrumbContextProps = {
  separator: BreadcrumbSeparator;
};

const BreadcrumbContext = createContext<BreadcrumbContextProps>({
  separator: '/',
});

export const Breadcrumb = ({
  separator = '/',
  children,
  className,
  ...props
}: BreadcrumbProps) => {
  return (
    <BreadcrumbContext.Provider value={{ separator }}>
      <StyedBreadcrumb
        aria-label="Breadcrumb"
        className={clsx('breadcrumb', className)}
        {...props}
      >
        <StyedBreadcrumbWrapper className="breadcrumb-wrapper">
          {children}
        </StyedBreadcrumbWrapper>
      </StyedBreadcrumb>
    </BreadcrumbContext.Provider>
  );
};

export const BreadcrumbSeparator = ({
  children,
  className,
  ...props
}: BreadcrumbItemProps) => {
  return (
    <StyledBreadcrumbItemSeparator
      className={clsx('breadcrumb-separator', className)}
      {...props}
    >
      {children}
    </StyledBreadcrumbItemSeparator>
  );
};

export const BreadcrumbItem = ({
  children,
  className,
  ...props
}: BreadcrumbItemProps) => {
  const { separator } = useContext(BreadcrumbContext);
  return (
    <StyledBreadcrumbItem
      className={clsx('breadcrumb-item', className)}
      {...props}
    >
      {children}
      {separator ? (
        <BreadcrumbSeparator>{separator}</BreadcrumbSeparator>
      ) : null}
    </StyledBreadcrumbItem>
  );
};
