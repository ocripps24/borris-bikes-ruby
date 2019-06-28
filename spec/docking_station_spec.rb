require 'docking_station'

describe DockingStation do

  subject(:station) { described_class.new }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end

    it 'releases a bike' do
      bike = Bike.new
      station.dock(bike)
      expect(station.release_bike).to be_working
    end

    it 'raises an error if there are no bikes' do
      expect { station.release_bike }.to raise_error "No bikes available"
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(station.dock(bike)).to eq station.bikes
    end

    it 'raises an error if dock is at max capacity' do
      20.times { station.dock Bike.new }
      expect { station.dock Bike.new }.to raise_error "Maximum capacity"
    end
  end

  describe '#bikes' do
    it 'returns docked bikes' do
      bike = Bike.new
      station.dock(bike)
      expect(station.bikes).to eq station.bikes
    end
  end

end
