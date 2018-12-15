# TCVC - Veteran Challenges
Command Line Address Book - Edge Cases

### Description

This is the fourth challenge in a series of challenges of building a command line application called address book. 
We will learn how to build an app the correct way by using Test Driven Development. You should build the test file first 
and then the function after. In this challenge we will be covering some edge cases and building a database for the application.

In this challenge we will make sure that our application runs smoothly by taking care of some edge cases. No edge cases were
considered when building our application. An example is you can enter a person with a phone number of only 3 digits. The point
of this challenge is to come up with 4 edges cases and tests for these edge cases. So for the example above maybe create an alert
must enter phone number in this format 444-444-2313 if someone enters a only 3 digits into the phone number section. You can add
to current functions or create new functions from scratch. It's your choice how to handle the edge cases.

Create a database for this application so when you close your application in the homepage it will save the information into a database.
So the next time you open the application the enteries saved in the past will be in the address book. The structure for the data base is below

entry_id         name             phone_number       email
int              string (20)      varchar (10)       string(30)

## Tech Stack
* Ruby 2.5.x
* Database: SQLite 3 DB 'test.db' in `./lib/databases`.
    * ORM: Sequelize gem
* Testing: RSpec
* Linting/formatting: Rubocop gem

## Prerequisites
1. Ruby 2.5.x
2. Bundler
3. Rspec

## Local Deployment
```bash
touch Gemfile
```
using your text editor add the following dependencies to the Gemfile

```
source 'https://rubygems.org'

gem 'sequel'
gem 'activerecord'
gem 'sqlite3'

group :development do
  gem 'byebug'
  gem 'pry'
  gem 'rspec'
  gem 'rubocop'
  gem 'rubocop-rspec'
end
```

## Production Build and Installation
How to build the application for use
```bash
bundle install --binstubs
bin/rspec --init
```

## Running the program
Run the command line interface (CLI) menu: 
```bash
ruby ./bin/address_book_cli.rb
```

This will display the following menu. 
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
This will also create the `./lib/databases/test.db` file if the file does not already exist. 
If it exists, this will connect the database to the menu.

## Running the tests
RSpec is used to run tests located in the `./spec/lib` directory. To run all tests, use:

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

The main point of entry is the `AddressBook::Menu` class which prints the menu to STDOUT and accepts user input. 

The menu requires an `AddressBook::Database` object for initialization. This class creates the database table in SQLite.
The database is then connected to the file found at `./lib/databases/test.db` if no file exists here, the initialize method
will create one.
 
The `'AddressBook::Entry` class is used to search for entries in the database by name. This is done 
case-insensitively by performing a SQL `lower()` function of the column name and the lookup argument. Since it uses 
the `.where()` function without code fragments, input is automatically sanitized and protects against SQL injection.
 
The `AddressBook::CsvImporter` class reads a file specified by the user and inserts the records into the database 
"entries" table. This is performed through an "UPSERT" (Update and Insert) operation that first checks if a row 
exists, and if so,  updates the row by inserting a new row and deleting the old one. This class also validates that 
the CSV header  contains all the required fields.

The CSV files for running the code and testing are located in the `./spec/csv_files` directory.

# Link to Demo Videos
Demo Video Link
https://youtu.be/iWN5QXt6uxw
