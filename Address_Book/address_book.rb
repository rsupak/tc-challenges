require_relative 'entry'

class AddressBook
  attr_accessor :entries

  def initialize
    entries = {}
  end

  def add_entry
    new_entry = Entry.new
    
  end

end
