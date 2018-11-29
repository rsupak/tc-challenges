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
      if choice == 5
        puts 'Goodbye!'
        break
      end

      selection(choice)
    end
  end

  # helper method for using menu options
  def selection(choice)
    case choice
    when 1
      view_entries
    when 2
      manual_add_entry
    when 3
      search_menu
    when 4
      file_selection
    end
  end

  # view all entries (1 per screen)
  # press <Enter> to display next entry
  def view_entries
    address_book.entries.each do |entry|
      system 'clear'
      puts entry.display_entry
      puts
      hold_screen
    end
  end

  # manually adds entry into the address book
  def manual_add_entry
    address_book.add_entry(enter_name, enter_phone, enter_email)
  end

  # helper methods gets and validates entry name
  def enter_name
    name = ''
    while name.empty?
      print 'Enter a valid name <first_name> <last_name>: >> '
      name = gets.chomp.capitalize
    end
    name
  end

  # helper method gets and validates entry phone_number
  def enter_phone
    phone = ''
    until VALID_PHONE_NUMBER_REGEX.match?(phone)
      print 'Enter a valid phone number ###-###-####: >> '
      phone = gets.chomp
    end
    phone
  end

  # helper method gets and validates entry email
  def enter_email
    email = ''
    until URI::MailTo::EMAIL_REGEXP.match?(email)
      print 'Enter a valid email address: >> '
      email = gets.chomp
    end
    email
  end

  # displays manual search options
  def search_menu
    puts 'Search by? '
    puts '1 - Name'
    puts '2 - Phone Number'
    puts '3 - Email'
    print 'Enter your selection: >> '
    choice = gets.to_i
    search_selection(choice)
  end

  # displays search entry by defined user selection
  def search_selection(choice)
    case choice
    when 1
      display_by_name
    when 2
      display_by_phone
    when 3
      display_by_email
    end
  end

  # helper method for manual search (search by name)
  def display_by_name
    name = enter_name
    unless address_book.search_by_name(name)
      puts "There is no #{name} in your address book."
    end
    address_book.entries.each do |entry|
      puts entry.display_entry if entry.name == name
    end
    puts
    hold_screen
  end

  # helper method for manual search (search by phone)
  def display_by_phone
    phone = enter_phone
    puts "Phone Number Not Found" unless address_book.search_by_phone(phone)
    address_book.entries.each do |entry|
      puts entry.display_entry if entry.phone == phone
    end
    puts
    hold_screen
  end

  # helper method for manual search (search by email)
  def display_by_email
    email = enter_email
    puts "Email Address Not Found" unless address_book.search_by_email(email)
    address_book.entries.each do |entry|
      puts entry.display_entry if entry.email == email
    end
    puts
    hold_screen
  end

  # helper method to get manual import data
  # all csv files should be located in the csv_files directory
  def file_selection
    print 'Enter filename: >> '
    imports = gets.chomp
    path = imports == '' ? file_selection : ".\/csv_files\/#{imports}"
    if Pathname(path).exist?
      count = address_book.import_file(path)
      puts "#{count} Entries Imported"
      hold_screen
    else
      puts 'File not found'
      hold_screen
      file_selection
    end
  end

  # helper method to display 1 entry at a time
  def hold_screen
    print 'Press Enter to continue.'
    gets.chomp
  end
end

## UNCOMMENT THE LINES BELOW TO RUN MENU ##
## COMMENT THEM OUT TO RUN THE TEST ##

session = MenuController.new
session.display
