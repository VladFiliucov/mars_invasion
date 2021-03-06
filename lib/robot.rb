class Robot
  attr_reader :status, :current_facing_direction, :current_sector, :lost_sector

  def initialize(current_facing_direction)
    @status = 'ACTIVE'
    @current_facing_direction = current_facing_direction
  end

  def set_sector(sector)
    @current_sector = sector
  end

  def lost!
    @lost_sector = @current_sector
    @status = 'LOST'
  end

  def reset_current_sector
    @current_sector = nil
  end

  def send_signal(signal)
    return turn(signal) if ["L", "R"].include?(signal.upcase)

    go
  end

  def forward_sector_coordinates
    new_coordinates = {
      x: current_sector.x,
      y: current_sector.y
    }
    case current_facing_direction
    when "N"
      new_coordinates[:x] += 1
    when "S"
      new_coordinates[:x] -= 1
    when "E"
      new_coordinates[:y] += 1
    when "W"
      new_coordinates[:y] -= 1
    end

    new_coordinates
  end

  def set_surface(surface)
    @surface = surface
  end

  def lost?
    status == 'LOST'
  end

  private

  attr_reader :surface

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

  def turn(side)
    new_facing_direction = case side
      when "L"
        LEFT_TURN_MAPPER.fetch(current_facing_direction)
      when "R"
        RIGHT_TURN_MAPPER.fetch(current_facing_direction)
      end

    @current_facing_direction = new_facing_direction
  end

  def go
    unless current_sector.scents.include?(current_facing_direction)
      @surface.move_robot(self)
    end
  end
end
