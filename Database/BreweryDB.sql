BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, breweries, user_favorites, brewery_features CASCADE;
DROP SEQUENCE IF EXISTS user_serial;

--CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; for eventually utilizing UUID for unique ID numbers

CREATE SEQUENCE user_serial;
CREATE TABLE users (
    user_id INT NOT NULL DEFAULT nextval('user_serial'),
	username VARCHAR(15) UNIQUE,
    date_of_birth DATE NOT NULL,
	password_hash VARCHAR(200),
	role VARCHAR(10),
	CONSTRAINT PK_user_id PRIMARY KEY(user_id)
);

CREATE TABLE breweries (
    brewery_id VARCHAR(100) NOT NULL,
    brewery_name VARCHAR(50) NOT NULL,
    street_address VARCHAR(50) NULL,
    city VARCHAR(20) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
	latitude VARCHAR(15) NULL,
	longitude VARCHAR(15) NULL,
    website VARCHAR(200) NULL,
	CONSTRAINT PK_brewery_id PRIMARY KEY(brewery_id)
);

CREATE TABLE user_favorites (
	user_id INT,
	brewery_id VARCHAR(100),
	CONSTRAINT FK_user_id FOREIGN KEY(user_id) REFERENCES users(user_id),
	CONSTRAINT FK_brewery_id FOREIGN KEY(brewery_id) REFERENCES breweries(brewery_id)
);

CREATE TABLE brewery_features (
    brewery_id VARCHAR(100) NOT NULL,
	outdoor_seating BOOLEAN NULL,
	dog_friendly BOOLEAN NULL,
	family_friendly BOOLEAN NULL,
	beer_garden BOOLEAN NULL,
	sidewalk_seating BOOLEAN NULL,
	on_prem_food BOOLEAN NULL,
	food_trucks BOOLEAN NULL,
	brewery_tours BOOLEAN NULL,
	parking_lot BOOLEAN NULL,
	seat_yourself BOOLEAN NULL,
	waiter_service BOOLEAN NULL,
	attribute_other VARCHAR(25) NULL,
	CONSTRAINT FK_brewery_id FOREIGN KEY(brewery_id) REFERENCES breweries(brewery_id)
);

COMMIT;

ROLLBACK;

INSERT INTO users (username, date_of_birth, password_hash, role)
VALUES ('admin', '1900-01-01','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_ADMIN');

--INSERT INTO breweries (brewery_name, street_address, city, zip_code, website) VALUES ('Mad Chef Craft Brewery', '2023 Miller Rd', 'East Petersburg', '17520', 'https://www.madchefcraftbrewing.com/');
--INSERT INTO breweries (brewery_name, street_address, city, zip_code, website) VALUES ('Our Town Brewery', '252 N Prince St', 'Lancaster', '17603', 'https://ourtownbrewery.com/');
--INSERT INTO breweries (brewery_name, street_address, city, zip_code, website) VALUES ('Lancaster Brewing Company', '302 N Plum St', 'Lancaster', '17602', 'https://www.lancasterbrewing.com/');


SELECT * FROM breweries;
SELECT * FROM users;