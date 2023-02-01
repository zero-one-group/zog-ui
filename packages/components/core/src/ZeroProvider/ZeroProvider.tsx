import { ConfigType } from '@stitches/react/types/config';
import { createTheme } from '../stitches.config';

export type ZeroProviderProps = {
  theme?: ConfigType.Theme;
  children?: React.ReactNode;
};

export type ZeroProviderComponent = (
  props: ZeroProviderProps
) => React.ReactElement;

const ZeroProvider: ZeroProviderComponent = ({ theme, children }) => {
  const customTheme = theme ? createTheme(theme) : undefined;

  return <div className={customTheme}>{children}</div>;
};

export default ZeroProvider;
