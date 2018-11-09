require_relative 'address_book'
require_relative 'entry'

# Menu controller assists in navigating the address book
# Entries can be added (Manual/CSV file), displayed, and searched
class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  # Shows user menu options
  def display
    loop do
      system 'clear'
      puts 'Welcome to My Address Book'
      puts "Main Menu - #{address_book.size} entries"
      puts '1 - View all entries'
      puts '2 - Create an entry'
      puts '3 - Search for an entry'
      puts '4 - Import entries from a CSV'
      puts '5 - Exit'
      print 'Enter your selection: >> '
      choice = gets.to_i
      puts "Choice: #{choice}"
      break if choice == 5

      selection(choice)
    end
  end

  # helper method for using menu options
  def selection(choice)
    if choice == 1
      address_book.view_entries
    elsif choice == 2
      address_book.manual_add_entry
    elsif choice == 3
      address_book.manual_search
    elsif choice == 4
      address_book.file_selection
    end
  end
end

## UNCOMMENT THE LINES BELOW TO RUN MENU ##
## COMMENT THEM OUT TO RUN THE TEST ##

# session = MenuController.new
# session.display
