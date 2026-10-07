import { userController } from "../controller/userController.js";
import { Router } from "express";

console.log("chegando no Router")

const userRouter = Router()

userRouter.get('/user/:id', userController.getById)
userRouter.post('/user/login', userController.login)

export default userRouter