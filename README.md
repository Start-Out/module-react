# StartOut React Project

Welcome to the StartOut React project. This project is set up with a comprehensive configuration including Prettier, ESLint, Tailwind CSS, and a sample folder structure to get you started quickly.

---

## Folder Structure

Here is an overview of the folder structure in this project:

```
.
├─ public
│  └─ favicon.ico
├─ src
│  ├─ assets
│  ├─ components
│  │  ├─ footer
│  │  │  └─ footer.jsx
│  │  ├─ header
│  │  │  └─ header.jsx
│  ├─ pages
│  │  ├─ landing
│  │  │  └─ landing.jsx
│  │  ├─ error404
│  │  │  └─ error404.jsx
│  ├─ redux
│  ├─ exports.js
│  ├─ App.js
│  ├─ index.js
│  └─ index.css
├─ .env
├─ .eslintrc.json
├─ .gitignore
├─ .prettierignore
├─ .prettierrc
├─ package.json
├─ postcss.config.cjs
├─ tailwind.config.js
└─ README.md
```

---

### Description of the Key Directories and Files

- **public/**: Contains static assets such as the favicon.
- **src/**: Main source directory for the project.
   - **assets/**: Contains images, fonts, and other static assets.
   - **components/**: Contains reusable React components.
      - **header/**: Header component (`header.jsx`).
      - **footer/**: Footer component (`footer.jsx`).
   - **pages/**: Contains page components.
      - **landing/**: Landing page component (`landing.jsx`).
      - **error404/**: 404 error page component (`error404.jsx`).
   - **redux/**: Contains Redux related files (if applicable).
   - **exports.js**: Exports file for centralizing component exports.
   - **App.js**: Main App component which sets up the router.
   - **index.js**: Entry point for React DOM rendering.
   - **index.css**: Main CSS file, configured to use Tailwind CSS.
- **.env**: Environment variables.
- **.eslintrc.json**: ESLint configuration file.
- **.gitignore**: Specifies intentionally untracked files to ignore.
- **.prettierignore**: Specifies files and directories to ignore by Prettier.
- **.prettierrc**: Configuration file for Prettier.
- **package.json**: Lists project dependencies and scripts.
- **postcss.config.cjs**: Configuration file for PostCSS.
- **tailwind.config.js**: Configuration file for Tailwind CSS.
- **README.md**: This file.

---

## Setup and Usage

### Option 1: Clone the Repository

First, clone the repository and install the dependencies:

```bash
git clone https://github.com/yourusername/startout-react-app.git
cd startout-react-app
npm install
```
---
## Option 2: Use the Setup Script

This script automates the setup of a new React project, optionally including TypeScript. It installs necessary dependencies, configures Prettier and ESLint, adds useful scripts to `package.json`, and sets up Tailwind CSS. It also organizes the project structure by creating directories and files for components, assets, and pages.

### Prerequisites

- Node.js and npm must be installed on your machine.

### Features

- **TypeScript Support**: Optionally creates a TypeScript-based project.
- **Tailwind CSS Setup**: Integrates Tailwind CSS.
- **Prettier Configuration**: Sets up Prettier for code formatting.
- **ESLint Configuration**: Configures ESLint for linting based on best practices and integrates with Prettier.
- **Directory Structure**: Automatically creates directories and files for a standard project setup.
- **Routing**: Configures react-router-dom for routing in the application.
- **Scripts for Linting and Formatting**: Adds custom scripts for linting and formatting to `package.json`.

### Usage

1. Make the script executable: `chmod +x setup_react.sh`


2. Execute the script: `./setup_react.sh`


### Environment Variables

The script uses the following environment variables to customize the project setup (more will be added in the future):

- `MODULE_REACT_APP_NAME`: Sets the application name (default: `startout-react-app`).
- `MODULE_REACT_USE_TYPESCRIPT`: Enables TypeScript if set to true (default: false).

---

### Running the Development Server

To start the development server: `npm start`

This will run your app in development mode. Open `http://localhost:3000` to view it in the browser.

---

### Building for Production

To build the app for production:`npm run build`

This will create an optimized build of the app in the `build` folder.

---

### Linting and Formatting

To check for code quality issues: `npm run lint`

To format the code: `npm run format`

---

## Custom Configuration

This project comes with a set of predefined configurations for ESLint, Prettier, and Tailwind CSS. You can customize these configurations by editing their respective files:

- `.eslintrc.json`
- `.prettierrc`
- `tailwind.config.js`
- `postcss.config.cjs`

---

## Adding New Pages and Components

- **Pages**: Add new page components in the `src/pages` directory. Follow the existing structure for consistency.
- **Components**: Add reusable components in the `src/components` directory.