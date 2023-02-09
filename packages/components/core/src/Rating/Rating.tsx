import { styled } from '../stitches.config';
import { StarIcon, StarIconProps } from './StarIcon';
import type * as Stitches from '@stitches/react';

export type RatingProps = React.ComponentPropsWithoutRef<'div'> &
  StarIconProps & {
    fill?: string;
    css?: Stitches.CSS;
  };

const StyledRatingItem = styled('div', {
  width: 'fit-content',
  'input[type=radio]': {
    appearance: 'none',
  },
  'input[type=radio]:checked ~ label svg': {
    fill: '$gray9',
  },
  '&:hover label svg': {
    fill: '$orange9 !important',
  },

  'input[type=radio]:hover ~ label svg': {
    fill: '$gray9 !important',
  },
  label: {
    cursor: 'pointer',
  },
  svg: {
    fill: '$orange9',
  },
});

export const Rating = ({
  id,
  name,
  defaultValue,
  icon,
  star,
  halfStar,
  ...props
}: RatingProps) => {
  return (
    <StyledRatingItem {...props}>
      <StarIcon
        halfStar={halfStar}
        star={star}
        defaultValue={defaultValue}
        icon={icon}
        id={id}
        name={name}
      />
    </StyledRatingItem>
  );
};
