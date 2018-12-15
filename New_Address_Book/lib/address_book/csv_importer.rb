require 'csv'
require_relative 'menu'

module AddressBook
  # Raise this exception when the given @file_path not found
  class FileNotFoundError < StandardError
  end

  # Raise this exception when the CSV file is not in the required format.
  class CsvInvalidError < StandardError
  end

  # Raise this exception when the CSV file contains an incorrect name field.
  class NameFieldError < CsvInvalidError
    def initialize
      text = <<~TEXT
      Invalid name field found in file.
      Name field must not be blank.
      TEXT
      super(text)
    end
  end

  class PhoneNumberFieldError < CsvInvalidError
    def initialize
      text = <<~TEXT
      Invalid phone number field found in file.
      Phone number format is ###-###-####
      TEXT
      super(text)
    end
  end

  class EmailFieldError < CsvInvalidError
    def initialize
      text = <<~TEXT
      Invalid email address field found in file.
      Email should be in standard format.
      TEXT
      super(text)
    end
  end

  # This class imports a CSV file into the entries field of an
  # AddressBook::Database. The CSV file requires the following headers:
  # 'name, phone_number, email'
  class CsvImporter
    attr_reader :entries

    # Params:
    # - database: AddressBook::Database
    # - file_path: string - path to a .csv file
    def initialize(database, file_path)
      @file_path = file_path
      @entries = database.entries
      validate_csv_header
    end

    # Reads the address book entries for a given @file_path and upserts
    # (replace and update or insert) a row based on the :name unique key.
    # If the file is not found, an error is raised.
    def import
      validate_csv_data
      CSV.foreach(@file_path, headers: true) do |row|
        upsert_row(row) if row['name'].chomp.length.positive?
      end
    rescue Errno::ENOENT
      raise FileNotFoundError
    end

    private

    def validate_csv_header
      headers = CSV.open(@file_path, 'r', &:first)
      return if headers.sort == %w[email name phone_number]

      raise(CsvInvalidError, 'The file header is missing required fields.')
    rescue Errno::ENOENT
      raise FileNotFoundError
    end

    def validate_csv_data
      CSV.foreach(@file_path, headers: true) do |row|
        validate_name(row['name'])
        validate_phone_number(row['phone_number'])
        validate_email(row['email'])
      end
    end

    # validates name input
    def validate_name(name)
      return true unless name.nil? || name.empty?

      raise(NameFieldError)
    rescue Errno::ENOENT
      raise FileNotFoundError
    end

    # validates phone number input
    def validate_phone_number(phone)
      return true if VALID_PHONE_NUMBER_REGEX.match?(phone)

      raise(PhoneNumberFieldError)
    rescue Errno::ENOENT
      raise FileNotFoundError
    end

    # helper validates email input
    def validate_email(email)
      return true if URI::MailTo::EMAIL_REGEXP.match?(email)

      raise(EmailFieldError)
    rescue Errno::ENOENT
      raise FileNotFoundError
    end

    def upsert_row(row)
      @entries
        .insert_conflict(:replace)
        .insert(
          name: row['name'],
          phone_number: row['phone_number'],
          email: row['email']
        )
    end
  end
end
