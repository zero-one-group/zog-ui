import { CaretDownOutlined } from '@ant-design/icons';
import * as RadixMenu from '@radix-ui/react-navigation-menu';
import { ComponentProps, forwardRef } from 'react';
import { keyframes, styled } from '../stitches.config';
import { RemoveAsProps } from '../types';

const enterFromRight = keyframes({
  from: { transform: 'translateX(200px)', opacity: 0 },
  to: { transform: 'translateX(0)', opacity: 1 },
});

const enterFromLeft = keyframes({
  from: { transform: 'translateX(-200px)', opacity: 0 },
  to: { transform: 'translateX(0)', opacity: 1 },
});

const exitToRight = keyframes({
  from: { transform: 'translateX(0)', opacity: 1 },
  to: { transform: 'translateX(200px)', opacity: 0 },
});

const exitToLeft = keyframes({
  from: { transform: 'translateX(0)', opacity: 1 },
  to: { transform: 'translateX(-200px)', opacity: 0 },
});

const scaleIn = keyframes({
  from: { transform: 'rotateX(-30deg) scale(0.9)', opacity: 0 },
  to: { transform: 'rotateX(0deg) scale(1)', opacity: 1 },
});

const scaleOut = keyframes({
  from: { transform: 'rotateX(0deg) scale(1)', opacity: 1 },
  to: { transform: 'rotateX(-10deg) scale(0.95)', opacity: 0 },
});

const fadeIn = keyframes({
  from: { opacity: 0 },
  to: { opacity: 1 },
});

const fadeOut = keyframes({
  from: { opacity: 1 },
  to: { opacity: 0 },
});

const StyledMenuRoot = styled(RadixMenu.Root, {
  position: 'relative',
  display: 'flex',
  justifyContent: 'center',
  width: '100vw',
  zIndex: 1,
});

const StyledMenuList = styled(RadixMenu.List, {
  $$shadowBlack: '$colors$blackA7',
  display: 'flex',
  justifyContent: 'center',
  backgroundColor: 'white',
  padding: 4,
  borderRadius: 6,
  listStyle: 'none',
  boxShadow: '0 2px 10px $$shadowBlack',
  margin: 0,
  fontFamily: '$untitled',
});

const StyledMenuTrigger = styled(RadixMenu.Trigger, {
  all: 'unset',
  fontFamily: '$untitled',
  $$shadowViolet: '$colors$violet7',
  padding: '8px 12px',
  outline: 'none',
  userSelect: 'none',
  fontWeight: 500,
  lineHeight: 1,
  borderRadius: 4,
  fontSize: 15,
  color: '$violet11',
  '&:focus': { boxShadow: '0 0 0 2px $shadowViolet' },
  '&:hover': { backgroundColor: '$violet3' },
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'space-between',
  gap: 2,
});

const StyledMenuLink = styled(RadixMenu.Link, {
  $$shadowViolet: '$colors$violet7',
  padding: '8px 12px',
  outline: 'none',
  userSelect: 'none',
  fontWeight: 500,
  borderRadius: 4,
  color: '$violet11',
  '&:focus': { boxShadow: '0 0 0 2px $$shadowViolet' },
  '&:hover': { backgroundColor: '$violet3' },
  display: 'block',
  textDecoration: 'none',
  fontSize: 15,
  lineHeight: 1,
});

const StyledMenuContent = styled(RadixMenu.Content, {
  position: 'absolute',
  top: 0,
  left: 0,
  width: '100%',
  '@media only screen and (min-width: 600px)': { width: 'auto' },
  animationDuration: '250ms',
  animationTimingFunction: 'ease',
  '&[data-motion="from-start"]': { animationName: enterFromLeft },
  '&[data-motion="from-end"]': { animationName: enterFromRight },
  '&[data-motion="to-start"]': { animationName: exitToLeft },
  '&[data-motion="to-end"]': { animationName: exitToRight },
});

const StyledMenuIndicator = styled(RadixMenu.Indicator, {
  display: 'flex',
  alignItems: 'flex-end',
  justifyContent: 'center',
  height: 10,
  top: '100%',
  overflow: 'hidden',
  zIndex: 1,
  transition: 'width, transform 250ms ease',
  '&[data-state="visible"]': { animation: `${fadeIn} 200ms ease` },
  '&[data-state="hidden"]': { animation: `${fadeOut} 200ms ease` },
});

