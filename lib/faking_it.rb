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
  # 3 call 'rake db:fake' [1 record will be created - useful for testing changes]
  #
  # Create small, medium or large datasets by passing s,m,l - eg db:rake[m]
  # -------------------
  #
  # lib/tasks/fake.rake [change the 10,50,1000 to whatever sizes you need for s,m,l]
  #
  # require 'faking_it'
  #
  # namespace :db do
  #   desc "Faking data into db"
  #   task :fake, [:option] => [:environment] do |t, args|
  #     faking = FakingIt::Builder.new
  #
  #     case args[:option]
  #       when 's'
  #         faking.create_data(10)
  #       when 'm'
  #         faking.create_data(500)
  #       when 'l'
  #         faking.create_data(1000)        
  #       else
  #         faking.create_data
  #     end
  #
  #     # report
  #     puts "Faked!\n#{faking.report}"
  #   end
  # end


  class Builder

    FAKEABLE = %w(Employee Address Note Comment Trail)

    attr_accessor :report

    def initialize
      self.report = Reporter.new
      clean!
    end

    def create_data(count=1)
      employees(count)
      trails(count)
    end

    # create employees
    def employees(count, options = {})
      1.upto(count) do 
        attributes = {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          phone: Faker::PhoneNumber.phone_number,
          status: Random.rand(4)
        }.merge(options)

        e = Employee.new(attributes)
        e.email = named_email(e.first_name, e.last_name)  # or call random_unique_email
        e.avatar_url = Faker::Avatar.image("#{e.email}", "50x50", "jpg", "set3", "bg1")
        e.address = Address.new(address)
        e.updated_at = Faker::Time.backward(14, :all)               
        e.save
        Employee.where(id: e.id).update_all(updated_at: Faker::Time.backward(14, :all))
        Address.where(id: e.address.id).update_all(updated_at: Faker::Time.backward(7,:all))      
      end

      self.report.increment(:employees, count)
      self.report.increment(:addresses, count)
    end

    def address(options = {})
      # for other address type examples, see: https://github.com/stympy/faker/wiki/Address
      attributes = {
        line1: Faker::Address.street_address,
        line2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        province: Faker::Address.state,
        postal_code: Faker::Address.postcode,
        country: Faker::Address.country,
        country_code: Faker::Address.country_code
      }.merge(options)
    end

    def trails(count, options = {})
      1.upto(count) do 
        attributes = {
          name: Faker::Space.nebula,
          map_thumbnail_url: "http://placehold.it/150x150",
          elevation_thumbnail_url: "http://placehold.it/150x50",
          province: Faker::Address.state,
          country_code: Faker::Address.country_code,
          region_type: Faker::StarWars.planet,
          agency: Faker::Space.agency,
          website: Faker::Internet.url,
          distance_value: Faker::Number.decimal(2),
          distance_unit: 'km',
          distance_type: Random.rand(4),
          publish_status: Random.rand(2)
          # Faker::Address.latitude 
        }.merge(options)

        t = Trail.new(attributes) 
        add_notes(t, Random.rand(5))
        add_comments(t, Random.rand(20))
        t.save
        Trail.where(id: t.id).update_all(updated_at: Faker::Time.backward(14, :all))
      end

      self.report.increment(:trails, count)
      
    end

    def add_notes(trail, count)
      0.upto(count) do
        attributes = {
          note_body: Faker::Lorem.paragraphs(Random.rand(3))
        }
        trail.notes.new(attributes)
      end
      self.report.increment(:notes, count)
    end

    def add_comments(trail, count)
      0.upto(count) do
        attributes = {
          comment_body: Faker::Lorem.paragraphs(1)
        }
        trail.comments.new(attributes)
      end
      self.report.increment(:comments, count)
    end    

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