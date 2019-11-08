class Project < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :people, through: :assignments

  def available_people
    Person.all - people
  end
end
