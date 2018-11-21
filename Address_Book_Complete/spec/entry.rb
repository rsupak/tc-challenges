# Base entry class for address book
class Entry
  attr_accessor :name, :phone, :email

  def initialize(name = nil, phone = nil, email = nil)
    @name = name
    @phone = phone
    @email = email
  end

  # display entry information
  def display_entry
    "Name: #{name}\nPhone: #{phone}\nEmail: #{email}"
  end
end
