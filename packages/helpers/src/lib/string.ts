export function getInitialFromName(name = ''): string {
  if (!name) {
    return '';
  }
  const words = name.split(' ');
  return words.map((word) => word[0]).join('');
}
