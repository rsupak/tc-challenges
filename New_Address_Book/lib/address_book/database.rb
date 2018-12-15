require 'sequel'

module AddressBook
  # This class initializes the SQLite database and initializes the :entries
  # table. The Sequel gem is used for the database ORM.
  class Database
    attr_reader :entries

    def initialize
      @db = Sequel.connect('sqlite://./lib/databases/test.db')

      @db.create_table? :entries do
        primary_key :id
        index String :name, unique: true, null: false
        String :email
        String :phone_number
      end
      @entries = @db[:entries]
    end

    # Returns an integer of the number of entries in the database.
    def number_of_entries
      @entries.count
    end
  end
end
