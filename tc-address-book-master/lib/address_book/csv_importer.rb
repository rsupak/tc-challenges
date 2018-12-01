# frozen_string_literal: true

#
# Copyright (c) 2018 Topcoder, Inc. All rights reserved.
#

require 'csv'

module AddressBook
  # Raise this exception when the given @file_path is not found.
  class FileNotFoundError < StandardError; end

  # Raise this exception when the CSV file is not in the required format.
  class CsvInvalidError < StandardError; end

  # This class imports a CSV file into the entries field of an AddressBook::Database.
  # The CSV file requires the following headers: 'name, phone_number, email'
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

    # Reads the address book entries for a given @file_path and upserts (replace and update
    # or insert) a row based on the :name unique key. If the file is not found, an error is
    # raised.
    def import
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

    def upsert_row(row)
      @entries
        .insert_conflict(:replace)
        .insert(
          name: row['name'],
          email: row['email'],
          phone_number: row['phone_number']
        )
    end
  end
end
