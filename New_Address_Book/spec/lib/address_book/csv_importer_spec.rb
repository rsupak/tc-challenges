require 'spec_helper'
require './lib/address_book/csv_importer'
require './lib/address_book/database'

RSpec.describe AddressBook::CsvImporter do
  let(:database) { AddressBook::Database.new }

  describe '#import' do
    context 'with a valid file' do
      let(:file_path) { './spec/csv_files/entries.csv' }
      let(:importer) { described_class.new(database, file_path) }

      before { importer.import }

      it 'reads all entries into memory' do
        expect(importer.entries.count).to eq(database.entries.count)
      end

      it 'parses the fields using headers' do
        expect(importer.entries.first[:name]).to eq(database.entries.first[:name])
      end

      it 'does not insert duplicate entries from multiple imports' do
        importer.import
        expect(importer.entries.count).to eq(database.entries.count)
      end

      it 'upserts entries with matching names' do
        update_importer = described_class.new(database, './spec/csv_files/entries_update.csv')
        update_importer.import
        expect(importer.entries.count).to eq(database.entries.count)

        bill = importer.entries.where(name: 'Bill').first
        expect(bill[:email]).to eq('new.bill@example.com')
        expect(bill[:phone_number]).to eq('555-555-1000')

        bob = importer.entries.where(name: 'Bob').first
        expect(bob[:email]).to eq('new.bob@example.com')
        expect(bob[:phone_number]).to eq('555-555-1001')
      end
    end

    context 'with an invalid file path' do
      let(:importer) { described_class.new(database, 'invalid_file') }

      it 'raises a FileNotFound error' do
        expect { importer.import }.to raise_exception(AddressBook::FileNotFoundError)
      end
    end

    context 'with an invalid number of columns' do
      let(:file_path) { './spec/csv_files/entries_invalid_missing_column.csv' }

      it 'raises a CsvInvalid error' do
        expect { described_class.new(database, file_path) }
          .to raise_exception(AddressBook::CsvInvalidError)
      end
    end
  end
end
