class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  def leaf?
    @right.nil? && @left.nil?
  end
end

class BinarySearchTree
  attr_reader :root

  def initialize(initial)
    if initial.instance_of? Array
      @root = TreeNode.new(initial.shift)
      initial.each(&method(:insert))
    else
      @root = TreeNode.new(initial)
    end

  end

  def insert(value, node = @root)
    if value < node.val
      node.left ? insert(value, node.left) : node.left = TreeNode.new(value)
    elsif value > node.val
      node.right ? insert(value, node.right) : node.right = TreeNode.new(value)
    end
  end

  def binary_tree_paths(root = @root)
    paths = []
    get_path(root, '', paths)
    paths
  end

  private
  def get_path(node, path, paths)
    return if node.nil?

    path += '->' unless path.empty?
    path += node.val.to_s
    if node.leaf?
      paths.push(path)
    else
      get_path(node.left, path, paths)
      get_path(node.right, path, paths)
    end
  end

end

numbers = Array.new(10) { rand(0..99) }
puts "The numbers are #{numbers}"
tree = BinarySearchTree.new(numbers)
puts "Paths to leafs: #{tree.binary_tree_paths}"
