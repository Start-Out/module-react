
# React Project Setup Script

This script automates the setup of a new React project, optionally including TypeScript and Tailwind CSS. It installs necessary dependencies, configures Prettier and ESLint, adds useful scripts to `package.json`, and sets up Tailwind CSS if specified. It also organizes the project structure by creating directories and files for components, assets, and pages.

## Prerequisites

- Node.js and npm must be installed on your machine.

## Features

- TypeScript Support: Optionally creates a TypeScript-based project.
- Tailwind CSS Setup: Integrates Tailwind CSS if enabled.
- Prettier Configuration: Sets up Prettier for code formatting.
- ESLint Configuration: Configures ESLint for linting based on best practices and integrates with Prettier.
- Directory Structure: Automatically creates directories and files for a standard project setup.
- Routing: Configures react-router-dom for routing in the application.
- Scripts for Linting and Formatting: Adds custom scripts for linting and formatting to package.json.

### Usage

1. Make the script executable:
   ```bash
   chmod +x setup_react.sh
   ```

2. Execute the script:
   ```bash
   ./setup_react.sh
   ```

### Environment Variables

The script uses the following environment variables to customize the project setup (more will be added in the future):
- `MODULE_REACT_APP_NAME`: Sets the application name (default: `startout-react-app`).
- `MODULE_REACT_USE_TYPESCRIPT`: Enables TypeScript if set to true (default: false).
- `MODULE_REACT_USE_TAILWIND`: Integrates Tailwind CSS if set to true (default: true).
