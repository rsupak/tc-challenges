require 'rspec'
require_relative 'address_book'

RSpec.describe AddressBook do
  subject(:book) { AddressBook.new }

  context 'should add an entry manually' do
    it 'should add entry to address book' do
      book.add_entry('Jake Potter', '123-456-7890', 't@t.com')
      expect(book.size).to eq 1
      expect(book.entries.first.name).to eq('Jake Potter')
      expect(book.entries.first.phone).to eq('123-456-7890')
      expect(book.entries.first.email).to eq('t@t.com')
    end
  end

  context 'should find entry in address book when searching by name' do
    it 'should display entry if name found' do
      book.add_entry('Tim Spartan', '555-555-5555', 'tim@Spartan.com')
      expect(book.size).to eq 1
      expect(book.search_by_name('Tim Spartan')).to eq(true)
    end
  end

  context 'should find entry in address book when searching by phone number' do
    it 'should display entry if name found' do
      book.add_entry('Tim Spartan', '555-555-5555', 'tim@Spartan.com')
      expect(book.search_by_phone('555-555-5555')).to eq(true)
    end
  end

  context 'should find entry in address book when searching by email' do
    it 'should display entry if name found' do
      book.add_entry('Tim Spartan', '555-555-5555', 'tim@Spartan.com')
      expect(book.search_by_email('tim@Spartan.com')).to eq(true)
    end
  end

  context 'should add entries to address book from CSV file' do
    it 'should update the address book size' do
      book.import_file(".\/csv_files\/entries.csv")
      expect(book.size).to eq 5
    end
    it 'should find imported entry' do
      book.import_file(".\/csv_files\/entries.csv")
      expect(book.search_by_name('Bill')).to eq(true)
    end
    it 'should display found entry' do
      book.import_file(".\/csv_files\/entries.csv")
      found = nil
      book.entries.each do |entry|
        found = entry if entry.name == 'Bill'
      end
      check = found.display_entry
      expect(check).to eq("Name: Bill\nPhone: 555-555-4854\nEmail: bill@example.com")
    end
  end
end
