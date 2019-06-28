require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  describe '#release_bike' do
    it 'releases a working bike' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end
  end

  describe '#bike' do
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike 
    end
  end

end