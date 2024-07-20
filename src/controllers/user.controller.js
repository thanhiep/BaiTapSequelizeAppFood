import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/response.js";

const model = initModels(sequelize);

const getUser = async (req, res) => {
  let data = await model.users.findAll({});

  responseData(data, "Thành công", 200, res);
};

const getLikeByUser = async (req, res) => {
  const { userId } = req.params;

  let data = await model.users.findOne({
    where: {
      user_id: userId,
    },
    include: ["like_res"],
  });

  responseData(data, "Thành công", 200, res);
};

const getRateByUser = async (req, res) => {
  const { userId } = req.params;

  let data = await model.users.findOne({
    where: {
      user_id: userId,
    },
    include: ["rate_res"],
  });

  responseData(data, "Thành công", 200, res);
};

const likeByUser = async (req, res) => {
  let { user_id, res_id } = req.body;

  let checkUserId = await model.users.findByPk(user_id);
  let checkResId = await model.restaurants.findByPk(res_id);

  let checkId = await model.like_res.findOne({
    where: {
      user_id,
      res_id,
    },
  });

  if (checkId) {
    await model.like_res.destroy({
      where: {
        user_id,
        res_id,
      },
    });

    responseData("", "Đã unlike", 200, res);
  } else if (checkUserId) {
    if (checkResId) {
      let newData = {
        user_id,
        res_id,
        date_like: new Date(),
      };

      await model.like_res.create(newData);
      responseData("", "Đã like", 200, res);
    } else {
      responseData("", "Nhà hàng không tồn tại !", 400, res);
    }
  } else {
    responseData("", "Người dùng không tồn tại !", 400, res);
  }
};

const rateByUser = async (req, res) => {
  let { user_id, res_id, amount } = req.body;

  let checkUserId = await model.users.findByPk(user_id);
  let checkResId = await model.restaurants.findByPk(res_id);

  let checkId = await model.rate_res.findOne({
    where: {
      user_id,
      res_id,
    },
  });

  let newData = {
    user_id,
    res_id,
    amount,
    date_rate: new Date(),
  };
  if (checkId) {
    await model.rate_res.update(newData, {
      where: {
        user_id,
        res_id,
      },
    });

    responseData("", "Đã đánh giá lại", 200, res);
  } else if (checkUserId) {
    if (checkResId) {
      await model.rate_res.create(newData);

      responseData("", "Đã đánh giá", 200, res);
    } else {
      responseData("", "Nhà hàng không tồn tại !", 400, res);
    }
  } else {
    responseData("", "Người dùng không tồn tại !", 400, res);
  }
};


let orderCode = "ORDER016";
const orderByUser = async (req, res) => {
  let { user_id, food_id, amount } = req.body;

  let checkUserId = await model.users.findByPk(user_id);
  let checkFoodId = await model.restaurants.findByPk(food_id);

  function incrementOrderCode(orderCode) {
    const prefix = orderCode.match(/[a-zA-Z]+/)[0];
    const number = orderCode.match(/\d+/)[0];
    const incrementedNumber = (parseInt(number, 10) + 1)
      .toString()
      .padStart(number.length, "0");
    return prefix + incrementedNumber;
  }

  orderCode = incrementOrderCode(orderCode);

  let newData = {
    user_id,
    food_id,
    amount,
    code: orderCode,
    arr_sub_id: "[]",
  };

  if (checkUserId) {
    if (checkFoodId) {
      await model.orders.create(newData);
      responseData("", "Order thành công", 200, res);
    } else {
      responseData("", "Món ăn không tồn tại !", 400, res);
    }
  } else {
    responseData("", "Người dùng không tồn tại !", 400, res);
  }
};

export {
  getUser,
  getLikeByUser,
  getRateByUser,
  likeByUser,
  rateByUser,
  orderByUser,
};
