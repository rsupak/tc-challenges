# tcvc-challenge

Frontend for Address Book Pt. 1

### Description

Adds frontend functionality for the previous Command Line Address Book.
Creates view for the first 2 selections of the address book. Adds simple
touch/click functionality for the selection items rather than numerical
input selection. Click `View all entries` to bring up a view for each entry
in the database, or click `Create an entry` to bring up the entry creation
view. `Search for an entry`, `Import entries from a CSV`, and `Exit` are currently
not active links.

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

## Running Tests

## Notes

Currently utilizing 2 controllers, the Welcome controller introduces the main menu
and the Entry controller deals with all CRUD features of the application.

The entry model validates the creation of each entry.

After all links are built out, I will be adding the production db, and hosting the address
book on heroku.

# Link to Demo Videos

Demo Video Link
https://youtu.be/h2dVgc1rqpQ
