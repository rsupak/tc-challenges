require './lib/address_book'

# Setup and start command line interface
database = AddressBook::Database.new
@menu = AddressBook::Menu.new(database)

loop do
  @menu.select_option
end
