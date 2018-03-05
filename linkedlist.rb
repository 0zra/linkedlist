class LinkedList
  attr_accessor :head, :tail;

  def initialize(node)
    @head = node;
    @tail = node;
  end

  def append node
    @tail.next_node = node
    @tail = node
  end

  def prepend node
    node.next_node = @head
    @head = node
  end

  def size
    i = 1
    current = @head
    while current.next_node != nil
      i+=1
      current = current.next_node
    end
    return i
  end

  def at index
    if index >self.size
      puts 'this index is to damn high XD'
    else
      i = 0
      current = @head
      while i!=index
        current = current.next_node
        i+=1
      end
      return current
    end
  end

  def pop
    current = @head
    while current.next_node.next_node!=nil
        current = current.next_node
    end
    @tail = current
    @tail.next_node = nil
  end

  def contains? value
    current = @head
    while current != nil
      return true if current.value == value
      current = current.next_node
    end
    return false
  end

  def find(data)
    return nil if self.contains?(data) == false
    index  = 0
    current = @head
    while current.next_node != nil
      return index if current.value == data
      index+=1
      current = current.next_node
    end
    return index
  end

  def to_s
    printing = ""
    current = @head
    while current.next_node != nil
      printing+="(#{current.value}) - > "
      current = current.next_node
    end
    printing+="nil"
    puts printing
  end

  def insert_at(index,node)
    i = 0
    current = @head
    while i != index-1
        current = current.next_node
        i+=1
    end
    node.next_node = current.next_node
    current.next_node = node
  end

  def remove_at(index)
    i = 0
    current = @head
    while i != index-1
      current=current.next_node
      i+=1
    end
    current.next_node = current.next_node.next_node
  end
end

class Node
  attr_accessor :value, :next_node;

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end
