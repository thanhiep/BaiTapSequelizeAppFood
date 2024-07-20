import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js"
import {responseData} from "../config/response.js"

const model = initModels(sequelize)

const getRes = async (req,res)=>{
    let data = await model.restaurants.findAll({})

    responseData(data, "Thành công",200,res)
}

const getLikeByRes = async(req,res)=>{
    const {resId} = req.params

    let data = await model.restaurants.findOne({
        where:{
            res_id: resId
        },
        include:["like_res"]
    })

    responseData(data, "Thành công",200,res)
}

export {getRes,getLikeByRes}