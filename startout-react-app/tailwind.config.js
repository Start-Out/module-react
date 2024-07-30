/** @type {import(tailwindcss).Config} */
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
}
