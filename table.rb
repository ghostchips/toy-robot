
# Create a talble class that determines the size of the table where the robot can roam in.

class Table

# Because the directions ask the coordinates for 0, 0 to be South West, the maximum boundry of the board is set with the opposite corner, North, East.
  def initialize(north, east)
    @north = north
    @east = east
  end

  def size
    [@north, @east]
  end
end
