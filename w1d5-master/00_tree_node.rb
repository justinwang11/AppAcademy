class PolyTreeNode

  attr_accessor :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def value
    @value
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def parent=(other_node)
    #return if other_node == parent
    #only if new parent is being assigned
    parent.children.delete(self) unless parent.nil?
    @parent = other_node
    other_node.children << self unless other_node.nil? || other_node.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child)
    raise Exception if !children.include?(child)
    child.parent = nil
  end

  def dfs(target_value)
    if self.value == target_value
      return self
    else
      self.children.each do |child|
        result = child.dfs(target_value)
        return result if result
      end
    end
    nil
  end

  def bfs(target_value)
    queue = []
    queue << self
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue.concat(current_node.children)
    end
    nil
  end

  def trace_back_path
    path = []
    path.unshift(self)
    until path[0].parent.nil?
      path.unshift(path[0].parent)
    end
    path
  end

end
