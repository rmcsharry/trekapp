require 'faker'

module FakingIt
  # GNU License - copy, use, change as you see fit, just keep this header in place please
  #
  # by Richard McSharry 2016 based on Matt Hutchinson's gist
  # see https://gist.github.com/matthutchinson/2654461
  #
  # Built/Tested with Ruby 2.3.1 and Rails 5.0.0.1
  #
  # -------------------
  # INSTRUCTIONS
  # 1 put this file into lib/faking_it.rb
  # 2 put the code below into lib/tasks/fake.rake
  # 3 call 'rake db:fake' [1 record will be created] or pass s,m,l
  # -------------------
  #
  # lib/tasks/fake.rake
  #
  # require 'faking_it'
  #
  # namespace :db do
  #   desc "Faking data into db (pass s, m or l for 10, 50, 100 records, eg: db:rake[m] creates 50 records)"
  #   task :fake, [:option] => [:environment] do |t, args|
  #     faking = FakingIt::Builder.new
  #
  #     case args[:option]
  #       when 's'
  #         faking.employees(10)
  #       when 'm'
  #         faking.employees(50)
  #       when 'l'
  #         faking.employees(100)        
  #       else
  #         faking.employees
  #     end
  #
  #     # report
  #     puts "Faked!\n#{faking.report}"
  #   end
  # end

  class Builder

    FAKEABLE = %w(Employee Address)

    attr_accessor :report

    def initialize
      self.report = Reporter.new
      clean!
      #Faker::Config.locale = 'en-GB'
    end

    def create_data(count=1)
      employees(count)
      trails(count)
    end

    # create employees
    def employees(count)
      1.upto(count) do 
        attributes = {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          phone: Faker::PhoneNumber.phone_number,
          status: random_status
        }

        e = Employee.new(attributes)
        e.email = named_email(e.first_name, e.last_name)  # or call random_unique_email
        e.avatar_url = Faker::Avatar.image("#{e.email}", "50x50", "jpg", "set3", "bg1")
        e.address = Address.new(address)               
        e.save
      end

      self.report.increment(:employees, count)
      self.report.increment(:addresses, count)
    end

    def address
      # for other address type examples, see: https://github.com/stympy/faker/wiki/Address
      attributes = {
        line1: Faker::Address.street_address,
        line2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        province: Faker::Address.state,
        postal_code: Faker::Address.postcode,
        country: Faker::Address.country,
        country_code: Faker::Address.country_code
      }
    end

    def trails(count=1)
      1.upto(count) do 
        attributes = {
          name: Faker::Company.name,
          description: Faker::Lorem.paragraph(2, false, 4),
          province: Faker::Address.state,
          country_code: Faker::Address.country_code,
          region_type: Faker::StarWars.planet,
          agency: Faker::Space.agency,
          website: Faker::Internet.url,
          distance_value: Faker::Number.decimal(2),
          distance_unit: 'km'
          # Faker::Address.latitude 
        }

        t = Trail.new(attributes)
        t.save
      end

      self.report.increment(:trails, count)
    end

    # create products (can be free)
    # def products(count = 1, options = {})
    #   1.upto(count) do
    #     attributes   = { :name        => Faker::Company.catch_phrase, 
    #                      :price       => 20+Random.rand(11), 
    #                      :description => Faker::Lorem.paragraph(2) }.merge(options)
    #     product      = Product.new(attributes)
    #     product.name = "Free #{product.name}" if product.free?
    #     product.save
    #   end
    #   self.report.increment(:products, count)
    # end

    # cleans all faked data away
    def clean!
      FAKEABLE.map(&:constantize).map(&:destroy_all)
    end


    private

    def pick_random(model)
      ids = ActiveRecord::Base.connection.select_all("SELECT id FROM #{model.to_s.tableize}")
      model.find(ids[rand(ids.length)]['id'].to_i) if ids
    end

    def named_email(fname, lname)
      Faker::Internet.email(fname + "." + lname)
    end

    def random_unique_email
      Faker::Internet.email.gsub('@', "+#{Employee.count}@")
    end

    def random_status
      Random.rand(4)
    end

  end


  class Reporter < Hash
    def initialize
      super(0)
    end

    def increment(fakeable, number = 1)
      self[fakeable.to_sym] ||= 0
      self[fakeable.to_sym] += number
    end

    def to_s
      report = ""
      each do |fakeable, count|
        report << "#{fakeable.to_s.classify.pluralize} (#{count})\n" if count > 0
      end
      report
    end
  end
end