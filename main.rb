require_relative './lib/interface';
require_relative './lib/mars_invasion';
require_relative './lib/surface';
require_relative './lib/sector';
require_relative './lib/robot';

planet_surface = Surface.new
interface = TerminalInterface.new

campaign = MarsInvasion.new(planet_surface, interface)
campaign.start

