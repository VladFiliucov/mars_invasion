require 'spec_helper';
require_relative '../lib/sector';

describe Sector do
  let(:sector) { Sector.new(2, 2) }
  let(:robot) { double('Robot') }

  it 'assigns coordinates correctly' do
    sector = Sector.new(1, 3)

    expect(sector.x).to eq(1)
    expect(sector.y).to eq(3)
  end

  describe '#add_robot' do
    it 'can add robot' do
      sector.add_robot(robot)

      expect(sector.robots).to include(robot)
    end
  end

  describe '#remove_robot' do
    it 'can remove robot' do
      sector.add_robot(robot)
      expect(sector.robots).to include(robot)

      sector.remove_robot(robot)
      expect(sector.robots).to_not include(robot)
    end
  end

  describe '#add_scent' do
    it 'can add scent' do
      scent = 'N'
      sector.add_scent(scent)

      expect(sector.scents).to include(scent)
    end

    it 'does not add invalid scents' do
      scent = 11
      sector.add_scent(scent)

      expect(sector.scents).to_not include(scent)
    end
  end
end
