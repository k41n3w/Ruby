# Ruby program of Include and Extend

# Creating a module contains a method
module Geek
  def geeks
    puts "GeeksforGeeks!"
  end
end

class Lord
  # only can access geek methods
  # with the instance of the class.
  include Geek
end

class Star
  # only can access geek methods
  # with the class definition.
  extend Geek
end

# object access
Lord.new.geeks

# class access
Star.geeks

# NoMethodError: undefined  method
# `geeks' for Lord:Class
# Lord.geeks

###

# Ruby program to understand include and extend

# Creating a module contains a method
module Geek
  def prints(x)
    puts x
  end
end

class GFG
  # by using both include and extend
  # we can access them by both instances
  #  and class name.
  include Geek
  extend Geek
end

# access the prints() in Geek
# module by include in Lord class
GFG.new.prints("Howdy") # object access

# access the prints() in Geek
# module by extend it in Lord class
GFG.prints("GeeksforGeeks!!") # class access
