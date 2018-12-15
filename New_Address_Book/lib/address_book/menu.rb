module AddressBook
  require 'uri'
  VALID_PHONE_NUMBER_REGEX = /^[\d]{3}[-][\d]{3}[-][\d]{4}$/
  
  # This class prints the options menu, reads user input, and calls the
  # appropriate function for each option.
  class Menu
    def initialize(database)
      @choice = nil
      @database = database
      @search = Entry.new(database)
    end

    # Prints the menu and waits for user input.
    def select_option
      print_menu
      @choice = gets.chomp
      perform_selection
    end

    def print_menu
      system 'clear'
      # Squiggly HEREDOC removes leading whitespace for multiline strings
      menu_text = <<~TEXT
        Welcome to MyAddressBook!
        Main Menu - #{@database.number_of_entries} entries
        1 - View all entries
        2 - Create an entry
        3 - Search for an entry
        4 - Import entries from a CSV
        5 - Exit
      TEXT

      puts menu_text
      print 'Enter your selection >> '
    end

    # Switch statement that performs the selected menu action
    def perform_selection
      return unless @choice

      case @choice.to_i
      when 1
        view_entries
      when 2
        manual_add_entry
      when 3
        search_menu
      when 4
        file_selection
      when 5
        exit_program
      else
        puts 'Selection not found. Please enter 1 through 5.'
      end

      puts "\n\n"
    end

    # view all entries (1 per screen)
    # press <Enter> to display next entry
    def view_entries
      @database.entries.each do |entry|
        system 'clear'
        contact = <<~TEXT
          Name: #{entry[:name]}
          Phone: #{entry[:phone_number]}
          Email: #{entry[:email]}
        TEXT
        puts contact
        hold_screen
      end
    end

    # manually add entries to the address book
    def manual_add_entry
      @database.entries
        .insert_conflict(:replace)
        .insert(
          name: enter_name,
          phone_number: enter_phone,
          email: enter_email
        )
    end

    # validates name input
    def validate_name(name)
      return true unless name.empty?

      false
    end

    # validates phone number input
    def validate_phone_number(phone)
      return true if VALID_PHONE_NUMBER_REGEX.match?(phone)

      false
    end

    # helper validates email input
    def validate_email(email)
      return true if URI::MailTo::EMAIL_REGEXP.match?(email)
      
      false
    end

    # displays manual search options
    def search_menu
      selections = <<~TEXT
        Search by?
        1 - Name
        2 - Phone Number
        3 - Email
      TEXT
      system 'clear'
      puts selections
      print 'Enter your selection >> '
      choice = gets.to_i
      search_selection(choice)
    end

    # displays search entry by defined user selection
    def search_selection(choice)
      case choice
      when 1
        search_item(1)
      when 2
        search_item(2)
      when 3
        search_item(3)
      else
        puts 'Selection not found. Enter 1 through 3.'
        hold_screen
        search_menu
      end
    end

    # search for entry by name, phone number or email
    def search_item(num)
      system 'clear'
      result = nil
      case num
      when 1
        print 'Enter a name to search for >> '
        lookup_item = gets.chomp.capitalize
        result = @search.name(lookup_item)
      when 2
        print 'Enter a phone number to search for >> '
        lookup_item = gets.chomp
        result = @search.phone_number(lookup_item)
      when 3
        print 'Enter an email to search for >> '
        lookup_item = gets.chomp
        result = @search.email(lookup_item)
      end
      system 'clear'
      puts "\n#{formatted_search_result(result)}"
      hold_screen
    rescue EntryNotFoundError => e
      puts e.message
      hold_screen
    end

    # helper method to import CSV files stored in the csv_files directory
    # **ALL CSV FILES SHOULD BE STORED IN THE CSV_FILES DIRECTORY**
    # the user only has to enter the file name rather than the entire path
    def file_selection
      puts 'Which file would you like to import?'
      imports = gets.chomp
      file_path = "#{imports}"
      CsvImporter.new(@database, file_path).import
      puts 'Import complete.'
      hold_screen
    rescue FileNotFoundError
      puts 'The specified file was not found.'
      file_selection
    rescue CsvInvalidError => e
      puts e.message
      hold_screen
    end

    def exit_program
      exit
    end

    private
    # displays db entries in specified format
    def formatted_search_result(entry)
      <<~TEXT
        Name: #{entry.first}
        Phone: #{entry[1]}
        Email: #{entry[2]}
      TEXT
    end

    # helper method to the display for reading
    def hold_screen
      print 'Press Enter to continue.'
      gets.chomp
    end

    # helper methods gets and validates entry name
    def enter_name
      name = ''
      until validate_name(name)
        system 'clear'
        puts "Name field cannot be empty."
        print 'Enter a valid name: >> '
        name = gets.chomp.capitalize
      end
      name
    end

    # helper method gets and validates entry phone_number
    def enter_phone
      phone = ''
      until validate_phone_number(phone)
        system 'clear'
        print 'Enter a valid phone number ###-###-####: >> '
        phone = gets.chomp
      end
      phone
    end

    # helper method gets and validates entry email
    def enter_email
      email = ''
      until validate_email(email)
        system 'clear'
        print 'Enter a valid email address: >> '
        email = gets.chomp
      end
      email
    end
  end
end




