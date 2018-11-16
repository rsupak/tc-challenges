include RSpec
require_relative 'entry'

RSpec.describe Entry do
  before(:each) do
    @entry = Entry.new
    @entry.name = 'Julius Caesar'
    @entry.phone = '(555) 555-5555'
    @entry.email = 'hailbrutus@rome.com'
  end

  it 'returns name of entry' do
    expect(@entry.name).to eq('Julius Caesar')
  end

  it 'returns phone number of entry' do
    expect(@entry.phone).to eq('(555) 555-5555')
  end

  it 'returns email address of entry' do
    expect(@entry.email).to eq('hailbrutus@rome.com')
  end
end
