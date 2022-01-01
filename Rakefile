desc 'Create a database dump'
task :dump, [:db_name] do |t, args|
  system("pg_dump #{args.db_name} > database_backup.sql")
  # Ruby's `system` method - takes a string as an arg
  # allows for use of external shell commands in Ruby code
  #`args.db_name` to access the parameter passed into task
  # `rake dump[record_store]` will create a db dump
end

desc 'Create a database and test database from a database dump'
task :build, [:db_name] do |t, args|
  system("createdb #{args.db_name}")
  # make a record_store database
  system("psql #{args.db_name} < database_backup.sql")
  # populate `record_store` db w/ db dump named ^^
  system("createdb -T #{args.db_name} #{args.db_name + '_test'}")
  # create a test db with `_test` appended to the end of its name
end
