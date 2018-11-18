class Robot
  attr_reader :status

  def initialize
    @status = 'ACTIVE'
  end

  def lost!
    @status = 'LOST'
  end
end
