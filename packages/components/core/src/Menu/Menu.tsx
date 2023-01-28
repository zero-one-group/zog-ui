import { CaretDownOutlined } from '@ant-design/icons';
import RadixMenu from '@radix-ui/react-navigation-menu';
import { ComponentProps, forwardRef } from 'react';
import { keyframes, styled } from '../stitches.config';
import { RemoveAsProps } from '../types';

export type MenuChildItems = {
  List?: RemoveAsProps<typeof StyledMenuList>;
  Item?: typeof RadixMenu.Item;
  Trigger?: RemoveAsProps<ComponentProps<typeof StyledMenuTrigger>>;
  Link?: RemoveAsProps<ComponentProps<typeof StyledMenuLink>>;
  Content?: RemoveAsProps<ComponentProps<typeof StyledMenuContent>>;
  Indicator?: RemoveAsProps<ComponentProps<typeof StyledMenuIndicator>>;
  Viewport?: RemoveAsProps<ComponentProps<typeof StyledMenuViewport>>;
  ContentList?: RemoveAsProps<ComponentProps<typeof StyledMenuContentList>>;
  ContentListItemHeading?: RemoveAsProps<
    ComponentProps<typeof StyledMenuContentListItemHeading>
  >;
  ContentListItemText?: RemoveAsProps<
    ComponentProps<typeof StyledMenuContentListItemText>
  >;
  Callout?: RemoveAsProps<ComponentProps<typeof StyledMenuCallout>>;
  CalloutHeading?: RemoveAsProps<
    ComponentProps<typeof StyledMenuCalloutHeading>
  >;
  CalloutText?: RemoveAsProps<ComponentProps<typeof StyledMenuCalloutText>>;
  ViewportPosition?: RemoveAsProps<
    ComponentProps<typeof StyledMenuViewportPosition>
  >;
  CaretDownIcon?: RemoveAsProps<ComponentProps<typeof StyledMenuCaretDownIcon>>;
  Arrow?: RemoveAsProps<ComponentProps<typeof StyledMenuArrow>>;
  ContentListItem?: typeof MenuContentListItem;
};

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
});

const StyledMenuTrigger = styled(RadixMenu.Trigger, {
  all: 'unset',
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
  color: '$mauve11',
  lineHeight: 1.4,
  fontWeight: 'initial',
});

const StyledMenuCallout = styled('a', {
  $$shadowViolet: '$colors$violet7',
  display: 'flex',
  justifyContent: 'flex-end',
  flexDirection: 'column',
  width: '100%',
  height: '100%',
  background: 'linear-gradient(135deg, $purple9 0%, $indigo9 100%);',
  borderRadius: 6,
  padding: 25,
  textDecoration: 'none',
  outline: 'none',
  userSelect: 'none',
  '&:focus': { boxShadow: '0 0 0 2px $$shadowViolet' },
});

const StyledMenuCalloutHeading = styled('div', {
  color: 'white',
  fontSize: 18,
  fontWeight: 500,
  lineHeight: 1.2,
  marginTop: 16,
  marginBottom: 7,
});

const StyledMenuCalloutText = styled('p', {
  all: 'unset',
  color: '$mauve4',
  fontSize: 14,
  lineHeight: 1.3,
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
          {title}
        </StyledMenuContentListItemLink>
        <StyledMenuContentListItemHeading>
          {children}
        </StyledMenuContentListItemHeading>
      </StyledMenuLink>
    </li>
  );
});

export const Menu: typeof MenuForwardRef & MenuChildItems = MenuForwardRef;

Menu.List = StyledMenuList;
Menu.Trigger = StyledMenuTrigger;
Menu.Link = StyledMenuLink;
Menu.Content = StyledMenuContent;
Menu.Indicator = StyledMenuIndicator;
Menu.Viewport = StyledMenuViewport;
Menu.ContentList = StyledMenuContentList;
Menu.ContentListItem = MenuContentListItem;
Menu.ContentListItemHeading = StyledMenuContentListItemHeading;
Menu.ContentListItemText = StyledMenuContentListItemText;
Menu.Callout = StyledMenuCallout;
Menu.CalloutHeading = StyledMenuCalloutHeading;
Menu.CalloutText = StyledMenuCalloutText;
Menu.ViewportPosition = StyledMenuViewportPosition;
Menu.CaretDownIcon = StyledMenuCaretDownIcon;
Menu.Arrow = StyledMenuArrow;
Menu.Item = RadixMenu.Item;
