/* @refresh reload */
import { render } from 'solid-js/web'
import App from './app'

// Import the Tailwind CSS styles.
import '@repo/core-ui/tailwind.css'
import './main.css'

// The root element for the app.
const rootElement = document.getElementById('app')

if (!rootElement) {
  throw new Error(
    "Root element not found. Check if it's in your index.html or if the id is correct."
  )
}

render(() => <App />, rootElement)
