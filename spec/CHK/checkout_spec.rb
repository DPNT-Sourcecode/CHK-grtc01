require './lib/solutions/CHK/checkout.rb'

describe Checkout do

  # it 'App should say return -1 if X is in the basket' do
  #   expect(subject.checkout('X')).to eq(-1)
  # end
  it 'App should say return 50 if A is in the basket' do
    expect(subject.checkout('A')).to eq(50)
  end
end


