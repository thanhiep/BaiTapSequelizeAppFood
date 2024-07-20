CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255)
)

INSERT INTO users (full_name, email, password) VALUES 
('Alice Smith', 'alice.smith@example.com', 'password123'),
('Bob Johnson', 'bob.johnson@example.com', 'password123'),
('Carol Williams', 'carol.williams@example.com', 'password123'),
('David Brown', 'david.brown@example.com', 'password123'),
('Emma Davis', 'emma.davis@example.com', 'password123'),
('Frank Miller', 'frank.miller@example.com', 'password123'),
('Grace Wilson', 'grace.wilson@example.com', 'password123'),
('Henry Moore', 'henry.moore@example.com', 'password123'),
('Ivy Taylor', 'ivy.taylor@example.com', 'password123'),
('Jack Anderson', 'jack.anderson@example.com', 'password123'),
('Katie Thomas', 'katie.thomas@example.com', 'password123'),
('Leo Jackson', 'leo.jackson@example.com', 'password123'),
('Mia White', 'mia.white@example.com', 'password123'),
('Nathan Harris', 'nathan.harris@example.com', 'password123'),
('Olivia Martin', 'olivia.martin@example.com', 'password123'),
('Paul Thompson', 'paul.thompson@example.com', 'password123'),
('Quinn Martinez', 'quinn.martinez@example.com', 'password123'),
('Rachel Robinson', 'rachel.robinson@example.com', 'password123'),
('Sam Clark', 'sam.clark@example.com', 'password123'),
('Tina Lewis', 'tina.lewis@example.com', 'password123')

CREATE TABLE restaurants(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255)
)

INSERT INTO restaurants (res_name, image, description) VALUES 
('The Gourmet Kitchen', 'image1.jpg', 'A fine dining experience with international cuisine.'),
('Pizza Palace', 'image2.jpg', 'The best pizzas in town, baked to perfection.'),
('Burger Haven', 'image3.jpg', 'Delicious burgers with a variety of toppings.'),
('Sushi World', 'image4.jpg', 'Fresh and authentic sushi prepared by expert chefs.'),
('Curry Corner', 'image5.jpg', 'A taste of traditional and modern curry dishes.'),
('Taco Fiesta', 'image6.jpg', 'Spicy and flavorful tacos for all tastes.'),
('Pasta Paradise', 'image7.jpg', 'Homemade pasta with rich and savory sauces.'),
('BBQ Barn', 'image8.jpg', 'Smoky and tender BBQ dishes.'),
('Vegan Delights', 'image9.jpg', 'Healthy and delicious vegan meals.'),
('Seafood Shack', 'image10.jpg', 'Fresh seafood dishes with a coastal vibe.')

CREATE TABLE like_res(
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id), 
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	date_like DATE
)

INSERT INTO like_res (user_id, res_id, date_like) VALUES 
(1, 1, '2024-07-01'),
(2, 2, '2024-07-02'),
(3, 3, '2024-07-03'),
(4, 4, '2024-07-04'),
(5, 5, '2024-07-05'),
(6, 6, '2024-07-06'),
(7, 7, '2024-07-07'),
(8, 8, '2024-07-08'),
(9, 9, '2024-07-09'),
(10, 10, '2024-07-10'),
(11, 1, '2024-07-11'),
(12, 2, '2024-07-12'),
(13, 3, '2024-07-13'),
(14, 4, '2024-07-14'),
(15, 5, '2024-07-15'),
(16, 6, '2024-07-16'),
(17, 7, '2024-07-17'),
(18, 8, '2024-07-18'),
(19, 9, '2024-07-19'),
(20, 10, '2024-07-20')

CREATE TABLE rate_res(
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	amount INT,
	date_rate DATE
)

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES 
(1, 1, 4, '2024-07-01'),
(2, 2, 5, '2024-07-02'),
(3, 3, 3, '2024-07-03'),
(4, 4, 5, '2024-07-04'),
(5, 5, 4, '2024-07-05'),
(6, 6, 2, '2024-07-06'),
(7, 7, 5, '2024-07-07'),
(8, 8, 3, '2024-07-08'),
(9, 9, 4, '2024-07-09'),
(10, 10, 5, '2024-07-10'),
(11, 1, 4, '2024-07-11'),
(12, 2, 3, '2024-07-12'),
(13, 3, 5, '2024-07-13'),
(14, 4, 4, '2024-07-14'),
(15, 5, 2, '2024-07-15'),
(16, 6, 3, '2024-07-16'),
(17, 7, 4, '2024-07-17'),
(18, 8, 5, '2024-07-18'),
(19, 9, 3, '2024-07-19'),
(20, 10, 4, '2024-07-20')

CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

INSERT INTO food_type (type_name) VALUES 
('Italian'),
('Chinese'),
('Mexican'),
('Indian'),
('Japanese'),
('American'),
('French'),
('Thai'),
('Greek'),
('Spanish');

CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)

INSERT INTO food (food_name, image, price, description, type_id) VALUES 
('Spaghetti Carbonara', 'carbonara.jpg', 12.99, 'Classic Italian pasta dish with eggs, cheese, pancetta, and pepper.', 1),
('Kung Pao Chicken', 'kungpao.jpg', 9.99, 'Spicy stir-fry dish made with chicken, peanuts, vegetables, and chili peppers.', 2),
('Tacos al Pastor', 'tacos.jpg', 8.99, 'Mexican street tacos with marinated pork and pineapple.', 3),
('Butter Chicken', 'butterchicken.jpg', 11.99, 'Creamy Indian chicken curry with tomatoes and spices.', 4),
('Sushi Platter', 'sushi.jpg', 14.99, 'Assorted fresh sushi and sashimi.', 5),
('Cheeseburger', 'cheeseburger.jpg', 7.99, 'Classic American cheeseburger with lettuce, tomato, and pickles.', 6),
('Croissants', 'croissants.jpg', 4.99, 'Flaky and buttery French pastries.', 7),
('Pad Thai', 'padthai.jpg', 10.99, 'Thai stir-fried noodles with shrimp, tofu, peanuts, and bean sprouts.', 8),
('Gyro Wrap', 'gyro.jpg', 8.49, 'Greek sandwich with rotisserie meat, tzatziki sauce, and veggies.', 9),
('Paella', 'paella.jpg', 13.99, 'Spanish rice dish with seafood, saffron, and vegetables.', 10),
('Lasagna', 'lasagna.jpg', 12.49, 'Italian layered pasta with meat, cheese, and tomato sauce.', 1),
('Sweet and Sour Pork', 'sweetandsour.jpg', 9.49, 'Chinese dish with pork, bell peppers, and pineapple.', 2),
('Burritos', 'burritos.jpg', 9.99, 'Mexican flour tortillas stuffed with beans, meat, cheese, and veggies.', 3),
('Chole Bhature', 'cholebhature.jpg', 8.99, 'Indian dish with spicy chickpeas and fried bread.', 4),
('Tempura', 'tempura.jpg', 12.99, 'Japanese battered and deep-fried seafood and vegetables.', 5),
('BBQ Ribs', 'bbqribs.jpg', 14.49, 'American-style smoked ribs with BBQ sauce.', 6),
('Baguette', 'baguette.jpg', 3.99, 'Long, thin French bread.', 7),
('Tom Yum Soup', 'tomyum.jpg', 7.99, 'Thai hot and sour soup with shrimp.', 8),
('Moussaka', 'moussaka.jpg', 11.49, 'Greek casserole with eggplant, meat, and béchamel sauce.', 9),
('Churros', 'churros.jpg', 6.49, 'Spanish fried dough pastries with sugar and cinnamon.', 10)

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES food(food_id),
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255)
)

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES 
(1, 3, 2, 'ORDER001', '["A1", "B2"]'),
(2, 5, 1, 'ORDER002', '["C3"]'),
(3, 7, 3, 'ORDER003', '["D4", "E5", "F6"]'),
(4, 9, 1, 'ORDER004', '["G7"]'),
(5, 2, 2, 'ORDER005', '["H8", "I9"]'),
(6, 4, 1, 'ORDER006', '["J10"]'),
(7, 8, 2, 'ORDER007', '["K11", "L12"]'),
(8, 10, 3, 'ORDER008', '["M13", "N14", "O15"]'),
(9, 1, 1, 'ORDER009', '["P16"]'),
(10, 6, 2, 'ORDER010', '["Q17", "R18"]'),
(11, 2, 1, 'ORDER011', '["S19"]'),
(12, 7, 2, 'ORDER012', '["T20", "U21"]'),
(13, 3, 3, 'ORDER013', '["V22", "W23", "X24"]'),
(14, 4, 1, 'ORDER014', '["Y25"]'),
(15, 8, 2, 'ORDER015', '["Z26", "A27"]')