const StyledMenuViewport = styled(RadixMenu.Viewport, {
  position: 'relative',
  transformOrigin: 'top center',
  marginTop: 10,
  width: '100%',
  backgroundColor: 'white',
  borderRadius: 6,
  overflow: 'hidden',
  boxShadow:
    'hsl(206 22% 7% / 35%) 0px 10px 38px -10px, hsl(206 22% 7% / 20%) 0px 10px 20px -15px',
  height: 'var(--radix-navigation-menu-viewport-height)',
  transition: 'width, height, 300ms ease',
  '&[data-state="open"]': { animation: `${scaleIn} 200ms ease` },
  '&[data-state="closed"]': { animation: `${scaleOut} 200ms ease` },
  '@media only screen and (min-width: 600px)': {
    width: 'var(--radix-navigation-menu-viewport-width)',
  },
});

const StyledMenuContentList = styled('ul', {
  display: 'grid',
  padding: 22,
  margin: 0,
  columnGap: 10,
  listStyle: 'none',
  variants: {
    layout: {
      single: {
        width: 500,
        gridTemplateColumns: '1fr',
      },
      one: {
        '@media only screen and (min-width: 600px)': {
          width: 500,
          gridTemplateColumns: '.75fr 1fr',
        },
      },
      two: {
        '@media only screen and (min-width: 600px)': {
          width: 600,
          gridAutoFlow: 'column',
          gridTemplateRows: 'repeat(3, 1fr)',
        },
      },
    },
  },
  defaultVariants: {
    layout: 'one',
  },
});

const StyledMenuContentListItemLink = styled('a', {
  fontFamily: '$untitled',
  $$shadowViolet: '$colors$violet7',
  display: 'block',
  outline: 'none',
  textDecoration: 'none',
  userSelect: 'none',
  padding: 12,
  borderRadius: 6,
  fontSize: 15,
  lineHeight: 1,
  '&:focus': { boxShadow: '0 0 0 2px $$shadowViolet' },
  '&:hover': { backgroundColor: '$mauve3' },
});

const StyledMenuContentListItemHeading = styled('div', {
  fontWeight: 500,
  lineHeight: 1.2,
  marginBottom: 5,
  color: '$violet12',
});

const StyledMenuContentListItemText = styled('p', {
  all: 'unset',
  fontFamily: '$untitled',
  color: '$mauve11',
  lineHeight: 1.4,
  fontWeight: 'initial',
});

const StyledMenuViewportPosition = styled('div', {
  position: 'absolute',
  display: 'flex',
  justifyContent: 'center',
  width: '100%',
  top: '100%',
  left: 0,
  perspective: '2000px',
});

const StyledMenuCaretDownIcon = styled(CaretDownOutlined, {
  position: 'relative',
  color: '$violet10',
  top: 1,
  transition: 'transform 250ms ease',
  '[data-state=open] &': { transform: 'rotate(-180deg)' },
});

const StyledMenuArrow = styled('div', {
  position: 'relative',
  top: '70%',
  backgroundColor: 'white',
  width: 10,
  height: 10,
  transform: 'rotate(45deg)',
  borderTopLeftRadius: 2,
});

const MenuForwardRef = forwardRef<
  HTMLElement,
  ComponentProps<typeof StyledMenuRoot>
>(({ children, ...props }, ref) => {
  return (
    <StyledMenuRoot ref={ref} {...props}>
      {children}
    </StyledMenuRoot>
  );
});

const MenuContentListItem = forwardRef<
  HTMLAnchorElement,
  RemoveAsProps<ComponentProps<typeof StyledMenuContentListItemLink>>
>(({ children, title, ...props }, ref) => {
  return (
    <li>
      <StyledMenuLink asChild>
        <StyledMenuContentListItemLink {...props} ref={ref}>
          <StyledMenuContentListItemHeading>
            {title}
          </StyledMenuContentListItemHeading>
          <StyledMenuContentListItemText>
            {children}
          </StyledMenuContentListItemText>
        </StyledMenuContentListItemLink>
      </StyledMenuLink>
    </li>
  );
});

export const Menu = Object.assign(MenuForwardRef, {
  List: StyledMenuList,
  Trigger: StyledMenuTrigger,
  Link: StyledMenuLink,
  Content: StyledMenuContent,
  Indicator: StyledMenuIndicator,
  Viewport: StyledMenuViewport,
  ContentList: StyledMenuContentList,
  ContentListItem: MenuContentListItem,
  ContentListItemHeading: StyledMenuContentListItemHeading,
  ContentListItemText: StyledMenuContentListItemText,
  ViewportPosition: StyledMenuViewportPosition,
  CaretDownIcon: StyledMenuCaretDownIcon,
  Arrow: StyledMenuArrow,
  Item: RadixMenu.Item,
});
