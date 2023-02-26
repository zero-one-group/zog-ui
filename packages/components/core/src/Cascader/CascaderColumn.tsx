import { RightOutlined } from '@ant-design/icons';
import { useMemo } from 'react';
import { styled } from '../stitches.config';
import { CascaderOption, CascaderProps } from './Cascader';

const StyledCascaderMenu = styled('ul', {
  all: 'unset',
  width: '100%',
  minWidth: '111px',
  height: '180px',
  padding: '$1',
  listStyle: 'none',
  backgroundColor: '$gray1',
});

const StyledCascaderMenuItem = styled('li', {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  gap: '$1',
  cursor: 'pointer',
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
    disabled: {
      true: {
        backgroundColor: '$gray1',
        color: '$gray6',
        pointerEvents: 'none',
        '&:hover': {
          backgroundColor: '$gray1',
        },
      },
    },
  },
});

const StyledCascaderMenuContent = styled('div', {
  overflow: 'hidden',
  textOverflow: 'ellipsis',
  whiteSpace: 'nowrap',
  fontFamily: '$untitled',
});

const StyledCascaderMenuExpandIcon = styled('div', {
  fontSize: '.7rem',
  color: '$gray9',
});

export type CascaderColumnProps = {
  options: CascaderOption[];
  parentPath: string[];
  handleChangeCell: (path: string[], isLeaf: boolean) => void;
  active: string;
  trigger: CascaderProps['trigger'];
};

const CascaderColumn = ({
  options,
  parentPath,
  handleChangeCell,
  active,
  trigger,
}: CascaderColumnProps) => {
  const optionList = useMemo(
    () =>
      options.map(({ children, disabled, label, value }) => {
        const isLeaf = !Array.isArray(children);

        const path: string[] = [...parentPath, value as string];
        const pathString = path.join('/');
        const isActive = value === active;

        return {
          children,
          label,
          value,
          path,
          pathString,
          isLeaf,
          isActive,
          isDisabled: disabled,
        };
      }),
    [options, parentPath, active]
  );

  return (
    <StyledCascaderMenu role="menu">
      {optionList
        ? optionList.map(
            ({ pathString, path, label, isDisabled, isLeaf, isActive }) => (
              <StyledCascaderMenuItem
                key={pathString}
                role="menuitem"
                onClick={() => handleChangeCell(path, isLeaf)}
                onMouseEnter={() => {
                  if (trigger === 'hover' && !isLeaf) {
                    handleChangeCell(path, isLeaf);
                  }
                }}
                title={label as string}
                disabled={isDisabled}
                active={isActive}
              >
                <StyledCascaderMenuContent>{label}</StyledCascaderMenuContent>
                {!isLeaf ? (
                  <StyledCascaderMenuExpandIcon>
                    <RightOutlined />
                  </StyledCascaderMenuExpandIcon>
                ) : null}
              </StyledCascaderMenuItem>
            )
          )
        : null}
    </StyledCascaderMenu>
  );
};

export default CascaderColumn;
