require 'rails_helper'

RSpec.describe MySolve, type: :model do
  subject {
    described_class.new(time: 12.0,
                        scramble: "timur@gmail.com",
                        user_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a time" do
    subject.time = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a scramble" do
    subject.scramble = nil
    expect(subject).to_not be_valid
  end
end

