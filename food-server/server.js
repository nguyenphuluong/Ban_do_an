const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

app.use(
  "/images",
  express.static("images")
);

const SERVER_IP =
  "10.15.128.213";

// DATABASE GIẢ
let users = [
  {
    username: "admin",
    password: "123456",
  },
];

const foods = [
  {
    id: 1,
    name: "Pizza",
    price: 10,
    image: "pizza.png",
    category: "Italian",
    description:
      "Italian delicious pizza",
  },

  {
    id: 2,
    name: "Biryani",
    price: 12,
    image: "biryani.png",
    category: "Indian",
    description:
      "Indian biryani rice",
  },

  {
    id: 3,
    name: "Chinese Food",
    price: 15,
    image: "chinese.png",
    category: "Chinese",
    description:
      "Chinese traditional food",
  },

  {
    id: 4,
    name: "Dessert",
    price: 8,
    image: "desserts.png",
    category: "Dessert",
    description:
      "Sweet dessert",
  },

  {
    id: 5,
    name: "Mexican Food",
    price: 13,
    image: "mexican.png",
    category: "Mexican",
    description:
      "Mexican spicy food",
  },

  {
    id: 6,
    name: "South Indian",
    price: 11,
    image: "south-indian.png",
    category: "Indian",
    description:
      "South Indian food",
  },

  {
    id: 7,
    name: "North Indian",
    price: 14,
    image: "north-indian.png",
    category: "Indian",
    description:
      "North Indian food",
  },

  {
    id: 8,
    name: "Ice Cream",
    price: 6,
    image: "ice-creams.png",
    category: "Dessert",
    description:
      "Cold ice cream",
  },

  {
    id: 9,
    name: "Banana",
    price: 5,
    image: "banana.png",
    category: "Fruit",
    description:
      "Fresh banana",
  },

  {
    id: 10,
    name: "Beverages",
    price: 4,
    image: "beverages.png",
    category: "Drink",
    description:
      "Cold beverages",
  },
];

// HOME
app.get("/", (req, res) => {
  res.send(
    "Food API Running..."
  );
});

// GET FOODS
app.get("/foods", (req, res) => {

  const result = foods.map(
    (food) => ({
      ...food,

      image: `http://${SERVER_IP}:3000/images/${food.image}`,
    })
  );

  res.json(result);
});

// LOGIN
app.post("/login", (req, res) => {

  const {
    username,
    password,
  } = req.body;

  const user = users.find(
    (u) =>
      u.username === username &&
      u.password === password
  );

  if (user) {

    return res.json({
      success: true,
      message: "Login Success",

      user: {
        username:
          user.username,
      },
    });
  }

  res.status(401).json({
    success: false,
    message:
      "Wrong username or password",
  });
});

// REGISTER
app.post(
  "/register",
  (req, res) => {

    const {
      username,
      password,
    } = req.body;

    // CHECK EXIST
    const existedUser =
      users.find(
        (u) =>
          u.username ===
          username
      );

    if (existedUser) {

      return res.status(400).json({
        success: false,

        message:
          "Username already exists",
      });
    }

    // ADD USER
    users.push({
      username,
      password,
    });

    res.json({
      success: true,
      message:
        "Register Success",
    });
  }
);

app.listen(3000, "0.0.0.0", () => {

  console.log(
    "================================="
  );

  console.log(
    "SERVER RUNNING"
  );

  console.log(
    "LOCAL:   http://localhost:3000"
  );

  console.log(
    `NETWORK: http://${SERVER_IP}:3000`
  );

  console.log(
    "================================="
  );
});