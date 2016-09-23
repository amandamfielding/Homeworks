class LRUCache
  def initialize
    @cache = []
    @size = 4
  end

  def count
    @cache.length
  end

  def add(el)
    @cache.delete(el) if @cache.include?(el)
    @cache << (el)
    delete
  end

  def show
    p @cache
  end

  private

  def delete
    until @cache.length <= @size
      @cache.shift
    end
  end

end
