CREATE TABLE reservations (
    id SERIAL PRIMARY KEY,
    restaurant_id INTEGER,
    table_name VARCHAR(255),
    reservation_time TIMESTAMP,
    user_id INTEGER,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
