import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

/**
 * Combines multiple CSS class values using the `clsx` and `tailwind-merge` libraries.
 *
 * @param args - An array of CSS class values to be combined.
 * @returns The combined CSS class value.
 */
export function clx(...args: ClassValue[]) {
  return twMerge(clsx(...args))
}

/**
 * Gets initials from a full name
 * Example: "John Doe" -> "JD", "Alice" -> "A", "Bob Smith Jones" -> "BS"
 *
 * @param name - Full name to get initials from
 * @param maxInitials - Maximum number of initials to return (default: 2)
 * @returns Uppercase initials from the name
 */
export function getInitials(name: string, maxInitials = 2): string {
  if (!name) return ''
  return name
    .trim()
    .split(' ')
    .map((part) => part[0])
    .filter((char) => char && /[A-Za-z]/.test(char))
    .slice(0, maxInitials)
    .join('')
    .toUpperCase()
}
