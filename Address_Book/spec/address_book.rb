require_relative 'entry'

# Address book gathers and holds entry data
class AddressBook
  attr_accessor :entries, :menu

  def initialize
    @entries = []
  end

  # add entry to address book
  def add_entry(name, phone, email)
    new_entry = Entry.new
    new_entry.name = name
    new_entry.phone = phone
    new_entry.email = email
    entries << new_entry
  end

  # manually adds entry into the address book
  def manual_add_entry
    print 'Enter name: >> '
    name = gets.chomp
    print 'Enter phone number: >> '
    phone = gets.chomp
    print 'Enter email address: >> '
    email = gets.chomp
    add_entry(name, phone, email)
  end

  # find entry by name
  def search(name)
    found = false
    entries.each { |entry| found = true if entry.name == name }

    found
  end

  # manually search for entry
  def manual_search
    print 'Enter name: >> '
    name = gets.chomp
    return unless search(name)

    entries.each { |entry| entry.display_entry if entry.name == name }
    hold_screen
  end

  # view all entries (1 per screen)
  # press <Enter> to display next entry
  def view_entries
    entries.each do |entry|
      system 'clear'
      entry.display_entry
      puts
      hold_screen
    end
  end

  # import CSV file with entries
  def import_file(file)
    File.open(file).each do |line|
      line_info = line.split(',')
      add_entry(line_info[0], line_info[1], line_info[2])
    end
  end

  # helper method to get manual import data
  def file_selection
    print 'Enter filename: >> '
    imports = gets.chomp
    import_file(".\/spec\/#{imports}")
  end

  # return number of entries
  def size
    entries.size
  end

  # helper method to display 1 entry at a time
  def hold_screen
    print 'Press Enter to continue.'
    gets.chomp
    puts
  end
end
