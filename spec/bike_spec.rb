require 'bike'

describe Bike do

  it { is_expected.to respond_to :working? }

  describe '#report_broken' do
    it 'bikes can be reported as broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end

end
