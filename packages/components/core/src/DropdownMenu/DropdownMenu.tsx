import * as RadixDropdown from '@radix-ui/react-dropdown-menu';
import { ComponentProps, ElementType, forwardRef } from 'react';
import { Button } from '../Button';
import { keyframes, styled } from '../stitches.config';
import { PolymorphicComponentPropsWithRef, PolymorphicRef } from '../types';

export function DropdownMenu({
  children,
  ...props
}: RadixDropdown.DropdownMenuProps) {
  return <RadixDropdown.Root {...props}>{children}</RadixDropdown.Root>;
}

type ButtonProps<T extends ElementType> = PolymorphicComponentPropsWithRef<
  T,
  ComponentProps<typeof Button>
>;

const slideUpAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateY(2px)' },
  '100%': { opacity: 1, transform: 'translateY(0)' },
});

const slideRightAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateX(-2px)' },
  '100%': { opacity: 1, transform: 'translateX(0)' },
});

const slideDownAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateY(-2px)' },
  '100%': { opacity: 1, transform: 'translateY(0)' },
});

const slideLeftAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateX(2px)' },
  '100%': { opacity: 1, transform: 'translateX(0)' },
});

const StyledDropdownContent = styled(RadixDropdown.Content, {
  $$shadowLight: '$colors$blue6',
  minWidth: 220,
  backgroundColor: 'white',
  borderRadius: '$3',
  padding: '$3',
  boxShadow:
    '0px 10px 38px -10px $$shadowLight, 0px 10px 20px -15px $$shadowLight',
  animationDuration: '400ms',
  animationTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
  willChange: 'transform, opacity',
  '&[data-state="open"]': {
    '&[data-side="top"]': { animationName: slideDownAndFade },
    '&[data-side="right"]': { animationName: slideLeftAndFade },
    '&[data-side="bottom"]': { animationName: slideUpAndFade },
    '&[data-side="left"]': { animationName: slideRightAndFade },
  },
  zIndex: 1,
});
const StyledDropdownSubContent = styled(
  RadixDropdown.SubContent,
  StyledDropdownContent,
  {
    backgroundColor: '$whiteA12',
  }
);
const StyledDropdownArrow = styled(RadixDropdown.Arrow, {
  fill: 'white',
});
const StyledDropdownItem = styled(RadixDropdown.Item, {
  cursor: 'pointer',
  fontSize: '$2',
  fontFamily: '$untitled',
  color: '$blue11',
  borderRadius: 3,
  display: 'flex',
  alignItems: 'center',
  height: 25,
  padding: '$1 $2',
  position: 'relative',
  userSelect: 'none',
  outline: 'none',

  '&[data-disabled]': {
    color: '$mauve8',
    pointerEvents: 'none',
  },

  '&[data-highlighted]': {
    backgroundColor: '$blue9',
    color: '$blue1',
  },
});
const StyledDropdownCheckboxItem = styled(
  RadixDropdown.CheckboxItem,
  StyledDropdownItem,
  {
    '&[data-state="checked"]': {
      paddingLeft: '$5',
    },
  }
);
const StyledDropdownRadioItem = styled(
  RadixDropdown.RadioItem,
  StyledDropdownItem,
  {
    '&[data-state="checked"]': {
      paddingLeft: '$5',
    },
  }
);
const StyledDropdownSubTrigger = styled(
  RadixDropdown.SubTrigger,
  StyledDropdownItem,
  {
    '&[data-state="open"]': {
      backgroundColor: '$blue9',
      color: '$blue1',
    },
  }
);
const StyledDropdownLabel = styled(RadixDropdown.Label, {
  paddingLeft: '$2',
  fontSize: '$1',
  fontFamily: '$untitled',
  lineHeight: '25px',
  color: '$blue8',
});
const StyledDropdownSeparator = styled(RadixDropdown.Separator, {
  height: 1,
  backgroundColor: '$blue5',
  margin: 5,
});
const StyledDropdownItemIndicator = styled(RadixDropdown.ItemIndicator, {
  position: 'absolute',
  left: 0,
  width: 25,
  display: 'inline-flex',
  alignItems: 'center',
  justifyContent: 'center',
  '& svg': {
    fontSize: '$1',
  },
});
const StyledRightSlot = styled('div', {
  marginLeft: 'auto',
  paddingLeft: 20,
  '[data-highlighted] > &': { color: 'white' },
  '[data-disabled] &': { color: '$mauve8' },
});
const StyledLeftSlot = styled('div', {
  marginRight: '$2',
  '[data-highlighted] > &': { color: 'white' },
  '[data-disabled] &': { color: '$mauve8' },
});

DropdownMenu.Trigger = forwardRef(
  <T extends ElementType = typeof Button>(
    { children, as, css, ...props }: ButtonProps<T>,
    ref?: PolymorphicRef<T>
  ) => {
    return (
      <RadixDropdown.Trigger asChild>
        <Button
          as={as}
          ref={ref}
          css={{
            ...css,
            cursor: 'pointer',
          }}
          {...props}
        >
          {children}
        </Button>
      </RadixDropdown.Trigger>
    );
  }
);

DropdownMenu.Item = StyledDropdownItem;
DropdownMenu.SubContent = StyledDropdownSubContent;
DropdownMenu.Content = StyledDropdownContent;
DropdownMenu.Arrow = StyledDropdownArrow;
DropdownMenu.CheckboxItem = StyledDropdownCheckboxItem;
DropdownMenu.RadioItem = StyledDropdownRadioItem;
DropdownMenu.SubTrigger = StyledDropdownSubTrigger;
DropdownMenu.Label = StyledDropdownLabel;
DropdownMenu.ItemIndicator = StyledDropdownItemIndicator;
DropdownMenu.Separator = StyledDropdownSeparator;
DropdownMenu.RightSlot = StyledRightSlot;
DropdownMenu.LeftSlot = StyledLeftSlot;
DropdownMenu.Content = StyledDropdownContent;
DropdownMenu.Group = RadixDropdown.Group;
DropdownMenu.RadioGroup = RadixDropdown.RadioGroup;
DropdownMenu.Portal = RadixDropdown.Portal;
DropdownMenu.Sub = RadixDropdown.Sub;
