class TerminalInterface
  def show_wellcome
    puts "WELLCOME TO MARS INVASION PROGRAMM"
  end

  def request_upper_right_x
    puts "Please enter upper right X coordinate. It should be less then 50 unless you changed the default (And greater then 0)"

    gets.to_i
  end

  def request_upper_right_y
    puts "Please enter upper right Y coordinate. It should be less then 50 unless you changed the default (And greater then 0)"

    gets.to_i
  end

  def successfully_generated_surface
    puts "You successfully generated surface of the planet. Now it is divided by sectors"
  end

  def display_user_menu
    puts "============="
    puts "> 0 For exit "
    puts "> 1 To add another robot"
    puts "> 2 To show robots info"
    puts "============="
  end

  def get_user_choise
    gets.to_i
  end

  def land_robot_start_message
    puts "================================="
    puts "Now we are going to land a robot"
    puts "================================="
  end

  def facing_direction_message
    puts "================================="
    puts "Please enter which direction is robot facing. Available options (N, E, S, W) "
    puts "================================="
  end

  def facing_direction_prompt
    gets.chomp.to_s
  end

  def sequnece_of_commands_prompt
    gets.chomp.to_s
  end

  def robot_coordinate_message(axios)
    puts "================================="
    puts "Please enter robot position on #{axios.upcase} axios"
    puts "================================="
  end

  def display_robot_info(robot)
    if robot.status == 'LOST'
      puts "================================="
      puts "Robot Lost"
      puts "================================="
    else
      puts "================================="
      puts "Robot is facing #{robot.current_facing_direction}"
      puts "================================="
    end
  end

  def enter_sequnece_of_commands_message
    puts "================================="
    puts "Enter sequence of commands in one line. Available options:"
    puts "L - for turning robot Left"
    puts "R - for turning robot Right"
    puts "F - for moving robot one step forward"
    puts "================================="
    puts "Press Return when you are done"
    puts "================================="
  end
end
