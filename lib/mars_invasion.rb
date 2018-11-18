class MarsInvasion
  def initialize(surface, interface)
    @surface = surface
    @interface = interface
    @robots = []
  end

  def start
    @interface.show_wellcome
    x = @interface.request_upper_right_x
    y = @interface.request_upper_right_y

    if @surface.generate_sectors(x, y)
      @interface.successfully_generated_surface
    end

    # invaders_move_request
  end

  private

  def invaders_move_request
    loop do
    end
  end
end
