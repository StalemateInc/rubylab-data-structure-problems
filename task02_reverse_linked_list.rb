class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

class LinkedList
  attr_reader :head
  def initialize(path_string)
    values = path_string.split('->')
    values.each do |value|
      push(value)
    end
  end

  def push(value)
    if @head
      get_last.next = ListNode.new(value)
    else
      @head = ListNode.new(value)
    end
  end

  def get_last
    node = @head
    return node unless node.next
    while (node = node.next)
      return node unless node.next
    end
  end

  def path
    path = @head.val.to_s
    current = @head.next
    until current.nil?
      path << "->#{current.val}"
      current = current.next
    end
    path
  end

  def reverse_list(head = @head)
    current = head
    list = [current]
    list.push(current) while (current = current.next).val != 'NULL'
    list.reverse!
    list.each_with_index { |node, index| node.next = list[index + 1] }
    list.last.next = current
    @head = list.first
  end
end

path_string = '1->2->3->4->5->NULL'
list = LinkedList.new(path_string)
list.reverse_list
puts list.path