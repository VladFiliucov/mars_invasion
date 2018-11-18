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

  describe '#send_signal' do
    describe '(left) changes robots facing direction' do
      it 'from North to West' do
        robot = Robot.new('N')

        robot.send_signal('L')

        expect(robot.current_facing_direction).to eq('W')
      end

      it 'from West to South' do
        robot = Robot.new('W')

        robot.send_signal('L')

        expect(robot.current_facing_direction).to eq('S')
      end

      it 'from South to East' do
        robot = Robot.new('S')

        robot.send_signal('L')

        expect(robot.current_facing_direction).to eq('E')
      end

      it 'from East to North' do
        robot = Robot.new('E')

        robot.send_signal('L')

        expect(robot.current_facing_direction).to eq('N')
      end
    end

    describe '(right) changes robots facing direction' do
      it 'from North to East' do
        robot = Robot.new('N')

        robot.send_signal('R')

        expect(robot.current_facing_direction).to eq('E')
      end

      it 'from West to North' do
        robot = Robot.new('W')

        robot.send_signal('R')

        expect(robot.current_facing_direction).to eq('N')
      end

      it 'from South to West' do
        robot = Robot.new('S')

        robot.send_signal('R')

        expect(robot.current_facing_direction).to eq('W')
      end

      it 'from East to South' do
        robot = Robot.new('E')

        robot.send_signal('R')

        expect(robot.current_facing_direction).to eq('S')
      end
    end
  end

  xdescribe '#go' do
    it 'changes Robots current_sector' do
      robot = Robot.new('E')

      expect{ robot.go }.to change{robot.current_sector}
    end
  end
end
