desc 'Create a database dump'
task :dump, [:db_name] do |t, args|
  system("pg_dump #{args.db_name} > database_backup.sql")
  # Ruby's `system` method - takes a string as an arg
  # allows for use of external shell commands in Ruby code
  #`args.db_name` to access the parameter passed into task
  # `rake dump[record_store]` will create a db dump
end
