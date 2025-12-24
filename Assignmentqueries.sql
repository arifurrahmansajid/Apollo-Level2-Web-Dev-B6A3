
-- TABLE CREATION
CREATE TABLE IF NOT EXISTS app_users (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  email_address VARCHAR(255) NOT NULL UNIQUE,
  contact_number VARCHAR(20) NOT NULL,
  user_password TEXT NOT NULL,
  user_role VARCHAR(20) NOT NULL
    CHECK (user_role IN ('Admin', 'Customer'))
);

CREATE TABLE IF NOT EXISTS transport_units (
  id SERIAL PRIMARY KEY,
  vehicle_title VARCHAR(255) NOT NULL,
  category VARCHAR(20) NOT NULL
    CHECK (category IN ('car', 'bike', 'truck')),
  model_name VARCHAR(255) NOT NULL,
  plate_number VARCHAR(255) NOT NULL UNIQUE,
  daily_rate INT NOT NULL,
  availability_status VARCHAR(20)
    CHECK (availability_status IN ('available', 'rented', 'maintenance'))
);

CREATE TABLE IF NOT EXISTS rental_orders (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES app_users (id),
  transport_id INT REFERENCES transport_units (id),
  rent_start DATE NOT NULL,
  rent_end DATE NOT NULL CHECK (rent_end > rent_start),
  order_status VARCHAR(20) NOT NULL
    CHECK (order_status IN ('pending', 'confirmed', 'completed', 'cancelled')),
  final_amount INT NOT NULL
);


-- QUERY 1: RENTAL DETAILS
SELECT
  r.id AS order_id,
  u.full_name AS customer_name,
  t.vehicle_title AS vehicle_name,
  r.rent_start,
  r.rent_end,
  r.order_status
FROM rental_orders r
JOIN app_users u ON r.customer_id = u.id
JOIN transport_units t ON r.transport_id = t.id;

-- QUERY 2: VEHICLES NEVER BOOKED
SELECT *
FROM transport_units t
WHERE NOT EXISTS (
  SELECT 1
  FROM rental_orders r
  WHERE r.transport_id = t.id
);

-- QUERY 3: AVAILABLE CARS
SELECT *
FROM transport_units
WHERE category = 'car'
AND availability_status = 'available';

-- QUERY 4: VEHICLES BOOKED MORE THAN 2 TIMES
SELECT
  t.vehicle_title AS vehicle_name,
  COUNT(*) AS booking_count
FROM rental_orders r
JOIN transport_units t ON r.transport_id = t.id
GROUP BY t.vehicle_title
HAVING COUNT(*) > 2;
