module ModelHooks
  extend ActiveSupport::Concern

  included do
    before_save :capitalize_attributes
  end

  def capitalize_attributes
     self.attributes.each do |attr,val|
       #if the attribute only has space, then this will store nil in the DB
       self.send("#{attr}=",val.strip.capitalize) if self.capitalizable_attrs.include?(attr) && !val.nil?
     end    
  end
end