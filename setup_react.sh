#!/bin/bash

# Create a new React project with TypeScript
npx create-react-app startout-react-app --template typescript

cd startout-react-app

# Install Prettier, ESLint, and necessary plugins
npm install --save-dev prettier eslint-config-prettier eslint-plugin-prettier

# Create Prettier configuration file
cat <<EOT > .prettierrc
{
  "singleQuote": true,
  "trailingComma": "all",
  "printWidth": 80
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
npx json -I -f package.json -e 'this.scripts.format="prettier --write \"src/**/*.{js,ts,tsx,json,css,md}\""'

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