  class LRUCache
    attr_reader  :cache

    def initialize(size)
      @cache = Array.new(size)
      @size = size
    end

    def count
      cache.count
    end

    def add(el)
      if cache.count == @size
        if cache.include?(el)
          reprioritize(el)
        else
          remove_unused
          cache.push(el)
        end
      else
        cache.push(el)
      end
    end

    def show
      p cache
    end

    def count
      p cache.count
    end

    private

    def reprioritize(el)
      cache.delete_at(cache.index(el))
      cache.push(el)
    end

    def remove_unused
      cache.shift
      cache
    end
  end

  p new_cache = LRUCache.new(4)
  new_cache.add("a")
  new_cache.show
  new_cache.add( [:hello] )
  new_cache.add("john")
  new_cache.add "777"
  new_cache.add "654"
  new_cache.show
  new_cache.add "john"
  new_cache.add "john2"
  new_cache.show
  new_cache.count
