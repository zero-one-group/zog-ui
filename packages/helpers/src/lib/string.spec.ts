import { getInitialFromName } from './string';

test('getInitial should return the initial of a name', () => {
  const initial = getInitialFromName('Joni Dermawan');
  expect(initial).toBe('JD');
});

test('getInitial should return an empty string if no name is provided', () => {
  const initial = getInitialFromName();
  expect(initial).toBe('');
});
