import { type VariantProps, tv } from 'tailwind-variants'
import { buttonStyles } from './button.css'

export const calendarStyles = tv({
  slots: {
    base: 'p-3',
    months: 'flex flex-col space-y-4 sm:flex-row sm:space-x-4 sm:space-y-0',
    month: 'space-y-4',
    caption: 'relative flex items-center justify-center pt-1',
    caption_label: 'font-medium text-sm',
    nav: 'flex items-center space-x-1',
    nav_button: [
      buttonStyles({ variant: 'outline' }).toString(),
      'size-7 bg-transparent p-0 opacity-50 hover:opacity-100',
    ],
    nav_button_previous: 'absolute left-1',
    nav_button_next: 'absolute right-1',
    table: 'w-full border-collapse space-y-1',
    head_row: 'flex',
    head_cell: 'w-8 rounded-md font-normal text-[0.8rem] text-muted-foreground',
    row: 'mt-2 flex w-full',
    cell: [
      'relative p-0 text-center text-sm focus-within:relative focus-within:z-20',
      '[&:has([aria-selected])]:bg-accent',
      '[&:has([aria-selected].day-outside)]:bg-accent/50',
      '[&:has([aria-selected].day-range-end)]:rounded-r-md',
    ],
    cell_range: [
      '[&:has(>.day-range-end)]:rounded-r-md',
      '[&:has(>.day-range-start)]:rounded-l-md',
      'first:[&:has([aria-selected])]:rounded-l-md',
      'last:[&:has([aria-selected])]:rounded-r-md',
    ],
    cell_single: '[&:has([aria-selected])]:rounded-md',
    day: [
      buttonStyles({ variant: 'ghost' }).toString(),
      'h-8 w-8 p-0 font-normal aria-selected:opacity-100',
    ],
    day_range_start: 'day-range-start',
    day_range_end: 'day-range-end',
    day_selected:
      'bg-primary text-primary-foreground hover:bg-primary hover:text-primary-foreground focus:bg-primary focus:text-primary-foreground',
    day_today: 'bg-accent text-accent-foreground',
    day_outside:
      'day-outside text-muted-foreground aria-selected:bg-accent/50 aria-selected:text-muted-foreground',
    day_disabled: 'text-muted-foreground opacity-50',
    day_range_middle: 'aria-selected:bg-accent aria-selected:text-accent-foreground',
    day_hidden: 'invisible',
    icon: 'size-4',
  },
  defaultVariants: {},
})

export type CalendarVariants = VariantProps<typeof calendarStyles>
