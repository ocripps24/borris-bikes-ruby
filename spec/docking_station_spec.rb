require 'docking_station'

describe DockingStation do

  subject(:station) { described_class.new }
  let(:bike) { Bike.new }

  describe '#initialize' do
    it 'has a default capacity' do
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Maximum capacity'
    end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike) }
      expect { docking_station.dock(bike) }.to raise_error 'Maximum capacity'
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end

    it 'releases a working bike' do
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
      station.capacity.times { station.dock(bike) }
      expect { station.dock(bike) }.to raise_error "Maximum capacity"
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
