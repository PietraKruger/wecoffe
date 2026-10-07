import { userRepository } from "../repositories/userRepository.js";

export const userService = {
    async getById(id){
        return await userRepository.findById(id)
    },
    async login(reqUser){
        const { email, senha } = reqUser

        const user = await userRepository.findByEmail(email, senha)
        if(user){
            console.log("Login feito!")
        }
        
        if(!user){
            console.log("Usuario não encontrado")
            return null
        }

        return user
    }
}