class Sector
  attr_reader :x, :y, :scents, :robots

  def initialize(x, y)
    @robots = []
  end

  def add_robot(robot)
    @robots << robot
  end

  def remove_robot(robot)
    @robots.delete(robot)
  end
end
