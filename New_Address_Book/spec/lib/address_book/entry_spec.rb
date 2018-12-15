require 'spec_helper'
require './lib/address_book/entry'

RSpec.describe AddressBook::Entry do
  let(:database) { AddressBook::Database.new }
  let(:entry) { described_class.new(database) }

  before do
    # Load data from the fixtures csv using the CsvImporter
    AddressBook::CsvImporter.new(database, './spec/csv_files/entries.csv').import
  end

  describe '#search for an entry' do
    it 'finds an entry by name' do
      expect(entry.name('Bill')).to eq(%w[Bill 555-555-4854 bill@example.com])
    end

    it 'finds an entry by case-insensitive name' do
      expect(entry.name('bill')).to eq(%w[Bill 555-555-4854 bill@example.com])
      expect(entry.name('BILL')).to eq(%w[Bill 555-555-4854 bill@example.com])
    end

    it 'finds an entry by phone number' do
      expect(entry.phone_number('555-555-4854')).to eq(%w[Bill 555-555-4854 bill@example.com])
    end

    it 'finds an entry by email' do
      expect(entry.email('bill@example.com')).to eq(%w[Bill 555-555-4854 bill@example.com])
    end

    it 'raises an exception if the entry was not found by name' do
      expect { entry.name('Kenny') }.to raise_exception(
        AddressBook::EntryNotFoundError,
        'Kenny is not in your address book.'
      )
    end

    it 'raises an exception if the entry was not found by phone number' do
      expect { entry.phone_number('555-555-0001') }.to raise_exception(
        AddressBook::EntryNotFoundError,
        '555-555-0001 is not in your address book.'
      )
    end

    it 'raises an exception if the entry was not found by email' do
      expect { entry.email('kenny@example.com') }.to raise_exception(
        AddressBook::EntryNotFoundError,
        'kenny@example.com is not in your address book.'
      )
    end

    it 'sanitizes against SQL injection in user input' do
      expect { entry.name('Bill; DROP TABLE entries;') }.to raise_exception(
        AddressBook::EntryNotFoundError,
        'Bill; DROP TABLE entries; is not in your address book.'
      )
    end
  end
end
