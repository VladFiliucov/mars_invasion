class Robot
  attr_reader :status, :current_facing_direction

  def initialize(current_facing_direction)
    @status = 'ACTIVE'
    @current_facing_direction = current_facing_direction
  end

  def lost!
    @status = 'LOST'
  end

  def turn(side)
    @current_facing_direction =
      case current_facing_direction
      when 'N' then 'W'
      when 'W' then 'S'
      when 'S' then 'E'
      when 'E' then 'N'
      end
  end
end
