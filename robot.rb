
# robot class that is used to set and move robot

class Robot

  # when creating the robot, pass in the current table that has been created exists
  def initialize(table)
    @table = table
  end

  def place(x, y, facing)
    # check to see if x, y coordinates are inside the existing table.
    if x > 0 || x <= @table.size.first ||
       y > 0 || y <= @table.size.last
      @x = x
      @y = y
      @facing = facing
    else
      # error message
      puts "The Toy Robot must be placed within the #{table.size} table."
    end

  end

  def facing
    @facing
  end

  def report
    [@x, @y, @facing]
  end

end
