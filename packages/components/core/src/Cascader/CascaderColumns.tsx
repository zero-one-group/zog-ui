import { RightOutlined } from '@ant-design/icons';
import { useState } from 'react';
import { styled } from '../stitches.config';
import { CascaderProps } from './Cascader';

export type CascaderOptionProps = Partial<Pick<CascaderProps, 'options'>> & {
  defaultActive?: number;
};

const StyledCascaderMenu = styled('ul', {
  all: 'unset',
  width: '100%',
  minWidth: '111px',
  height: '180px',
  padding: '$1',
  listStyle: 'none',
});

const StyledCascaderMenuItem = styled('li', {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  gap: '$1',
  cursor: 'pointer',
  overflow: 'hidden',
  textOverflow: 'ellipsis',
  whiteSpace: 'nowrap',
  fontFamily: '$untitled',
  color: '$gray12',
  p: '$1 $2',
  br: '$1',
  '&:hover': {
    backgroundColor: '$gray3',
  },
  variants: {
    active: {
      true: {
        backgroundColor: '$$bgCascaderActive',
        color: '$gray12',
        fontWeight: '600',
      },
    },
  },
});

const StyledCascaderMenuContent = styled('div', {});
const StyledCascaderMenuExpandIcon = styled('div', {
  fontSize: '.7rem',
  color: '$gray9',
});

const CascaderColumns = ({
  options,
  defaultActive = -1,
}: CascaderOptionProps) => {
  const [active, setActive] = useState<number>(defaultActive);

  if (!options) {
    return null;
  }

  const shouldRenderChildren = active >= 0 && !!options[active].children;

  const renderColumn = () => {
    if (shouldRenderChildren) {
      return <CascaderColumns options={options[active].children} />;
    }

    return null;
  };

  return (
    <>
      <StyledCascaderMenu role="menu">
        {options
          ? options.map((option, index) => (
              <StyledCascaderMenuItem
                role="menuitem"
                onClick={() => setActive(index)}
                key={`${option.label}-${index}`}
              >
                <StyledCascaderMenuContent>
                  {option.label}
                </StyledCascaderMenuContent>
                {Array.isArray(option.children) ? (
                  <StyledCascaderMenuExpandIcon>
                    <RightOutlined />
                  </StyledCascaderMenuExpandIcon>
                ) : null}
              </StyledCascaderMenuItem>
            ))
          : null}
      </StyledCascaderMenu>
      {shouldRenderChildren ? renderColumn() : null}
    </>
  );
};

export default CascaderColumns;
