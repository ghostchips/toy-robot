
# robot class that is used to set and move the robot

class Robot

  # when creating the robot, pass in the current table that has been created
  def initialize(table)
    @table = table
    @north = table.size.first
    @east = table.size.last
  end

  def place(x, y, facing)
    # check to see if x, y coordinates are inside the existing table before setting them.
    if x >= 0 || x <= @north ||
       y >= 0 || y <= @east
      @x = x
      @y = y
      @facing = facing
      return [@x, @y, @facing]
    else
      # error message
      puts "The Toy Robot must be placed within the #{table.size} table."
    end

  end

  def move
    if @facing == 'NORTH' && @x < @north
      @x = @x + 1
      return [@x, @y, @facing]
    end
    if @facing == 'SOUTH' && @x > 0
      @x = @x - 1
      return [@x, @y, @facing]
    end
    if @facing == 'EAST' && @y < @east
      @y = @y + 1
      return [@x, @y, @facing]
    end
    if @facing == 'WEST' && @y > 0
      @y = @y - 1
      return [@x, @y, @facing]
    end
    # if any of the above movements cause the robot to go off the board:
    return false
  end

  def turn
    compass = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    if @facing == 'NORTH'
      @facing = 'WEST'
    else
      # Change what direction robot is facing by moving left in the compass array based on current direction
    @facing = compass[compass.index(@facing) - 1]
    end
  end

  def right
    compass = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    if @facing == 'WEST'
      @facing = 'NORTH'
    else
      # Change what direction robot is facing by moving right in the compass array based on current direction
    @facing = compass[compass.index(@facing) + 1]
    end
  end

  def report
    return [@x, @y, @facing]
  end



end
