require 'spec_helper'
require './lib/address_book/database'
require './lib/address_book/menu'

RSpec.describe AddressBook::Menu do
  let(:database) { AddressBook::Database.new }
  let(:menu) { AddressBook::Menu.new(database) }

  describe '#manual entry' do
    it 'does not allow empty name fields' do
      expect(menu.validate_name('')).to eq(false)
    end

    it 'allows a name with spaces' do
      expect(menu.validate_name('James Smith')).to eq(true)
    end

    it 'expects phone number format to be ###-###-####' do
      expect(menu.validate_phone_number('555')).to eq(false)
    end

    it 'expects phone number format to be ###-###-####' do
      expect(menu.validate_phone_number('5555555555')).to eq(false)
    end

    it 'allows a valid phone number format' do
      expect(menu.validate_phone_number('555-555-5555')).to eq(true)
    end

    it 'expects email format to be local-part@domain' do
      expect(menu.validate_email('abc')).to eq(false)
    end

    it 'expects email format to be local-part@domain' do
      expect(menu.validate_email('abc.test.com')).to eq(false)
    end

    it 'allows a valid email address' do
      expect(menu.validate_email('test@test.com')).to eq(true)
    end
  end
end
