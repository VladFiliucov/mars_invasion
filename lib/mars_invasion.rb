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

    invaders_move_request
  end

  private

  def invaders_move_request
    loop do
      @interface.display_user_menu

      user_menu
    end
  end

  def user_menu
    choise = @interface.get_user_choise

    case choise
    when 0
      exit
    when 1
      land_robot
    when 2
      robots_info
    end
  end

  def land_robot
    @interface.land_robot_start_message
    @interface.facing_direction_message
    facing_direction = @interface.facing_direction_prompt
    @interface.robot_coordinate_message('X')
    x_position = @interface.get_user_choise
    @interface.robot_coordinate_message('Y')
    y_position = @interface.get_user_choise

    robot = Robot.new(facing_direction)

    @robots << robot
    @surface.land_robot(robot, x_position, y_position)
    robot.set_surface(@surface)

    @interface.enter_sequnece_of_commands_message
    commands = @interface.sequnece_of_commands_prompt
    execute_commands(robot, commands)
  end

  def robots_info
    @robots.each do |robot|
      @interface.display_robot_info(robot)
    end
  end

  def execute_commands(robot, commands)
    commands_array = normalize_commands(commands)
    commands_array.each do |command|
      robot.send_signal(command)
    end
  end

  def normalize_commands(commands)
    array_of_chars = commands.chars.map(&:upcase)
    result = []
    array_of_chars.each do |e|
      result << e if ['L', 'R', 'F'].include?(e)
    end

    result
  end
end
