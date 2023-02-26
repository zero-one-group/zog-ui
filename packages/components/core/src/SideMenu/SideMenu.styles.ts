import { DownOutlined } from '@ant-design/icons';
import * as RadixAccordion from '@radix-ui/react-accordion';
import { styled } from '../stitches.config';

export const StyledSideMenuRoot = styled('ul', {
  height: '100%',
  width: '256px',
  padding: 4,
  display: 'flex',
  justifyContent: 'center',
  flexDirection: 'column',
  gap: 4,
});

export const StyledSideMenuItem = styled('li', {
  listStyle: 'none',
  color: '$gray12',
  '& ul': {
    padding: 0,
    display: 'flex',
    justifyContent: 'center',
    flexDirection: 'column',
    gap: 4,
  },
  '& > button': {
    width: '100%',
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    gap: 4,
  },
});

export const StyledSideMenuSub = styled(
  RadixAccordion.Item,
  StyledSideMenuItem
);

export const StyledSideMenuSubTrigger = styled(RadixAccordion.Trigger);

export const StyledSideMenuItemContent = styled('div', {
  display: 'flex',
  alignItems: 'center',
  gap: 4,
});

export const StyledSideMenuDownIcon = styled(DownOutlined, {
  color: '$gray12',
  transition: 'transform 100ms cubic-bezier(0.87, 0, 0.13, 1)',
  '[data-state=open] > &': { transform: 'rotate(180deg)' },
});

export const StyledSideMenuSubContent = styled(RadixAccordion.Content, {
  display: 'flex',
  flexDirection: 'column',
  gap: 4,
  '& li': {
    paddingLeft: 10,
  },
});
