require 'faking_it'

namespace :db do
  desc "Faking data into db (pass s, m or l for 10, 50, 100 records, eg: db:rake[m])"
  task :fake, [:option] => [:environment] do |t, args|
    faking = FakingIt::Builder.new

    case args[:option]
      when 's'
        faking.employees(10)
      when 'm'
        faking.employees(50)
      when 'l'
        faking.employees(100)        
      else
        faking.employees
    end

    # report
    puts "Faked!\n#{faking.report}"
  end
end
