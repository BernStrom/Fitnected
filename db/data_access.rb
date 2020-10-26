def run_sql sql, params = []
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'fitnected'})
    results = db.exec(sql, params)
    db.close
    results
end

def find_user_by_id id
    results = run_sql("SELECT * FROM users WHERE id = $1;", [id])
    results[0]
end

def find_user_by_email email
    results = run_sql("SELECT * FROM users WHERE email = $1;", [email])
    results[0]
end

def find_user_by_firstname first_name
    results = run_sql("SELECT * FROM users WHERE first_name = $1;", [first_name])
    results[0]
end

def create_user first_name, last_name, email, password_digest, fitness_goal, current_weight, goal_weight, avatar_url
    sql = "INSERT INTO users (first_name, last_name, email, password_digest, fitness_goal, current_weight, goal_weight, avatar_url) VALUES ($1, $2, $3, $4, $5, $6, $7, $8);"
    run_sql(sql, [first_name, last_name, email, password_digest, fitness_goal, current_weight, goal_weight, avatar_url])
end

def update_user first_name, last_name, email, fitness_goal, current_weight, goal_weight, avatar_url, id
    sql = "UPDATE users SET first_name = $1, last_name = $2, email = $3, fitness_goal = $4, current_weight = $5, goal_weight = $6, avatar_url = $7 WHERE id = $8;"
    run_sql(sql, [first_name, last_name, email, fitness_goal, current_weight, goal_weight, avatar_url, id])
end

def delete_user id
    sql = "DELETE FROM users WHERE id = $1;"
    run_sql(sql, [id])
end

def logged_in_user
    run_sql("SELECT * FROM users;")
end

