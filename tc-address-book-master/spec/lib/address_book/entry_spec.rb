# frozen_string_literal: true

#
# Copyright (c) 2018 Topcoder, Inc. All rights reserved.
#

require 'spec_helper'
require './lib/address_book/entry'

RSpec.describe AddressBook::Entry do
  let(:database) { AddressBook::Database.new }
  let(:entry) { described_class.new(database) }

  before do
    # Load data from the fixtures csv using the CsvImporter
    AddressBook::CsvImporter.new(database, './spec/fixtures/entries.csv').import
  end

  describe '#name' do
    it 'finds an entry by name' do
      expect(entry.name('Bill')).to eq(%w[Bill 555-555-4854 bill@example.com])
    end

    it 'finds an entry by case-insensitive name' do
      expect(entry.name('bill')).to eq(%w[Bill 555-555-4854 bill@example.com])
      expect(entry.name('BILL')).to eq(%w[Bill 555-555-4854 bill@example.com])
    end

    it 'raises an exception if the entry was not found' do
      expect { entry.name('Kenny') }.to raise_exception(
        AddressBook::EntryNotFoundError,
        'There is no Kenny in your address book'
      )
    end

    it 'sanitizes against SQL injection in user input' do
      expect { entry.name('Bill; DROP TABLE entries;') }.to raise_exception(
        AddressBook::EntryNotFoundError,
        'There is no Bill; DROP TABLE entries; in your address book'
      )
    end
  end
end
