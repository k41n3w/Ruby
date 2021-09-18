# Executa na hora de passar heranca

# class Parent
#   def self.inherited(subclass)
#     super
#     puts "#{subclass} inherits from Parent"
#   end
# end

# class Child < Parent
# end

####

# Define os metodos na hora de passar a heranca
class Parent
  def self.inherited(subclass)
    super
    subclass.define_method :parent_name do
      "Daddy"
    end
  end
end

class Child < Parent
end

puts Child.new.parent_name # => "Daddy"
