import express from "express";
import { getLikeByRes, getRes } from "../controllers/res.controller.js";

const resRouter = express.Router();

resRouter.get("/get-res", getRes);

resRouter.get("/get-res-like/:resId", getLikeByRes);

export default resRouter;
