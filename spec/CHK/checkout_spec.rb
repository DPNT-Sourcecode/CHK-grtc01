require './lib/solutions/CHK/checkout.rb'

describe Checkout do
  # Edge Case
  it 'App should return -1 if & is in the basket' do
    expect(subject.checkout('&')).to eq(-1)
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
  it 'App should return -1 if ABCD& are in the basket' do
    expect(subject.checkout('ABCD&')).to eq(-1)
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
  it 'App should return 250 if AAABAAA are  in the basket' do
    expect(subject.checkout('AAABAAA')).to eq(280)
  end
  # 2E get one B free
  it 'App should return 80 if EEB are  in the basket' do
    expect(subject.checkout('EEB')).to eq(80)
  end
  it 'App should return 80+100 if EEBAA are  in the basket' do
    expect(subject.checkout('EEBAA')).to eq(180)
  end
  it 'App should return 160 if EEBEEB are  in the basket' do
    expect(subject.checkout('EEBEEB')).to eq(160)
  end
  it 'App should return 280 if ABCDEABCDE are  in the basket' do
    expect(subject.checkout('ABCDEABCDE')).to eq(280)
  end
  it 'App should return 280 if CCADDEEBBA are  in the basket' do
    expect(subject.checkout('CCADDEEBBA')).to eq(280)
  end
  it 'App should return 455 if AAAAAEEBAAABB are  in the basket' do
    expect(subject.checkout('AAAAAEEBAAABB')).to eq(455)
  end
  it 'App should return 10 if F are  in the basket' do
    expect(subject.checkout('F')).to eq(10)
  end
  it 'App should return 20 if FF are  in the basket' do
    expect(subject.checkout('FF')).to eq(20)
  end
  it 'App should return 20 if FFF are  in the basket' do
    expect(subject.checkout('FFF')).to eq(20)
  end
  it 'App should return 30 if FFFF are  in the basket' do
    expect(subject.checkout('FFFF')).to eq(30)
  end
  it 'App should return 40 if FFFFFF are  in the basket' do
    expect(subject.checkout('FFFFFF')).to eq(40)
  end
  # +------+-------+------------------------+
  # | Item | Price | Special offers         |
  # +------+-------+------------------------+
  # | A    | 50    | 3A for 130, 5A for 200 |
  # | B    | 30    | 2B for 45              |
  # | C    | 20    |                        |
  # | D    | 15    |                        |
  # | E    | 40    | 2E get one B free      |
  # | F    | 10    | 2F get one F free      |
  # | G    | 20    |                        |
  # | H    | 10    | 5H for 45, 10H for 80  |
  # | I    | 35    |                        |
  # | J    | 60    |                        |
  # | K    | 80    | 2K for 150             |
  # | L    | 90    |                        |
  # | M    | 15    |                        |
  # | N    | 40    | 3N get one M free      |
  # | O    | 10    |                        |
  # | P    | 50    | 5P for 200             |
  # | Q    | 30    | 3Q for 80              |
  # | R    | 50    | 3R get one Q free      |
  # | S    | 30    |                        |
  # | T    | 20    |                        |
  # | U    | 40    | 3U get one U free      |
  # | V    | 50    | 2V for 90, 3V for 130  |
  # | W    | 20    |                        |
  # | X    | 90    |                        |
  # | Y    | 10    |                        |
  # | Z    | 50    |                        |
  # +------+-------+------------------------+
  it 'App should return 20 if G are  in the basket' do
    expect(subject.checkout('G')).to eq(20)
  end
  it 'App should return 10 if H  are  in the basket' do
    expect(subject.checkout('H')).to eq(10)
  end
  it 'App should return 35 if I  are  in the basket' do
    expect(subject.checkout('I')).to eq(35)
  end
  it 'App should return 60 if J are  in the basket' do
    expect(subject.checkout('J')).to eq(60)
  end
  it 'App should return 80 if K are  in the basket' do
    expect(subject.checkout('K')).to eq(80)
  end
  it 'App should return 90 if L are  in the basket' do
    expect(subject.checkout('L')).to eq(90)
  end
  it 'App should return 15 if M are  in the basket' do
    expect(subject.checkout('M')).to eq(15)
  end
  it 'App should return 40 if N are  in the basket' do
    expect(subject.checkout('N')).to eq(40)
  end

  it 'App should return 10 if O are  in the basket' do
    expect(subject.checkout('O')).to eq(10)
  end
  it 'App should return 50 if P are  in the basket' do
    expect(subject.checkout('P')).to eq(50)
  end
  it 'App should return 30 if Q are  in the basket' do
    expect(subject.checkout('Q')).to eq(30)
  end
  it 'App should return 50 if R are  in the basket' do
    expect(subject.checkout('R')).to eq(50)
  end
  it 'App should return 30 if S are  in the basket' do
    expect(subject.checkout('S')).to eq(30)
  end
  it 'App should return 20 if T are  in the basket' do
    expect(subject.checkout('T')).to eq(20)
  end
  it 'App should return 40 if U are  in the basket' do
    expect(subject.checkout('U')).to eq(40)
  end
  it 'App should return 50 if V are  in the basket' do
    expect(subject.checkout('V')).to eq(50)
  end
  it 'App should return 20 if W are  in the basket' do
    expect(subject.checkout('W')).to eq(20)
  end
  it 'App should return 90 if X are  in the basket' do
    expect(subject.checkout('X')).to eq(90)
  end
  it 'App should return 10 if Y are  in the basket' do
    expect(subject.checkout('Y')).to eq(10)
  end
  it 'App should return 50 if Z are  in the basket' do
    expect(subject.checkout('Z')).to eq(50)
  end
end


