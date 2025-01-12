import { Button } from '@repo/ui-solid/button'
import { createSignal } from 'solid-js'

export default function Page() {
  const [count, setCount] = createSignal(0)

  return (
    <div class="flex min-h-screen items-center bg-gradient-to-br from-cyan-700 to-slate-800 text-white">
      <div class="container mx-auto px-4 py-16">
        {/* Logo Section */}
        <div class="mb-12 flex justify-center space-x-8">
          <a
            href="https://vite.dev"
            target="_blank"
            rel="noreferrer"
            class="transition-opacity hover:opacity-80"
          >
            <img src="/vite.svg" class="h-16 w-16" alt="Vite logo" />
          </a>
          <a
            href="https://www.solidjs.com"
            target="_blank"
            rel="noreferrer"
            class="transition-opacity hover:opacity-80"
          >
            <img src="/solid.svg" class="h-16 w-16" alt="Solid.js logo" />
          </a>
        </div>

        {/* Content Section */}
        <div class="text-center">
          <h1 class="mb-8 bg-gradient-to-r from-indigo-300 to-purple-600 bg-clip-text font-bold text-4xl text-transparent">
            Docs App
          </h1>

          <div class="mx-auto mb-8 max-w-lg rounded-xl bg-slate-800/50 p-8 shadow-lg">
            <Button type="button" variant="destructive" onClick={() => setCount(count() + 1)}>
              Count is {count()}
            </Button>

            <p class="mt-4 text-slate-300">
              Edit <code class="rounded bg-slate-700 px-2 py-1 text-sm">apps/docs/src/app.tsx</code>{' '}
              and save to test HMR
            </p>
          </div>

          <div class="space-y-2 text-slate-400">
            <p>Click on the Vite and Solid.js logos to learn more</p>
          </div>
        </div>
      </div>
    </div>
  )
}
