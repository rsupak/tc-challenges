require 'uri'
require_relative 'entry'
VALID_PHONE_NUMBER_REGEX = /^\(?[\d]{3}\)?[-][\d]{3}[-][\d]{4}$/

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

  # find entry by name
  def search_by_name(name)
    entries.each { |entry| return true if entry.name == name }
    false
  end

  def search_by_phone(phone)
    entries.each { |entry| return true if entry.phone == phone }
    false
  end

  def search_by_email(email)
    entries.each { |entry| return true if entry.email == email }
    false
  end

  # import CSV file with entries
  def import_file(file)
    count = 0
    File.open(file).each do |line|
      line_info = line.split(',')
      add_entry(line_info[0], line_info[1], line_info[2].strip)
      count += 1
    end
    count
  end

  # return number of entries
  def size
    entries.size
  end
end
