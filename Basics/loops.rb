$i = 0
$num = 5

while $i < $num  do
   puts("Inside the loop i = #$i" )
   $i +=1
end

$i = 0
$num = 5
begin
   puts("Inside the loop i = #$i" )
   $i +=1
end while $i < $num

$i = 0
$num = 5

until $i > $num  do
   puts("Inside the loop i = #$i" )
   $i +=1;
end

for i in 0..5
  puts "Value of local variable is #{i}"
end

(0..5).each do |i|
  puts "Value of local variable is #{i}"
end

for i in 0..5
  if i > 2 then
     break
  end
  puts "Value of local variable is #{i}"
end

for i in 0..5
  if i < 2 then
     next
  end
  puts "Value of local variable is #{i}"
end

# for i in 0..5
#   if i < 2 then
#      puts "Value of local variable is #{i}"
#      redo
#   end
# end

# begin
#   do_something # exception raised
# rescue
#   # handles error
#   retry  # restart from beginning
# end

# for i in 0..5
#   retry if i > 2
# puts "Value of local variable is #{i}"
# end
