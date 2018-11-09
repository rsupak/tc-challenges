require 'rspec'
require 'menu_controller'

RSpec.describe MenuController do
  subject(:session) { MenuController.new }
  before { expect(session).to receive(:selection).with(instance_of(Integer)) }

  context 'should respond to user selections' do
    it 'responds to View all entries' do
      session.selection(1)
    end

    it 'responds to Create an entry' do
      session.selection(2)
    end

    it 'responds to Search for an entry' do
      session.selection(3)
    end

    it 'responds to Import entries from a CSV file' do
      session.selection(4)
    end

    it 'responds to Exit' do
      session.selection(5)
    end
  end
end
