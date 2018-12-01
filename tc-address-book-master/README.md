# address-book

## Tech Stack
* Ruby 2.4.2
* Database: SQLite 3 in memory database.
    * ORM: Sequelize gem
* Testing: RSpec
* Linting/formatting: Rubocop gem


## Running the program
1. Install ruby 2.4.2 using your preferred ruby version manager or OS package (rvm, rbenv, brew install, etc.). 
Switch to that ruby version.
2. Install Bundler: `gem install bundler`
3. Install packages with: `bundle install`
4. Run the command line interface (CLI) menu: `ruby ./bin/address_book_cli.rb`

This will display the following menu. Per the challenge requirements, only options 3, 4, and 5 were implemented.
```
Welcome to MyAddressBook!
Main Menu - 0 entries
1 - View all entries
2 - Create an entry
3 - Search for an entry
4 - Import entries from a CSV
5 - Exit
Enter your selection:
```

## Running the tests
RSpec is used to run tests located in the `spec/lib` directory. To run all tests, use:

```bash
bundle exec rspec
```

## Challenge requirements
#### When running the file from the command line, list the menu as shown above.
Implemented in:

 `./bin/address_book_cli.rb`

#### Create 2 test files and get them to pass. The requirements are above.
Implemented in:

 `./spec/lib/address_book/csv_importer_spec.rb`
`./spec/lib/address_book/entry_spec.rb`

#### Create 3 functions one to list search entries, one to add contacts through a csv file and the last to exit the application.
Implemented in:

`.spec/lib/address_book/menu.rb`

## Architecture
All code is included under the module `AddressBook`.

The runnable file is located at `./bin/address_book_cli.rb`. This will initialize the database and `AddressBook::Menu`.

The main point of entry is the `AddressBook::Menu` class which prints the menu to STDOUT and accepts user input. This 
class contains the 3 functions required in the challenge (search_by_name, import_from_csv, exit_program).
 
The menu requires an `AddressBook::Database` object for initialization. This class creates the database table in SQLite.
 
The `'AddressBook::Entry` class is used to search for entries in the database by name. This is done 
case-insensitively by performing a SQL `lower()` function of the column name and the lookup argument. Since it uses 
the `.where()` function without code fragments, input is automatically sanitized and protects against SQL injection.
 
The `AddressBook::CsvImporter` class reads a file specified by the user and inserts the records into the database 
"entries" table. This is performed through an "UPSERT" (Update and Insert) operation that first checks if a row 
exists, and if so,  updates the row by inserting a new row and deleting the old one. This class also validates that 
the CSV header  contains all the required fields.

The CSV files for running the code and testing are located in the `./spec/fixtures` directory.
