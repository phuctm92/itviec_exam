class User < ApplicationRecord
  enum status: { active: 0, inactive: 1, banned: 2, pending: 3 }
  enum city:   { hcm: 'HCM', hn: 'HN', dn: 'DN', other: 'Other' }

  # def exists?(status, city)
  #   pluck(:status, :city).count{|user| user.status == status && user.city == city} > 0
  # end


  # Change
  # First, this seems to be a method that wants to check the data
  # if there are users with a specific status and city.
  # So, I have to use the class method instead of an instance method.

  # Second, to avoid confusion with the #exists method? of Rails,
  # I renamed the method to make it easier to understand.

  def self.exists_by?(status, city)
    exists?(status: status, city: city)
  end
end
