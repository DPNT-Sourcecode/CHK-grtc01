require './lib/solutions/CHK/checkout.rb'

describe Checkout do
  # Edge Case
  it 'App should return -1 if X is in the basket' do
    expect(subject.checkout('X')).to eq(-1)
  end
  # # Single Items
  it 'App should return 50 if A is in the basket' do
    expect(subject.checkout('A')).to eq(50)
  end
  it 'App should return 30 if B is in the basket' do
    expect(subject.checkout('B')).to eq(30)
  end
  it 'App should return 20 if C is in the basket' do
    expect(subject.checkout('C')).to eq(20)
  end
  it 'App should return 15 if D is in the basket' do
    expect(subject.checkout('D')).to eq(15)
  end
  # Multiple Items
  it 'App should return 80 if AB are in the basket' do
    expect(subject.checkout('AB')).to eq(80)
  end
  it 'App should return 100 if ABC are in the basket' do
    expect(subject.checkout('ABC')).to eq(100)
  end
  it 'App should return 115 if ABCD are in the basket' do
    expect(subject.checkout('ABCD')).to eq(115)
  end
  it 'App should return 100 if AA are in the basket' do
    expect(subject.checkout('AA')).to eq(100)
  end
  # Multiple Items Edge Case
  it 'App should return -1 if ABCDX are in the basket' do
    expect(subject.checkout('ABCDX')).to eq(-1)
  end
  # Special Offers
  it 'App should return 175 if AAABB are in the basket' do
    expect(subject.checkout('AAABB')).to eq(175)
  end
  # New products & offers
  it 'App should return 40 if E is in the basket' do
    expect(subject.checkout('E')).to eq(40)
  end
  it 'App should return 180 if AAAA are  in the basket' do
    expect(subject.checkout('AAAA')).to eq(180)
  end
  it 'App should return 200 if AAAAA are  in the basket' do
    expect(subject.checkout('AAAAA')).to eq(200)
  end
  it 'App should return 250 if AAAAAA are  in the basket' do
    expect(subject.checkout('AAAAAA')).to eq(250)
  end
  # 2E get one B free
  it 'App should return 80 if EEB are  in the basket' do
    expect(subject.checkout('EEB')).to eq(80)
  end
  it 'App should return 80+100 if EEBAA are  in the basket' do
    expect(subject.checkout('EEBAA')).to eq(180)
  end
end



