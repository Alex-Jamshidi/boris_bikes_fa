require 'docking_station'
describe DockingStation do
    station = DockingStation.new
    green_bike = Bike.new

    it {expect(DockingStation.new).to respond_to :release_bike} 

    # it {expect(DockingStation.new.release_bike.working?).to be true}
    # Test is now redundant as release_bike should check for bike first.

    it "check if bike is working" do
        station = DockingStation.new
        station.dock_bike(green_bike)
        expect(station.release_bike.working?).to be true
    end

    it {expect(DockingStation.new).to respond_to :dock_bike}

    
    it {expect(DockingStation.new.dock_bike(green_bike)).to eq green_bike }

    it "return false if there is no bike in station" do
        station = DockingStation.new
        expect(station.is_there_bike?).to eq false
    end

    it "checks if station has any bikes" do
        station.dock_bike(green_bike)
        expect(station.is_there_bike?).to eq green_bike
    end 

    it "return error if release_bike called when no bikes available" do
        station = DockingStation.new
        expect{station.release_bike}.to raise_error("No Bike Available")
    end

end
