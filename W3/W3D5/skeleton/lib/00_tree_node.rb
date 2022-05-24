class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent = node
        return self if node == nil
        if node.parent != nil
            node.parent.children.delete(self)
        end
        node.children << self if !node.children.include?(self)
    end

    def add_child(child_node)
        if !self.children.include?(child_node)
            child_node.parent=(self)
        end
    end

    def remove_child(child_node)
        if self.children.include?(child_node)
            child_node.parent = nil
        else
            raise 'not a child'
        end
    end

    def dfs(target_val)
        return self if value == target_val
        return nil if self == nil
       
        self.children.each do |child|
            search_result = child.dfs(target_val)
            return search_result unless search_result.nil?
        end

        nil
    end

    def bfs(target_val)
        return self if value == target_val #good
        queue = [self] #good
        until queue.empty? #good
            ele = queue.shift
            ele.children.each do |child|
                return child if child.value == target_val
                queue << child
            end
        end
        
    end
    
end 