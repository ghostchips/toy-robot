require "pry"
require_relative "table.rb"
require_relative "robot.rb"

table = Table.new(5,5)
robot = Robot.new(table)

# print "Username: "
# username = gets.chomp

binding.pry
