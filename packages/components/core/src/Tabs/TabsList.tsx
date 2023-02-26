import { ReactNode, useEffect, useRef, useState } from 'react';
import * as TabsPrimitive from '@radix-ui/react-tabs';
import { styled } from '../stitches.config';
import type * as Stitches from '@stitches/react';

type TabsListProps = {
  children: ReactNode;
  css?: Stitches.CSS;
} & Stitches.VariantProps<typeof StyledTabsList>;

const StyledTabsList = styled(TabsPrimitive.List, {
  gap: '24px',
  display: 'flex',
  minHeight: '25px',
  width: '100%',
  overflow: 'scroll',
  '&::-webkit-scrollbar': {
    display: 'none' /* Safari and Chrome */,
  },
  borderBottom: '1px solid $gray9',
  variants: {
    position: {
      left: {
        justifyContent: 'flex-start',
      },
      right: {
        justifyContent: 'flex-end',
      },
      center: {
        justifyContent: 'center',
      },
      apart: {
        justifyContent: 'space-between',
      },
    },
    type: {
      card: {
        button: {
          backgroundColor: '$gray1',
          padding: '9px 16px',
          border: '1px solid $gray9',
          '&[data-state=active]': {
            boxShadow: 'none',
          },
        },
        borderBottom: '0',
        '&::before,&::after': {
          display: 'none',
        },
      },
    },
    isScrollHorizontal: {
      true: {
        '&::before': {
          position: 'absolute',
          top: '0',
          content: '"..."',
          right: '0',
          color: '$gray12',
          backgroundColor: '$gray1',
          textAlign: 'center',
          width: '46px',
          height: '26px',
          boxShadow: '0px 0px 1px 0px $colors$blackA11',
        },
      },
    },
    isScrollVertical: {
      true: {
        '&::after': {
          position: 'sticky',
          content: '"..."',
          backgroundColor: '$gray1',
          textAlign: 'center',
          width: '100%',
          height: '26px',
          color: '$gray12',
          bottom: '0',
          boxShadow: '1px -1px 3px 1px $colors$blackA11',
        },
      },
    },
  },
  '&[data-orientation=vertical]': {
    flexDirection: 'column',
    borderBottom: '0',
    height: '300px',
    borderRight: '1px solid $gray9',
    width: 'auto',
  },
  defaultVariants: {
    position: 'left',
  },
});

export const TabsList = ({
  children,
  position,
  type,
  ...props
}: TabsListProps) => {
  const tabPaneRef = useRef<HTMLDivElement>(null);
  const [isScrollHorizontal, setIsScrollHorizontal] = useState(false);
  const [isScrollVertical, setIsScrollVertical] = useState(false);
  useEffect(() => {
    if (tabPaneRef.current) {
      setIsScrollHorizontal(
        tabPaneRef.current.scrollWidth > tabPaneRef.current.clientWidth
      );
    }
  }, [tabPaneRef, setIsScrollHorizontal]);
  useEffect(() => {
    if (tabPaneRef.current) {
      setIsScrollVertical(
        tabPaneRef.current.scrollHeight > tabPaneRef.current.clientHeight
      );
    }
  }, [tabPaneRef, setIsScrollVertical]);
  return (
    <StyledTabsList
      ref={tabPaneRef}
      type={type}
      position={position}
      isScrollHorizontal={isScrollHorizontal}
      isScrollVertical={isScrollVertical}
      {...props}
    >
      {children}
    </StyledTabsList>
  );
};

export default TabsList;
