CREATE database fitnected;

CREATE TABLE exercises (
    id SERIAL PRIMARY KEY, 
    upper_body VARCHAR(500),
    upper_body_image_url TEXT,
    lower_body VARCHAR(500),
    lowwer_body_image_url TEXT,
    abdominal VARCHAR(500),
    abdominal_image_url TEXT,
    user_id INTEGER
);

CREATE TABLE food (
    id SERIAL PRIMARY KEY,
    breakfast VARCHAR(500),
    breakfast_image_url TEXT,
    main_meals VARCHAR(500),
    main_meals_image_url TEXT,
    snacks VARCHAR(500),
    snacks_image_url TEXT,
    user_id INTEGER
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email TEXT,
    password_digest TEXT,
    fitness_goal TEXT,
    current_weight VARCHAR(200),
    goal_weight VARCHAR(200),
    avatar_url TEXT
);