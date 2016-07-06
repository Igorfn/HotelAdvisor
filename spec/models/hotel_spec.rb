require 'rails_helper'

describe Hotel do
  before {
    @hotel = Hotel.new(title: 'asd', price_of_room: 2)


  }

  subject { @hotel }

  it { should respond_to(:title) }
  it { should respond_to(:price_of_room) }

  it { should be_valid }

  # describe "when title is not present" do
  #   before { @hotel.title = " " }
  #   it { should_not be_valid }
  # end
  # describe 'when price is not present or it is not a number' do
  #   before { @hotel.price_of_room = " " }
  #   it { should_not be_valid }
  # end
  # describe 'when price is not bigger then 0 ' do
  #   before { @hotel.price_of_room = -1 }
  #   it { should_not be_valid }
  # end

  # describe "when title is too long" do
  #   before { @hotel.title = "a" * 51 }
  #   it { should_not be_valid }
  # end

end