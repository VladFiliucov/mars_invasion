require 'spec_helper';
require_relative '../lib/robot';

describe Robot do
  describe '#lost!' do
    let(:robot) { Robot.new }

    it 'changes robot status to LOST' do
      expect { robot.lost! }.to change{ robot.status }.from('ACTIVE').to('LOST')
    end

    it 'resets current_sector'
  end
end
