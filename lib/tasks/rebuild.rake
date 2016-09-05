namespace :db do
  desc 'Drop, create, migrate then seed the development database'
  task rebuild: [ 'db:drop', 'db:create', 'db:migrate' ] do
    puts 'Rebuilding completed.'
  end
end