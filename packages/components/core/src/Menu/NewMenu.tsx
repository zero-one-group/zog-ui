import { ComponentProps, forwardRef } from 'react';
import { StyledMenuRoot } from './Menu.styles';

export type MenuRootProps = ComponentProps<typeof StyledMenuRoot>;

export const MenuRoot = forwardRef<HTMLElement, MenuRootProps>(
  ({ children, ...props }, ref) => {
    return (
      <StyledMenuRoot ref={ref} {...props}>
        {children}
      </StyledMenuRoot>
    );
  }
);
