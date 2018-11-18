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

  private

  def within_limit_coordinates?(top_right_x, top_right_y)
    x_valid = (0..limits[:x]).to_a.include?(top_right_x)
    y_valid = (0..limits[:y]).to_a.include?(top_right_y)

    x_valid && y_valid
  end
end
