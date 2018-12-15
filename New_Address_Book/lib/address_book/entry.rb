module AddressBook
  # Raise this exception when a search lookup is not found
  class EntryNotFoundError < StandardError
  end

  # This class provides functions for interacting with the entries in the
  # database such as searching by name using the Sequel gem. The initializer
  # requires an AddressBook::Database.
  class Entry
    ENTRY_FIELDS = %i[name phone_number email].freeze

    # Params:
    # - database: AddressBook::Database
    def initialize(database)
      @entries = database.entries
    end

    # Case-sensitive search by the :name field in the :entries table.
    # Raises an EntryNotFoundError if no records are found.
    # This method uses the Sequelize .where() method without string literals,
    # so it sanitizes against SQL injection attacks.

    # Params:
    # - lookup_item :string
    # return: Array[:name, :phone_number, :email]
    def name(lookup_name)
      entry =
        @entries.where(Sequel.function(:lower, :name) =>
        Sequel.function(:lower, lookup_name))
                .map(ENTRY_FIELDS)
                .first
      return entry unless entry.nil?

      raise EntryNotFoundError, "#{lookup_name} is not in your address book."
    end

    def phone_number(lookup_number)
      entry =
        @entries.where(Sequel.function(:lower, :phone_number) =>
        Sequel.function(:lower, lookup_number))
                .map(ENTRY_FIELDS)
                .first
      return entry unless entry.nil?

      raise EntryNotFoundError, "#{lookup_number} is not in your address book."
    end

    def email(lookup_email)
      entry =
        @entries.where(Sequel.function(:lower, :email) =>
        Sequel.function(:lower, lookup_email))
                .map(ENTRY_FIELDS)
                .first
      return entry unless entry.nil?

      raise EntryNotFoundError, "#{lookup_email} is not in your address book."
    end
  end
end
