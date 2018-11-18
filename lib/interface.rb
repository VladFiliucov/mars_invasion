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
end
