import express from "express"
import { getLikeByUser, getRateByUser, getUser, likeByUser, orderByUser, rateByUser } from "../controllers/user.controller.js"

const userRouter = express.Router()

userRouter.get("/get-user",getUser)

userRouter.get("/get-user-like/:userId",getLikeByUser)

userRouter.get("/get-user-rate/:userId",getRateByUser)

userRouter.post("/user-like",likeByUser)

userRouter.post("/user-rate",rateByUser)

userRouter.post("/user-order",orderByUser)

export default userRouter