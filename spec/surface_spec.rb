require 'spec_helper';
require_relative '../lib/surface';
require_relative '../lib/sector';

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
end
