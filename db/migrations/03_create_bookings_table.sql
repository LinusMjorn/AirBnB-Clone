CREATE TABLE bookings (id SERIAL PRIMARY KEY, space_id INT, guest_id INT, date DATE, approved BIT);