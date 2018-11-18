require 'spec_helper';
require_relative '../lib/surface';
require_relative '../lib/sector';
require_relative '../lib/robot';

describe Surface do
  let(:surface) { Surface.new }

  it 'has limits 50/50 by default' do
    expect(surface.limits[:x]).to eq(50)
    expect(surface.limits[:y]).to eq(50)
  end

  describe '#generate_sectors' do
    it 'stores generated sectors in #sectors' do
      surface.generate_sectors(2, 2)

      expect(surface.sectors.length).to eq(4)
      expect(surface.sectors.last).to be_an_instance_of(Sector)
    end

    it 'assigns coordinates correctly to sectors' do
      surface.generate_sectors(2, 3)

      expect(surface.sectors.first.x).to eq(1)
      expect(surface.sectors.first.y).to eq(1)
      expect(surface.sectors.last.y).to eq(3)
      expect(surface.sectors.last.y).to eq(3)
    end

    it 'does not create sectors if requested params are out of range' do
      surface.generate_sectors(51, 51)

      expect(surface.sectors).to be_empty
    end
  end

  describe '#land_robot' do
    let(:surface) { Surface.new }
    let(:robot) { Robot.new('N') }

    context 'missed planet' do
      it 'marks robot as LOST' do
        surface.land_robot(robot, 2, 3)

        expect(robot.status).to eq('LOST')
      end
    end

    context 'hit planet surface' do
      it 'assigns right sector to robot' do
        surface.generate_sectors(4, 4)
        surface.land_robot(robot, 2, 3)

        expect(robot.current_sector.x).to eq(2)
        expect(robot.current_sector.y).to eq(3)
      end

      it 'adds robot to sector' do
        surface.generate_sectors(4, 4)
        surface.land_robot(robot, 4, 4)

        expect(robot.current_sector.robots).to include(robot)
      end
    end
  end
end
