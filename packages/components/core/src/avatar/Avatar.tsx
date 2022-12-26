import * as AvatarPrimitive from '@radix-ui/react-avatar';
import { styled } from '@stitches/react';
import { violet, blackA } from '@radix-ui/colors';
// import { getInitialFromName } from '@zero-ui/helpers';

export interface AvatarProps {
  src?: string;
  alt?: string;
}

const AvatarRoot = styled(AvatarPrimitive.Root, {
  display: 'inline-flex',
  alignItems: 'center',
  justifyContent: 'center',
  verticalAlign: 'middle',
  overflow: 'hidden',
  userSelect: 'none',
  width: 45,
  height: 45,
  borderRadius: '100%',
  backgroundColor: blackA.blackA3,
});

const AvatarImage = styled(AvatarPrimitive.Image, {
  width: '100%',
  height: '100%',
  objectFit: 'cover',
  borderRadius: 'inherit',
});

const AvatarFallback = styled(AvatarPrimitive.Fallback, {
  width: '100%',
  height: '100%',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  backgroundColor: 'white',
  color: violet.violet11,
  fontSize: 15,
  lineHeight: 1,
  fontWeight: 500,
});

export function Avatar({ src, alt }: AvatarProps) {
  // const initial = getInitialFromName(alt || 'Avatar');
  return (
    <AvatarRoot>
      {src && <AvatarImage src={src} alt={alt} />}
      <AvatarFallback delayMs={600}>JD</AvatarFallback>
    </AvatarRoot>
  );
}

export default Avatar;
