#!/bin/bash

# Variables from the environment
APP_NAME=${MODULE_REACT_APP_NAME:-startout-react-app}
USE_TYPESCRIPT=${MODULE_REACT_USE_TYPESCRIPT:-false}
USE_TAILWIND=${MODULE_REACT_USE_TAILWIND:-true}

# Create a new React project with or without TypeScript based on the environment variable
if [ "$USE_TYPESCRIPT" = "true" ]; then
  npx create-react-app $APP_NAME --template typescript
else
  npx create-react-app $APP_NAME
fi

cd $APP_NAME

############## Dependencies ##############
# Install Prettier, ESLint, and necessary plugins
npm install --save-dev prettier eslint-config-prettier eslint-plugin-prettier
npm install --save-dev react-router-dom
##########################################

# Install Tailwind CSS if the environment variable is set to true
if [ "$USE_TAILWIND" = "true" ]; then
  npm install --save-dev tailwindcss postcss autoprefixer
  npx tailwindcss init -p

  # Replace the contents of the main CSS file with Tailwind CSS imports
  echo "@tailwind base;" > src/index.css
  echo "@tailwind components;" >> src/index.css
  echo "@tailwind utilities;" >> src/index.css
fi

# Create Prettier configuration file
cat <<EOT > .prettierrc
{
  "semi": false,
  "singleQuote": true,
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
npx json -I -f package.json -e 'this.scripts.lint="eslint \"src/**/*.{js,ts,tsx}\""'
npx json -I -f package.json -e 'this.scripts.format="prettier --write \"src/**/*.{js,jsx,ts,tsx,json,css,md}\""'


########### Here is where the configuration tailored to StartOut organization begins ###########

# Create new directories and file in the src folder
mkdir src/assets src/components src/pages src/redux src/pages/landing src/pages/error404
touch src/exports.js src/pages/landing/landing.jsx src/pages/error404/error404.jsx
touch src/components/header/header.jsx src/components/footer/footer.jsx

# If TypeScript is not being used, replace the content of App.js
if [ "$USE_TYPESCRIPT" = "false" ]; then
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

cat <<EOT > src/pages/landing/landing.jsx
import { NavLink } from "react-router-dom";
import * as exports from "../../exports.js"

export default function Landing() {
    return (
        <div className="flex flex-col justify-center flex-grow text-center mt-[5vh]">
            <h1 className="text-4xl font-bold text-gray-200 mb-12 mt-8 select-none">Welcome to StartOut!</h1>
        </div>
    );
}
EOT

cat <<EOT > src/pages/error404/error404.jsx
import { NavLink } from 'react-router-dom';

export default function Error404 () {
    return (
        <div className="fixed inset-0 flex items-center justify-center p-5 bg-gray-900 bg-opacity-50">
            <div className={"flex flex-col items-center text-center select-none " +
                "bg-gradient-to-b from-gray-800 to-gray-600 px-4 py-10 rounded-lg shadow-xl"}>
                <h1
                    className={"text-8xl font-extrabold text-transparent bg-clip-text " +
                        "bg-gradient-to-r from-gray-300 to-gray-400"}
                >
                    404
                </h1>
                <p className="mt-3 mb-5 text-xl font-semibold text-gray-200 shadow-md p-3 rounded-lg bg-opacity-50 bg-black">
                    Oops! The page you're looking for isn't here.
                </p>
                <NavLink
                    to="/"
                    className={"bg-pf-setting text-gray-100 font-bold py-3 px-6 rounded-full " +
                        "hover:bg-pf-setting-h select-none cursor-pointer"}
                >
                    <div
                    >
                        🏠 Take Me Home
                    </div>
                </NavLink>
            </div>
        </div>
    );
}
EOT

cat <<EOT > src/exports.js
import Landing from "./pages/landing/landing";
import Error404 from "./pages/error404/error404";

export { Landing, Error404 };
EOT
fi
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
