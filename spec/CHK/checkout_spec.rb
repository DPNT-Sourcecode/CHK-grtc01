require './lib/solutions/CHK/checkout.rb'

describe Checkout do

  it 'App should say return -1 if X is in the basket' do
    expect(subject.checkout('XXXX')).to eq(-1)
  end
end

