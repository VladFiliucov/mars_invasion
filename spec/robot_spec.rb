require 'spec_helper';
require_relative '../lib/robot';

describe Robot do
  describe '#lost!' do
    let(:robot) { Robot.new('N') }

    it 'changes robot status to LOST' do
      expect { robot.lost! }.to change{ robot.status }.from('ACTIVE').to('LOST')
    end

    it 'resets current_sector'
  end

  describe '#turn' do
    describe 'changes robots facing direction' do
      it 'from North to West' do
        robot = Robot.new('N')

        robot.turn('L')

        expect(robot.current_facing_direction).to eq('W')
      end

      it 'from West to South' do
        robot = Robot.new('W')

        robot.turn('L')

        expect(robot.current_facing_direction).to eq('S')
      end

      it 'from South to East' do
        robot = Robot.new('S')

        robot.turn('L')

        expect(robot.current_facing_direction).to eq('E')
      end

      it 'from East to North' do
        robot = Robot.new('E')

        robot.turn('L')

        expect(robot.current_facing_direction).to eq('N')
      end
    end
  end
end
