require "pry"
require "byebug"
#biggest fish (found in O(n^2) time)

def bubble_sort(arr)
  sorted = false
  until sorted
    sorted = true
    arr.each_index do |idx|
      next if idx == arr.length-1
      if arr[idx+1].length < arr[idx].length
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
        sorted = false
      end
    end
  end
p arr[-1]
end

fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiiss&&&shhhhhh']
bubble_sort(fish_array)

"The biggest fish? Meet #{bubble_sort(fish_array)}"
# sluggish_octopus

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])

  merge(left, right)

end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left[0].length > right[0].length
      merged << left.shift
    elsif left[0].length == right[0].length
      merged << left.shift
    else
      merged << right.shift
    end
  end
    merged + left + right
end

  def report_sluggish(fish_array)
    merge_sort(fish_array).first
  end

p "SLUGGISH FISH, YOU SAY!? MEET #{report_sluggish(fish_array)} (again)."


#Clever Octopus
def clever_octopus(arr)
  longest = ""
  arr.each { |fish| fish.length > longest.length ? longest = fish : next }
  longest
end

p "Now, meet the clever octopus's newest 'catch'- #{clever_octopus(fish_array)}"


class Dancing_octopus

  TILES_HASH = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down"=> 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
    }


  def dance_dance_revolution (tiles_array)
    print "Step on"
    tiles_array.each do |tile|
      tile
      p " tile: #{TILES_HASH[tile]}"
    end
  end

end
#
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ]

p "Now we're dancing...in O(n) time!"
p "Follow my lead, dancing squid...oh, you're an Octopus? DANCE FASTER!"
p "."
p "."
p "."
p "You're not too good at this, are you? Okay, step where I tell you:"


Dancing_octopus.new.dance_dance_revolution(tiles_array)

# 
