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
end
