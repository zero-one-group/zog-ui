import { useMemo, useState } from 'react';
import { Input } from '../Input';
import { styled } from '../stitches.config';
import CascaderColumn from './CascaderColumn';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgCascaderActive: colorScheme
      ? `$colors-${colorScheme}4`
      : '$colors-primary4',
  };
};

const StyledCascader = styled('div', {
  display: 'inline-block',
  position: 'relative',
  boxSizing: 'border-box',
});

const StyledCascaderInput = styled(Input);

const StyledCascaderDropdown = styled('div', {
  position: 'absolute',
  top: 'calc(100% + $1)',
  minHeight: 'auto',
  background: '#FFFF',
  br: '$2',
  boxShadow:
    '0 6px 16px 0 rgb(0 0 0 / 8%), 0 3px 6px -4px rgb(0 0 0 / 12%), 0 9px 28px 8px rgb(0 0 0 / 5%);',
});

const StyledCascaderMenus = styled('div', {
  display: 'flex',
  alignItems: 'flex-start',
});

export type CascaderOption = {
  value: string | number | null;
  label: React.ReactNode;
  disabled?: boolean;
  children?: CascaderOption[];
};

export interface CascaderProps {
  options: CascaderOption[];
  defaultValue?: string[];
  colorScheme?: string;
  trigger?: 'click' | 'hover';
}

export const Cascader = ({
  colorScheme,
  options,
  defaultValue,
  trigger = 'click',
  ...props
}: CascaderProps) => {
  const [activeValues, setActiveValues] = useState<string[]>(
    defaultValue || []
  );

  const columns = useMemo(() => {
    const columnList = [{ options }];
    let currentOption = options;
    activeValues.forEach((active) => {
      const currentCell = currentOption.find(
        (option) => option.value === active
      );

      const childrenOption = currentCell?.children;

      if (childrenOption?.length) {
        currentOption = childrenOption;
        columnList.push({ options: currentOption });
      }
    });

    return columnList;
  }, [options, activeValues]);

  const handleChangeCell = (path: string[], isLeaf: boolean) => {
    setActiveValues(path);
  };

  return (
    <StyledCascader
      css={{
        ...getColorSchemeVariants(colorScheme),
      }}
    >
      <StyledCascaderInput type="search" readOnly placeholder="Please Select" />
      <StyledCascaderDropdown>
        <StyledCascaderMenus>
          {columns.map((column, index) => (
            <CascaderColumn
              handleChangeCell={handleChangeCell}
              parentPath={activeValues.slice(0, index)}
              active={activeValues[index]}
              options={column.options}
              trigger={trigger}
            />
          ))}
        </StyledCascaderMenus>
      </StyledCascaderDropdown>
    </StyledCascader>
  );
};

export default Cascader;
