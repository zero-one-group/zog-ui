export function getInitialFromName(name: string = ''): string {
  if (!name) {
    return '';
  }
  const words = name.split(' ');
  return words.map((word) => word[0]).join('');
}
