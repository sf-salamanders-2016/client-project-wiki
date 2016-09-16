class User < ApplicationRecord

  has_one :student
  has_one :mentor

  def full_name
    "#{first_name} #{last_name}"
  end

end
