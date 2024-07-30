import {
    createBrowserRouter,
    RouterProvider,
    ScrollRestoration,
} from "react-router-dom"
import * as exports from "./exports.js"
import "./index.css"

const router = createBrowserRouter([
    {
        path: "/",
        element: (
            <>
                <ScrollRestoration />
                <exports.Landing />
            </>
        ),
        errorElement: <exports.Error404 />,
        children: [
            {
                path: "/",
                element: <exports.Landing />,
            },
        ],
    },
])

export const App = () => {
    return (
        <main
            className={
                "bg-gradient-to-b from-gray-800 to-gray-900 text-pf-light-text " +
                "min-h-[100vh] flex flex-col"
            }
        >
            <RouterProvider router={router} />
        </main>
    )
}
