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
    new_facing_direction = case side
      when "L"
        LEFT_TURN_MAPPER.fetch(current_facing_direction)
      when "R"
        RIGHT_TURN_MAPPER.fetch(current_facing_direction)
      end

    @current_facing_direction = new_facing_direction
  end

  private

  LEFT_TURN_MAPPER = {
    "N" => "W",
    "W" => "S",
    "S" => "E",
    "E" => "N"
  }

  RIGHT_TURN_MAPPER = {
    "N" => "E",
    "W" => "N",
    "S" => "W",
    "E" => "S"
  }
end
