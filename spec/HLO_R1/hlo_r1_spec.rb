require './lib/solutions/HLO_R1/hlo_r1.rb'

describe Hello do

  it 'App should say Hello' do
    expect(subject.hello('Kate')).to eq('Hello World!')
  end
end
