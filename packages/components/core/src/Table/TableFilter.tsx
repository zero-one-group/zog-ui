import * as Popover from '@radix-ui/react-popover';
import { Slot } from '@radix-ui/react-slot';
import { keyframes } from '@stitches/react';
import type { Column, Table } from '@tanstack/react-table';
import { FormEvent, ReactNode, useState } from 'react';
import {
  Button as DefaultButton,
  ButtonGroup as DefaultButtonGroup,
} from '../Button';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$inputBorderColor: colorScheme
      ? `$colors-${colorScheme}9`
      : '$colors-primary9',
  };
};

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

const PopoverContent = styled(Popover.Content, {
  borderRadius: '$2',
  padding: '$2',
  backgroundColor: 'white',
  boxShadow:
    '0 6px 16px 0 rgb(0 0 0 / 8%), 0 3px 6px -4px rgb(0 0 0 / 12%), 0 9px 28px 8px rgb(0 0 0 / 5%);',
  animationDuration: '400ms',
  animationTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
  willChange: 'transform, opacity',
  '&[data-state="open"]': {
    '&[data-side="top"]': { animationName: slideDownAndFade },
    '&[data-side="right"]': { animationName: slideLeftAndFade },
    '&[data-side="bottom"]': { animationName: slideUpAndFade },
    '&[data-side="left"]': { animationName: slideRightAndFade },
  },
  '&:focus': {
    outline: 0,
  },
});

const StyledForm = styled('form', {
  display: 'flex',
  flexDirection: 'column',
  gap: '$1',
});

const StyledInput = styled('input', {
  margin: 0,
  padding: '0 8px',
  border: '1px solid $$inputBorderColor',
  borderRadius: '$1',
  boxSizing: 'border-box',
  outline: 'none',
  appearance: 'none',
  width: '100%',
  height: '31px',
  background: 'transparent',
  '-webkitAppearance': 'none',
});

const ButtonGroup = styled(DefaultButtonGroup, {
  display: 'flex',
  justifyContent: 'space-between',
});

const Button = styled(DefaultButton, {
  width: '80px',
  flex: '0 0 auto',
  cursor: 'pointer',
  variants: {
    ghost: {
      true: {
        border: 'none',
      },
    },
  },
});

type TableFilterProps<T> = {
  column: Column<T, unknown>;
  table: Table<T>;
  children: ReactNode;
  colorScheme?: string;
};

function TableFilter<T>({
  colorScheme,
  column,
  table,
  children,
}: TableFilterProps<T>) {
  const columnFilterValue = column.getFilterValue();
  const [value, setValue] = useState((columnFilterValue ?? '') as string);
  const [open, setOpen] = useState(false);

  const firstValue = table
    .getPreFilteredRowModel()
    .flatRows[0]?.getValue(column.id);

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    column.setFilterValue(value);
    setOpen(false);
  };

  const handleReset = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    column.setFilterValue('');
    setOpen(false);
  };

  const isNumberType = typeof firstValue === 'number';

  return (
    <Popover.Root open={open}>
      <Popover.Trigger asChild>
        <Slot onClick={() => setOpen((open) => !open)}>{children}</Slot>
      </Popover.Trigger>
      <Popover.Portal>
        <PopoverContent
          sideOffset={10}
          align="end"
          css={{ ...getColorSchemeVariants(colorScheme) }}
        >
          <StyledForm onSubmit={handleSubmit} onReset={handleReset}>
            <StyledInput
              type={isNumberType ? 'number' : 'text'}
              value={value}
              onChange={(e) => setValue(e.target.value)}
              placeholder="Search . . ."
            />
            <ButtonGroup>
              <Button colorScheme={colorScheme} intent="primary" type="submit">
                Search
              </Button>
              <Button colorScheme={colorScheme} intent="secondary" type="reset">
                Reset
              </Button>
              <Button
                colorScheme={colorScheme}
                ghost
                type="button"
                onClick={() => setOpen(false)}
              >
                Close
              </Button>
            </ButtonGroup>
          </StyledForm>
        </PopoverContent>
      </Popover.Portal>
    </Popover.Root>
  );
}

export default TableFilter;
