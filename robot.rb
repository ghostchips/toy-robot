
# robot class that is used to set and move the robot.

class Robot

  # when creating the robot, pass in the current table that has been created.
  def initialize(table)
    # north defined by the northern most point in the created table
    @north = table.size.first
    @south = 0
    # east defined by the eastern most point in the created table
    @east = table.size.last
    @west = 0
  end

  def place(x, y, facing)
    # check to see if given x, y coordinates are inside the existing table before placing the robot.
    if x >= @south && x <= @north &&
       y >= @west && y <= @east
      @x = x
      @y = y
      @facing = facing
      return [@x, @y, @facing]
    else
      return false
    end

  end

  def move
    # Check which way the robot is facing to determine movement
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

  def left
    compass = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    # moving left on 'WEST' will face you 'NORTH'
    if @facing == 'NORTH'
      @facing = 'WEST'
    else
      # Change what direction robot is facing by moving left in the compass array based on current facing direction
    @facing = compass[compass.index(@facing) - 1]
    end
  end

  def right
    compass = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    # moving left on 'WEST' will face you 'NORTH'
    if @facing == 'WEST'
      @facing = 'NORTH'
    else
      # Change what direction robot is facing by moving right in the compass array based on current facing direction
    @facing = compass[compass.index(@facing) + 1]
    end
  end

  def report
    # display current location in array format
    return [@x, @y, @facing]
  end



end
