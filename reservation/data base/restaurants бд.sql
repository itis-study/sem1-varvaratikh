CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    restaurant_id INT,
    user_email VARCHAR(255),
    rating INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);