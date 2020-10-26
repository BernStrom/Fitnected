require 'bcrypt'
require 'pg'
require_relative 'data_access'

first_name = "Admin"
last_name = "B"
email = "admin@fitnected.co"
password_digest = BCrypt::Password.create('fitmeup')
fitness_goal = "10kg of muscle mass gain"
current_weight = 75
goal_weight = 85
avatar_url = "https://magarticles.magzter.com/articles/5188/365644/5d6f86e7c507b/crp_Jay-Cutler-Olympia-Memories.jpg"

sql = "INSERT INTO users (first_name, last_name, email, password_digest, fitness_goal, current_weight, goal_weight) VALUES ('#{first_name}', '#{last_name}', '#{email}', '#{password_digest}', '#{fitness_goal}', #{current_weight}, #{goal_weight}, '#{avatar_url}');"

run_sql(sql)