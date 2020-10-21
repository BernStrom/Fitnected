def run_sql sql
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: ''})
    result = db.exec(sql)
    db.close
    result
end