
require "byebug"
require "pry"
class Stack
  attr_reader :ivar
   def initialize
     @ivar = []
   end

   def push(el)
     ivar.push(el)
   end

   def pop
     ivar.pop(el)
   end

   def peek
     ivar[-1]
   end
 end

class Queue

  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar.push(el)

  end

  def dequeue
    ivar.shift
  end

  def peek
    ivar.first
  end

end

class My_map
  attr_reader :ivar

  def initialize
    @ivar = []
  end

  def set(key,value)
    if  my_has_key?(key) ==  false
      ivar << [key,value]
      p "added definition for:"
      p "#{key} => #{value}"
    else
      delete_key(key)
      ivar << [key,value]
    end
  end


  def delete_key(key)
    deleted = ivar.select { |pair| pair[0] != key }
    d_key, d_var = deleted[0], deleted[1]
    ivar.select! { |pair| pair[0] != key}
    p "modified entry for:"
    p "#{d_key} => #{d_var}"
  end

  def my_has_key?(key)
    ivar.any? {|pair| pair[0] == key}
  end

  def show(key = nil)
    if key.nil? ==  false
      p ivar.select { |pair| pair[0] == key}
    else
      p ivar
    end
  end


end
