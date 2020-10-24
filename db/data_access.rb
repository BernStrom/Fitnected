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

def create_user first_name, last_name, email, password_digest, fitness_goal, current_weight, goal_weight
    sql = "INSERT INTO users (first_name, last_name, email, password_digest, fitness_goal, current_weight, goal_weight) VALUES ($1, $2, $3, $4, $5, $6, $7);"
    run_sql(sql, [first_name, last_name, email, password_digest, fitness_goal, current_weight, goal_weight])
end

def logged_in_user
    run_sql("SELECT * FROM users;")
end

