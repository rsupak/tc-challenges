require 'uri'
require_relative 'entry'
VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

# Address book gathers and holds entry data
class AddressBook
  attr_accessor :entries, :menu

  def initialize
    @entries = []
  end

  # add entry to address book
  def add_entry(name, phone, email)
    new_entry = Entry.new(name, phone, email)
    entries << new_entry
  end

  # return number of entries
  def size
    entries.size
  end
end
