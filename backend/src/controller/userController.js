import { userService } from "../services/userService.js";

export const userController = {
    async getById(req, res){
        try {
            console.log("chegando no controller")
            const getById = await userService.getById(req.params.id)
            res.status(200).json(getById)
        } catch (error) {
            res.status(500).json({ erro: error.message })
        }
    },
    async login(req, res){
        try {
            const login = await userService.login(req.body)

            if(!login) {
                return res.status(401).json({ erro: "Email ou senha invalidos!"})
            }

            res.status(200).json(login)
        } catch (error) {
            res.status(500).json({ erro: error.message })
        }
    }
}