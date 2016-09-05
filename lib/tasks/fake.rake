require 'faking_it'

namespace :db do
  desc "Faking data into db (pass s, m or l for 10, 50, 100 records, eg: db:rake[m])"
  task :fake, [:option] => [:environment] do |t, args|
    faking = FakingIt::Builder.new

    case args[:option]
      when 's'
        faking.create_data(10)
      when 'm'
        faking.create_data(50)
      when 'l'
        faking.create_data(500)        
      else
        faking.create_data
    end

    # report
    puts "Faked!\n#{faking.report}"
  end
end
