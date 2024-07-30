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
