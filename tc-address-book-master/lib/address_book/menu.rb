# frozen_string_literal: true

#
# Copyright (c) 2018 Topcoder, Inc. All rights reserved.
#

module AddressBook
  # This class prints the options menu, reads user input, and calls the appropriate function
  # for each option.
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

    private

    def print_menu
      menu_text = <<~MENU
        Welcome to MyAddressBook!
        Main Menu - #{@database.number_of_entries} entries
        1 - View all entries
        2 - Create an entry
        3 - Search for an entry
        4 - Import entries from a CSV
        5 - Exit
      MENU

      puts menu_text
      print 'Enter your selection: '
    end

    def perform_selection
      return unless @choice

      case @choice.to_i
      when 1..2
        puts 'That option was not implemented in this challenge. Choose another.'
      when 3
        search_by_name
      when 4
        import_from_csv
      when 5
        exit_program
      else
        puts 'That option was not recognized. Enter 1 through 5.'
      end

      puts "\n\n"
    end

    ##
    #
    # The following functions are for the challenge requirements of the three options.
    #
    ##

    # Function for the challenge requirement:
    #   Create the function that will import the csv file by entering the number 4 in the command line.
    #   After entering 4 there should be a prompt that states: "Which file would you like to import", a
    #   way the enter the file and then after hitting enter the file should be loaded into your address
    #   book.
    def import_from_csv
      puts 'Which file would you like to import?'
      file_path = gets.chomp
      CsvImporter.new(@database, file_path).import
      puts 'Import complete.'
    rescue FileNotFoundError
      puts 'The specified file was not found.'
    rescue CsvInvalidError => e
      puts e.message
    end

    # Function for the challenge requirement:
    #   After the test file is created, create the function that will search an entry by entering 3 in
    #   the command line. After entering 3 in the command line, you can search your phone book by name.
    def search_by_name
      puts 'Enter a name to search for'
      lookup_name = gets.chomp
      result = @search.name(lookup_name)
      puts "\n#{formatted_search_result(result)}"
    rescue EntryNotFoundError => e
      puts e.message
    end

    # Function for the challenge requirement:
    #   The last method you will create is exit. This will close the application and go back to the
    #   normal terminal prompt. No test file for this method is needed.
    def exit_program
      exit
    end

    private

    def formatted_search_result(data)
      <<~TEXT
        Name: #{data.first}
        Phone Number: #{data[1]}
        Email: #{data[2]}
      TEXT
    end
  end
end
