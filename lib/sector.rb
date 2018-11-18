class Sector
  attr_reader :x, :y, :scents, :robots

  def initialize(x, y)
    @robots = []
    @scents = []
  end

  def add_robot(robot)
    @robots << robot
  end

  def remove_robot(robot)
    @robots.delete(robot)
  end

  def add_scent(scent)
    @scents << scent if valid_scent?(scent)
  end

  private

  def valid_scent?(scent)
    ['N', 'E', 'S', 'W'].include?(scent)
  end
end
