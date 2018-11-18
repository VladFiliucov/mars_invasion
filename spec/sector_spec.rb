require 'spec_helper';
require_relative '../lib/sector';

describe Sector do
  let(:sector) { Sector.new(2, 2) }

  describe '#add_robot' do
    let(:robot) { double('Robot') }

    it 'can add robot' do
      sector.add_robot(robot)

      expect(sector.robots).to include(robot)
    end
  end

  describe '#remove_robot' do
    it 'can remove robot' do
    end
  end
end
