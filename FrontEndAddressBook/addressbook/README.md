# tcvc-challenge

Frontend for Address Book Pt. 2

### Description

Adds frontend functionality for the previous Command Line Address Book.
Creates views for the first 4 selections of the address book. Adds simple
touch/click functionality for the selection items rather than numerical
input selection. Click `View all entries` to bring up a view that lists each entry
in the database, or click `Create an entry` to bring up the entry creation
view. There are two methods to `Search for an entry`, either click the 
`Search for an entry` button to open an advanced search that allows for a user 
to search via the criteria for an entry (firstname, lastname, phone, or email).
All or some of the criteria can be used. The second method is a simple search that
can be accessed via the `View all entries` view. At the top of the view is a simple
search bar that can narrow down the number of displayed entries by the lastname field.
The `Import entries from a CSV` field allows a user to upload a .CSV file to fill the 
database. If an entry already exists in the database (designated by the firstname and
and lastname rows) the entry will be updated, else a new entry will be created.
`Exit` option is not currently active.

## Prerequisites

1. Ruby 2.5.x
2. Rails 5.2.2
3. SQLite3

## Local Deployment

```bash
bundle install
rails db:migrate
rails s
```

Finally the application in a browser @ `localhost:3000/welcome/index`

`bundle install` installs all dependencies
`rails db:migrate` sets up database tables
`rails s` starts the development server

## Production Build and Installation

Currently only in development build

### Manual Deployment Notes

If `addressbook/db` contains a file called `development.sqlite3`
delete `development.sqlite3` from the db directory before you type 
```bash
rails db:migrate
```
into the console.

If there is an error during the migration drop the tables and migrate again.
```bash
rails db:drop
rails db:migrate
```

This will create a new, empty table.

## Running Tests

## Notes

Currently utilizing 3 controllers, the Welcome controller introduces the main menu,
the Entry controller deals with all CRUD features of the application, and the 
Search controller which deals with advanced searches by parameter.

Fixed - Pagination on the `View all Entries` selection, entries now paginate when
        greater than 5 entries in the database.

Updated - User interface improved to make selections easier.
          `View all Entries` now sorts entries in ascending order by lastname.

To Implement - considering a separate view for uploading CSV files to database

The entry model validates the creation of each entry.

After all links are built out, I will be adding the production db, and hosting the address
book on heroku.

# Link to Demo Videos

Demo Video Link
https://youtu.be/UWYEihFkGyE
