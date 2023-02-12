import { ReactNode, Fragment } from 'react';
import { styled } from '../stitches.config';
export type StarIconProps = {
  star: 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15;
  defaultValue?: number;
  icon: ReactNode;
  name: string;
  id: string;
  halfStar?: boolean;
};
const Star = ({ star, defaultValue, icon, name, id }: StarIconProps) => {
  const starCount = star < 15 ? star : 15;
  const stars = Array.from(Array(starCount).keys()).map((item) => item + 1);
  return (
    <>
      {stars.map((item) => {
        return (
          <Fragment key={`${id}-${item}`}>
            <label htmlFor={`${id}-${item}`}>{icon}</label>
            <input
              type="radio"
              value={item}
              defaultChecked={defaultValue === item}
              name={name}
              id={`${id}-${item}`}
            />
          </Fragment>
        );
      })}
    </>
  );
};

const StyledHalfStar = styled('div', {
  'label:nth-child(4n+3)': {
    marginLeft: '-24px',
  },
  'label:nth-child(4n+1)': {
    clipPath: 'inset(0px 50% 0px 0px)',
  },
});

const HalfStar = ({ star, defaultValue, icon, id, name }: StarIconProps) => {
  const starCount = star < 15 ? star : 15;
  const starArray = Array.from(Array(starCount).keys()).map((item) => item + 1);
  const stars = starArray.flatMap((item) => [item - 0.5, item]);
  return (
    <StyledHalfStar>
      {stars.map((item) => {
        return (
          <Fragment key={`${id}-${item}`}>
            <label htmlFor={`${id}-${item}`}>{icon}</label>
            <input
              type="radio"
              value={item}
              name={name}
              defaultChecked={defaultValue === item}
              id={`${id}-${item}`}
            />
          </Fragment>
        );
      })}
    </StyledHalfStar>
  );
};

export const StarIcon = ({
  halfStar = false,
  defaultValue = 1,
  ...props
}: StarIconProps) => {
  if (halfStar) {
    return <HalfStar defaultValue={defaultValue} {...props} />;
  }
  return <Star {...props} defaultValue={defaultValue} />;
};
