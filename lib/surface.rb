class Surface
  attr_reader :sectors, :limits

  def initialize(limits = { x: 50, y: 50 })
    @limits = limits
    @sectors = []
  end

  def generate_sectors(top_right_x, top_right_y)
    return unless within_limit_coordinates?(top_right_x, top_right_y)

    verticals = (1..top_right_x).to_a
    horizontals = (1..top_right_y).to_a
    arrays_with_coordinates = verticals.product(horizontals)
    arrays_with_coordinates.each do |x, y|
      @sectors << Sector.new(x, y)
    end
  end

  def land_robot(robot, x, y)
    sector = find_sector({ x: x, y: y})

    if sector
      robot.set_sector(sector)
      sector.add_robot(robot)
    else
      robot.lost!
    end
  end

  def move_robot(robot)
    next_sector = find_sector(robot.forward_sector_coordinates)

    unless next_sector
      robot.current_sector.add_scent(robot.current_facing_direction)
      robot.lost!
      robot.current_sector.remove_robot(robot)
      robot.reset_current_sector
      return
    end

    robot.current_sector.remove_robot(robot)
    next_sector.add_robot(robot)
    robot.set_sector(next_sector)
  end

  private

  def find_sector(x:, y:)
    @sectors.find { |sector| sector.x == x && sector.y == y }
  end

  def within_limit_coordinates?(top_right_x, top_right_y)
    x_valid = (0..limits[:x]).to_a.include?(top_right_x)
    y_valid = (0..limits[:y]).to_a.include?(top_right_y)

    x_valid && y_valid
  end
end
