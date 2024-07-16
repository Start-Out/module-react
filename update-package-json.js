const fs = require('fs');
const path = require('path');

// Get the project directory name from the command line arguments
const projectDirName = process.argv[2];

if (!projectDirName) {
    console.error('Please provide the project directory name as an argument.');
    process.exit(1);
}

// Construct the path to package.json using the provided directory name
const packagePath = path.resolve(__dirname, projectDirName, 'package.json');

// Read package.json
let packageJson = {};
try {
    packageJson = JSON.parse(fs.readFileSync(packagePath, 'utf8'));
} catch (error) {
    console.error('Failed to read package.json:', error);
    process.exit(1);
}

// Modify scripts
packageJson.scripts = packageJson.scripts || {};
packageJson.scripts.lint = 'eslint "src/**/*.{js,ts,tsx}"';
packageJson.scripts.format = 'prettier --write "src/**/*.{js,jsx,ts,tsx,json,css,md}"';

// Write package.json
try {
    fs.writeFileSync(packagePath, JSON.stringify(packageJson, null, 2) + '\n', 'utf8');
    console.log('package.json updated successfully.');
} catch (error) {
    console.error('Failed to write package.json:', error);
    process.exit(1);
}
