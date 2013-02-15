require_relative '../../db/config'


# implement your Student model here

class Student < ActiveRecord::Base
  attr_reader :age

validates :email, :presence => true, :uniqueness => true
validates_format_of :email, :with => /(\w+)@(\w+).(\w{2,})/
validates_numericality_of :age, :greater_than => 5.00
validates_format_of :phone, :with => /\d{3}.*\d{3}.*\d{4}/

  def name
    self.first_name + ' ' + self.last_name
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end
