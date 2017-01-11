require "pry"
require_relative "table.rb"
require_relative "robot.rb"

table = Table.new(5,5)
robot = Robot.new(table)

print 'Input toy robot commands:'


binding.pry
