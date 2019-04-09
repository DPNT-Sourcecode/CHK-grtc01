require './lib/solutions/CHK/checkout.rb'

describe Checkout do

  it 'App should say return -1 if X is in the basket' do
    expect(subject.checkout('X')).to eq(-1)
  end
  it 'App should say return 50 if A is in the basket' do
    expect(subject.checkout('A')).to eq(50)
  end
  it 'App should say return 30 if B is in the basket' do
    expect(subject.checkout('B')).to eq(30)
  end
  it 'App should say return 20 if C is in the basket' do
    expect(subject.checkout('C')).to eq(20)
  end
  it 'App should say return 15 if D is in the basket' do
    expect(subject.checkout('D')).to eq(15)
  end
  it 'App should say return 80 if AB are in the basket' do
    expect(subject.checkout('AB')).to eq(80)
  end
end

