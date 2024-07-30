#!/bin/bash

# Variables from the environment
APP_NAME=${MODULE_REACT_APP_NAME:-startout-react-app}
USE_TYPESCRIPT=${MODULE_REACT_USE_TYPESCRIPT:-false}

# Create a new React project with or without TypeScript based on the environment variable
npx create-react-app $APP_NAME --template typescript

cd $APP_NAME

############## Dependencies ##############
# Install Prettier, ESLint, and necessary plugins
npm install --save-dev prettier eslint-config-prettier eslint-plugin-prettier
npm install --save-dev react-router-dom
##########################################

# Install Tailwind CSS if the environment variable is set to true
npm install --save-dev tailwindcss postcss autoprefixer
npx tailwindcss init -p

# Replace the contents of the main CSS file with Tailwind CSS imports
echo "@tailwind base;" > src/index.css
echo "@tailwind components;" >> src/index.css
echo "@tailwind utilities;" >> src/index.css

echo '/** @type {import(tailwindcss).Config} */
module.exports = {
    content: ["./src/**/*.{html,js,jsx,ts,tsx}"], theme: {
        extend: {
            colors: {
                "primary-main": "#D57B1D", "primary-light": "#ffac28", "primary-dark": "#955614",
                "secondary-main": "", "secondary-light": "", "secondary-dark": "",
                "accent-main": "", "accent-light": "", "accent-dark": "",
                "neutral-main": "#443A3F", "neutral-light": "#ffffef", "neutral-dark": "#221d1f",
                "success-main": "", "success-light": "", "success-dark": "",
                "warning-main": "", "warning-light": "", "warning-dark": "",
                "error-main": "", "error-light": "", "error-dark": "",
                "info-main": "", "info-light": "", "info-dark": "",
                "tertiary-main": "", "tertiary-light": "", "tertiary-dark": "",
                "background-primary": "", "background-secondary": "", "background-accent": "",
                "border-primary": "", "border-secondary": "", "border-accent": "",
                "text-primary": "", "text-secondary": "", "text-muted": "",
                "hover-primary": "", "active-primary": "", "disabled-primary": "",
            }

        },
    }, plugins: [],
}' > tailwind.config.js

# Create Prettier configuration file
cat <<EOT > .prettierrc
{
  "semi": false,
  "singleQuote": false,
  "trailingComma": "all",
  "printWidth": 80,
  "tabWidth": 4
}
EOT

# Create Prettier ignore file
cat <<EOT > .prettierignore
node_modules
build
EOT

# Create ESLint configuration file
cat <<EOT > .eslintrc.json
{
  "extends": [
    "react-app",
    "plugin:prettier/recommended"
  ],
  "plugins": ["prettier"],
  "rules": {
    "prettier/prettier": "error"
  }
}
EOT

# Update package.json to add lint and format scripts
curl -L https://gist.githubusercontent.com/HlaKarki/850999ba95b1df6d54f70b4a2c51cf08/raw/706427dc11f49da6759c6d60f887e3fbb5896e91/update-package-json.js -o update-package-json.js
node update-package-json.js


########### Here is where the configuration tailored to StartOut organization begins ###########

# Create new directories and file in the src folder
mkdir src/assets src/components src/pages src/redux src/pages/landing src/pages/error404
mkdir src/components/header src/components/footer
touch src/exports.js src/pages/landing/landing.jsx src/pages/error404/error404.jsx
touch src/components/header/header.jsx src/components/footer/footer.jsx

cat <<EOT > src/App.js
import { createBrowserRouter, RouterProvider, ScrollRestoration } from "react-router-dom";
import * as exports from "./exports.js";
import "./index.css"

const router = createBrowserRouter([
    {
        path: "/",
        element: (
            <><ScrollRestoration /><exports.Landing /></>
        ),
        errorElement: <exports.Error404 />,
        children: [
            {
                path: "/",
                element: <exports.Landing />
            }
        ]
    }
])

export const App = () => {
    return (
        <main
            className={"bg-gradient-to-b from-gray-800 to-gray-900 text-pf-light-text " +
                "min-h-[100vh] flex flex-col"}
        >
            <RouterProvider router={router}/>
        </main>
    );
};
EOT

cat <<EOT > src/index.js
import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'
import { App } from './App'
import reportWebVitals from './reportWebVitals'

const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>,
)

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals()
EOT

cat <<EOT > src/pages/landing/landing.jsx
export default function Landing() {
    return (
        <div className="bg-neutral-main h-screen w-screen text-neutral-light">
            <h1 className="h-screen flex justify-center items-center text-6xl">
                Welcome to StartOut!
            </h1>
        </div>
    )
}
EOT

cat <<EOT > src/pages/error404/error404.jsx
import { NavLink } from "react-router-dom"

export default function Error404() {
    return (
        <div className="bg-neutral-main fixed inset-0 flex items-center justify-center p-5 ">
            <div
                className={
                    "bg-neutral-dark bg-opacity-50 py-10 px-8 rounded-md text-neutral-light flex flex-col gap-4"
                }
            >
                <h1 className={"text-4xl"}>Error 404 :(</h1>
                <p className="">
                    Oops! The page you're looking for isn't here.
                </p>
                <button className={"bg-primary-main p-2 rounded-md"}>
                    <NavLink to="/" className={""}>
                        <div>🏠 Take Me Home</div>
                    </NavLink>
                </button>
            </div>
        </div>
    )
}
EOT

cat <<EOT > src/exports.js
import Landing from "./pages/landing/landing";
import Error404 from "./pages/error404/error404";

export { Landing, Error404 };
EOT

#######################################

# Run format and lint scripts
npm run format
npm run lint

# Print detailed instructions
cat <<EOT

Setup complete. Here are the commands you can now use:

1. Navigate to your project directory:
  \`cd my-app\`

2. Start the development server:
  \`npm start\`
  This command runs your app in development mode.

3. Build the app for production:
  \`npm run build\`
  This command builds the app for production to the \`build\` folder.

4. Lint the code:
  \`npm run lint\`
  This command runs ESLint on your source files. It will check for code quality issues and display them in the console.

5. Format the code:
  \`npm run format\`
  This command runs Prettier on your source files. It will format your code according to the rules specified in the Prettier configuration.

Happy coding at StartOut!

EOT
