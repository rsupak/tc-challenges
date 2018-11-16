require 'rspec'
require_relative 'address_book'

RSpec.describe AddressBook do
  subject(:book) { AddressBook.new }

  context 'should add an entry manually' do
    it 'should add entry to address book' do
      book.add_entry('Jake Potter', '123-456-7890', 'jp@potter.com')
      expect(book.size).to eq 1
    end
  end

  context 'should be able access multiple entries' do
    it 'should access first entry in book' do
      book.add_entry('Jake Potter', '123-456-7890', 'jp@potter.com')
      book.add_entry('Tim Spartan', '555-555-5555', 'tim@Spartan.com')
      expect(book.size).to eq 2
      expect(book.entries.first.name).to eq('Jake Potter')
      expect(book.entries.first.phone).to eq('123-456-7890')
      expect(book.entries.first.email).to eq('jp@potter.com')
      expect(book.entries.last.name).to eq('Tim Spartan')
      expect(book.entries.last.phone).to eq('555-555-5555')
      expect(book.entries.last.email).to eq('tim@Spartan.com')
    end
  end
end
