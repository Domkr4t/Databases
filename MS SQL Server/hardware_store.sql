use LB;
	
CREATE TABLE client 
(	client_id int, 
	client_name varchar(50) NOT NULL, 
	client_telephone varchar(17) NOT NULL,
	CONSTRAINT PK_client PRIMARY KEY (client_id)
);

CREATE TABLE worker 
(	worker_id int, 
	worker_name varchar(50) NOT NULL, 
	worker_pos varchar(30) NOT NULL,
	CONSTRAINT PK_worker PRIMARY KEY (worker_id)
);

CREATE TABLE provider_ 
(	provider_id int, 
	provider_name varchar(30) NOT NULL, 
	provider_address varchar(70) NOT NULL, 
	provider_contacts varchar(60) NOT NULL,
	CONSTRAINT PK_provider_ PRIMARY KEY (provider_id)
);

CREATE TABLE delivery 
(	delivery_id int, 
	delivery_date smalldatetime NOT NULL,
	delivery_comment varchar(90) NOT NULL,
	id_provider int
	CONSTRAINT PK_delivery PRIMARY KEY (delivery_id)
	CONSTRAINT FK_provider_ 
		FOREIGN KEY (id_provider) 
		REFERENCES provider_ (provider_id)
);

CREATE TABLE product 
(	product_id int, 
	product_name varchar(30) NOT NULL, 
	product_comment varchar (99) NOT NUll, 
	id_delivery int,
	CONSTRAINT PK_product PRIMARY KEY (product_id),
	CONSTRAINT FK_delivery 
		FOREIGN KEY (id_delivery) 
		REFERENCES delivery (delivery_id)
);

CREATE TABLE order_ 
(	order_id int, 
	order_date smalldatetime NOT NULL, 
	id_worker int, 
	id_client int, 
	id_product int, 
	CONSTRAINT PK_order PRIMARY KEY (order_id), 
	CONSTRAINT FK_client 
		FOREIGN KEY (id_client) 
		REFERENCES client (client_id),
	CONSTRAINT FK_worker 
		FOREIGN KEY (id_worker) 
		REFERENCES worker (worker_id),
	CONSTRAINT FK_product 
		FOREIGN KEY (id_product) 
		REFERENCES product (product_id)
);

INSERT INTO client (client_id, client_name, client_telephone) VALUES 
(01, 'Панкратов Илья Алексеевич', '+7(999)781-61-45'),
(02, 'Худшев Худший Худшеевич', '+7(999)703-11-69'),
(03, 'Алешкина Ольга Вячеславовна', '+7(999)924-11-98'),
(04, 'Иванов Иван Иванович', '+7(999)554-15-32'),
(05, 'Скиба Артур Романович', '+7(999)123-00-09'),
(06, 'Крутой Крутик Крутевич', '+7(999)498-55-90'),
(07, 'Игнатьев Кирилл Тимурович', '+7(999)031-28-26'),
(08, 'Князева Магда Богдановна', '+7(999)510-60-89'),
(09, 'Прохорова Мартина Авксентьевна', '+7(999)336-97-91'),
(10, 'Зайцев Бенедикт Макарович', '+7(999)907-40-86'),
(11, 'Афанасьев Артем Романович', '+7(999)173-00-09'),
(12, 'Гаврилова Изабелла Николаевна', '+7(999)192-27-17'),
(13, 'Воронов Варлаам Мартынович', '+7(999)540-24-25'),
(14, 'Фокина Евгения Леонидовна', '+7(999)338-31-45'),
(15, 'Мясников Любомир Денисович', '+7(999)283-39-38');

INSERT INTO worker (worker_id, worker_name, worker_pos) VALUES 
(01, 'Колобова Элина Артемовна', 'Кассир'),
(02, 'Романова Видана Наумовна', 'Кассир'),
(03, 'Быкова Селена Никитевна', 'Кассир'),
(04, 'Якушева Белла Иринеевна', 'Кассир'),
(05, 'Скиба Артур Романович', 'Кассир'),
(06, 'Капустина Нила Улебовна', 'Главный кассир'),
(07, 'Ефремова Юфеза Валентиновна', 'Главный кассир'),
(08, 'Савельева София Григорьевна', 'Главный кассир'),
(09, 'Зимин Варлаам Якунович', 'Кассир'),
(10, 'Третьяков Игорь Мэлорович', 'Кассир'),
(11, 'Фадеев Феликс Даниилович', 'Главный кассир'),
(12, 'Александров Исаак Агафонович', 'Кассир'),
(13, 'Королёв Ибрагил Игнатьевич', 'Кассир'),
(14, 'Шарапов Гавриил Дмитрьевич', 'Кассир'),
(15, 'Павлов Натан Георгьевич', 'Кассир');

