require 'spec_helper';
require_relative '../lib/robot';

describe Robot do
  describe '#set_sector' do
    let(:robot) { Robot.new('N') }

    it 'sets current_sector' do
      sector = double('new sector')

      robot.set_sector(sector)

      expect(robot.current_sector).to eq(sector)
    end
  end

  describe '#lost!' do
    let(:robot) { Robot.new('N') }
    let(:sector) { double('new sector') }

    it 'changes robot status to LOST' do
      expect { robot.lost! }.to change{ robot.status }.from('ACTIVE').to('LOST')
    end

    it 'resets current_sector' do
      robot.set_sector(sector)

      expect { robot.lost! }
        .to change{ robot.current_sector }
        .from(sector)
        .to(nil)
    end

    it 'sets lost_sector to current_sector' do
      robot.set_sector(sector)
      robot.lost!

      expect(robot.lost_sector).to eq(sector)
    end
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

    describe 'Forward' do
      context 'when current_secotr has scent' do
        let(:sector) { instance_double("Sector", scents: ['N']) }
        let(:surface) { double("Surface") }

        it 'robot will ignore move in scent direction command' do
          robot = Robot.new('N')
          robot.set_sector(sector)

          expect(robot.send_signal('F')).to be_nil
        end

        it 'robot will run move in NOT scent direction command' do
          robot = Robot.new('S')
          robot.set_sector(sector)
          robot.set_surface(surface)

          expect(sector).to receive(:remove_robot).with(robot)
          expect(surface).to receive(:move_robot).with(robot)

          robot.send_signal('F')
        end
      end
    end
  end

  describe '#forward_sector_coordinates' do
    context 'based on robot facing direction' do
      let(:sector) { instance_double("Sector", x: 2, y: 3) }

      it 'calculates 1 to north sector coordinates' do
        robot = Robot.new('N')
        robot.set_sector(sector)

        expect(robot.forward_sector_coordinates).to eq({x: 3, y: 3})
      end

      it 'calculates 1 to east sector coordinates' do
        robot = Robot.new('E')
        robot.set_sector(sector)

        expect(robot.forward_sector_coordinates).to eq({x: 2, y: 4})
      end

      it 'calculates 1 to south sector coordinates' do
        robot = Robot.new('S')
        robot.set_sector(sector)

        expect(robot.forward_sector_coordinates).to eq({x: 1, y: 3})
      end

      it 'calculates 1 to west sector coordinates' do
        robot = Robot.new('W')
        robot.set_sector(sector)

        expect(robot.forward_sector_coordinates).to eq({x: 2, y: 2})
      end
    end
  end

  describe '#set_surface' do
    let(:surface) { double('Surface') }
    let(:robot) { Robot.new('N') }

    it 'sets surface for the robot' do
      expect(robot.set_surface(surface)).to be_truthy
    end
  end
end
