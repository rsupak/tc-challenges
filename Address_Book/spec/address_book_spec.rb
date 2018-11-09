require 'rspec'
require_relative 'address_book'

RSpec.describe AddressBook do
  subject(:book) { AddressBook.new }

  context 'should add an entry manually' do
    it 'should add entry to address book' do
      book.add_entry('Jake', '12345678', 't@t.com')
      expect(book.size).to eq 1
    end
  end

  context 'should find entry in address book' do
    it 'should display entry if name found' do
      book.add_entry('Jake', '12345678', 't@t.com')
      expect(book.search('Jake')).to eq(true)
    end
  end

  context 'should add entries by importing csv file' do
    it 'should increase address book size by number of entries' do
      book.import_file('./spec/addresses.csv')
      expect(book.size).to eq 4
      expect(book.search('Rich')).to eq(true)
      expect(book.search('Joe')).to eq(true)
    end
  end
end
