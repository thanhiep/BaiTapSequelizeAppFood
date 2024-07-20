import express from "express";
import userRouter from "./user.router.js";
import resRouter from "./res.router.js";

const rootRouter = express.Router();

rootRouter.use("/user", userRouter);

rootRouter.use("/res", resRouter);

export default rootRouter;
