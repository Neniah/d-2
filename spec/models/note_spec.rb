require 'rails_helper'

RSpec.describe Note, type: :model do
  it 'returns notes that match the search term' do
    user = User.create(
      first_name: 'Jane',
      last_name: 'Tester',
      email: 'tester@example.com',
      password: 'volatile-pavillion',
    )
  end
end
