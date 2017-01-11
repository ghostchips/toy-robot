require "pry"
require_relative "table.rb"
require_relative "robot.rb"

# create 5x5 table and toy robot
table = Table.new(5,5)
robot = Robot.new(table)


def collect_and_execute_commands(robot)

  # get commands from user, store each in a commands array. Stop collecting user commands if user asks for 'REPORT' command.
  puts 'Input toy robot commands, each followed by a new line:'

  commands = []
  loop do
    command = gets.chomp
    commands.push(command)
    if command == 'REPORT'
      break
    end
  end

  # variable to check if this is the first time a command is given
  robot_placed = false

  # loop through each collected command, execute each based on the respective robot method.
  commands.each do |command|
    is_place_command = command.include? 'PLACE'

    # check to see if the robot has already been placed and the first command is the 'PLACE' command. If not, cancel the loop and start again.
     if !robot_placed && !is_place_command
       puts '- - - - - - - - - - - - - - - -'
       puts 'PLACE must be the first command'
       puts '- - - - - - - - - - - - - - - -'
       break

     elsif is_place_command
       # if the command is the place command, pull out the placement coordinates and facing direction for the robot.place method arguments.
       placement_coordinates = command.split(' ')[1].split(',')
       x = placement_coordinates[0].to_i
       y = placement_coordinates[1].to_i
       facing = placement_coordinates[2]
       if robot.place(x, y, facing)
         robot_placed = true
       end

      # for the rest of the commands, the respective robot method is called
     elsif command == 'MOVE'
       robot.move
     elsif command == 'LEFT'
       robot.left
     elsif command == 'RIGHT'
       robot.right
     elsif command == 'REPORT'
       puts ''
       puts robot.report.join(',')
       puts ''
     end
  end

  # Once the loop ends, or the loop is cancelled, the method is run again and user imput asked again

end

# run the user input method in a loop
loop do
  collect_and_execute_commands(robot)
end
