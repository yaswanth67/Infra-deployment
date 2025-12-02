USE feature_db;

CREATE TABLE IF NOT EXISTS shop_features (
    id INT AUTO_INCREMENT PRIMARY KEY,
    shop_id INT NOT NULL UNIQUE,
    features JSON NOT NULL
);