INSERT INTO provider_ (provider_id, provider_name, provider_address, provider_contacts) VALUES 
(01, 'LG', '349 Christiansen Bypass Apt. 922 Bahringerland, NY 49646-1300', '404-375-6664, LG@gmail.com'),
(02, 'Apple', '84509 Dietrich Heights Suite 812 Barrowsstad, MT 86842', '504-526-0165, Apple@gmail.com'),
(03, 'Google', '811 Rowland Overpass Suite 288 Skilestown, OR 66031', '217-893-4959, Google@gmail.com'),
(04, 'Samsung', '12152 Kiehn Mission Suite 149 Walterfurt, CT 14472', '325-928-7238, Samsung@gmail.com'),
(05, 'ZTE', '811 Rowland Overpass Suite 288 Skilestown, OR 66031', '227-893-4959, ZTE@gmail.com'),
(06, 'Honor', '990 Bridgette Village Apt. 950 Kossberg, NV 07170-0533', '808-653-0033, Honor@gmail.com'),
(07, 'Huawei', '588 Megane Fords Apt. 470 Lake Terrill, NE 62245-7019', '720-635-2749, Huawei@gmail.com'),
(08, 'Xiaomi', '19417 Mohammed Lodge Suite 803 Dietrichfort, RI 40892-7277', '786-930-3097, Xiaomi@gmail.com'),
(09, 'Vivo', '6594 Cielo Unions Stokesfort, PA 69584', '202-279-7158, Vivo@gmail.com'),
(10, 'Oppo', '1224 Schuster Plains Suite 694 Cassinstad, WV 80136-4022', '585-588-6415, Oppo@gmail.com'),
(11, 'Nvidia', '8949 Clark Knolls West Thad, IL 16626-8737', '920-687-1914, Nvidia@gmail.com'),
(12, 'Amazon', '36596 Andy Street Edmundfort, VA 88662', '530-543-5925, Amazon@gmail.com'),
(13, 'Sony', '4323 Bruen Square Suite 817 Spencerstad, AZ 18788-1087', '781-985-1898, Sony@gmail.com'),
(14, 'Nokia', '60683 Spencer Roads Dylanburgh, CT 25298', '208-644-5865, Nokia@gmail.com'),
(15, 'Lenovo', '191 Orlo Locks North Matteo, NY 53454-4441', '702-476-4921, Lenovo@gmail.com');

INSERT INTO delivery (delivery_id, delivery_date, delivery_comment) VALUES 
(01, '2021-08-01 12:00:00', 'Поставка техники LG'),
(02, '2021-08-02 12:00:00', 'Поставка техники Apple'),
(03, '2021-08-03 12:00:00', 'Поставка техники Google'),
(04, '2021-08-04 12:00:00', 'Поставка техники Samsung'),
(05, '2021-08-05 12:00:00', 'Поставка техники ZTE'),
(06, '2021-08-06 12:00:00', 'Поставка техники Honor'),
(07, '2021-08-07 12:00:00', 'Поставка техники Huawei'),
(08, '2021-08-08 12:00:00', 'Поставка техники Xiaomi'),
(09, '2021-08-09 12:00:00', 'Поставка техники Vivo'),
(10, '2021-08-10 12:00:00', 'Поставка техники Oppo'),
(11, '2021-08-11 12:00:00', 'Поставка техники Nvidia'),
(12, '2021-08-12 12:00:00', 'Поставка техники Amazon'),
(13, '2021-08-12 12:00:00', 'Поставка техники Sony'),
(14, '2021-08-12 12:00:00', 'Поставка техники Nokia'),
(15, '2021-08-12 12:00:00', 'Поставка техники Lenovo');

INSERT INTO product (product_id, product_name, product_comment) VALUES 
(01, 'Телевизор', 'chto-to'),
(02, 'MAC', 'chto-to'),
(03, 'Pixel 6', 'chto-to'),
(04, 'Samsung S21', 'chto-to'),
(05, 'ZTE HZ', 'chto-to'),
(06, 'Honor 20 pro', 'chto-to'),
(07, 'Huawei P50 PRO', 'chto-to'),
(08, 'Xiaomi Note 10', 'chto-to'),
(09, 'Vivo X70', 'chto-to'),
(10, 'Oppo 9 PRO', 'chto-to'),
(11, 'Nvidia GTX 3080 SUPER', 'chto-to'),
(12, 'Amazon электронная книга', 'chto-to'),
(13, 'Sony XPERIA Z3', 'chto-to'),
(14, 'Nokia 3310', 'chto-to'),
(15, 'Lenovo IdeaPad', 'chto-to');

INSERT INTO order_ (order_id, order_date) VALUES 
(01, '2021-09-01 12:00:00'),
(02, '2021-09-02 12:00:00'),
(03, '2021-09-03 12:00:00'),
(04, '2021-09-04 12:00:00'),
(05, '2021-09-05 12:00:00'),
(06, '2021-09-06 12:00:00'),
(07, '2021-09-07 12:00:00'),
(08, '2021-09-08 12:00:00'),
(09, '2021-09-09 12:00:00'),
(10, '2021-09-10 12:00:00'),
(11, '2021-09-11 12:00:00'),
(12, '2021-09-12 12:00:00'),
(13, '2021-09-12 12:00:00'),
(14, '2021-09-12 12:00:00'),
(15, '2021-09-12 12:00:00');



