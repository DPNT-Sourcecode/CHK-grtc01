require './lib/solutions/CHK/checkout.rb'

describe Checkout do
  # Edge Case
  it 'App should say return -1 if X is in the basket' do
    expect(subject.checkout('X')).to eq(-1)
  end
  # Single Items
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
  # Multiple Items
  it 'App should say return 80 if AB are in the basket' do
    expect(subject.checkout('AB')).to eq(80)
  end
  it 'App should say return 100 if ABC are in the basket' do
    expect(subject.checkout('ABC')).to eq(100)
  end
  it 'App should say return 115 if ABCD are in the basket' do
    expect(subject.checkout('ABCD')).to eq(115)
  end
  it 'App should say return 100 if AA are in the basket' do
    expect(subject.checkout('AA')).to eq(100)
  end
  # Multiple Items Edge Case
  it 'App should say return -1 if ABCDX are in the basket' do
    expect(subject.checkout('ABCDX')).to eq(-1)
  end
  # # Special Offers
  # it 'App should say return 130 if AAA are in the basket' do
  #   expect(subject.checkout('AAA')).to eq(130)
  # end
end
