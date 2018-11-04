class Entry
  attr_accessor :name, :phone, :email

  def initialize(name = nil, phone = nil, email = nil)
    @name = name
    @phone = phone
    @email = email
  end
end

class AddressBook
  attr_accessor :entries, :menu

  def initialize
    @entries = {}
  end

  def add_entry
    new_entry = Entry.new
    print 'Enter name: >> '
    new_entry.name = gets.chomp
    print 'Enter phone number: >> '
    new_entry.phone = gets.chomp
    print 'Enter email address >> '
    new_entry.email = gets.chomp

    entries << new_entry
  end
end

class MenuController
  def display()
    running = true
    entries = 0
    while running
      system 'clear'
      puts 'Welcome to My Address Book'
      puts "Main Menu - #{entries} entries"
      puts '1 - View all entries'
      puts '2 - Create an entry'
      puts '3 - Search for an entry'
      puts '4 - Import entries from a CSV'
      puts '5 - Exit'
      print 'Enter your selection: '
      selection = gets.chomp.to_i
      puts "Choice: #{selection}"
      break if selection == 5
    end
  end
end
