require_relative  "tree_node.rb"
require "byebug"
class KnightPathFinder

    attr_reader :root_node, :considered_positions
    attr_writer :root_node
    attr_accessor :root_node

    def initialize(start_pos) # [1,1]
        self.root_node = PolyTreeNode.new(start_pos)
        @considered_positions = []
        @start_pos = start_pos
    end

    def [](pos)
        row, col = pos
    end

    # def []=(pos, val)
    #     row, col = 
    # end

    def self.valid_moves(start_pos)
        row, col = start_pos
        all_positions = [
            [row + 2, col + 1], 
            [row - 2, col + 1], 
            [row + 2, col - 1], 
            [row - 2, col - 1], 
            [row + 1, col + 2], 
            [row - 1, col + 2],
            [row - 1, col - 2], 
            [row + 1, col - 2], 
            ]

        all_positions.select do |ele|
            ele[0] >= 0 && ele[0] < 78 && ele[1] >= 0 && ele[1] < 8
        end
    end

    def new_move_positions(pos) #[2,1]
        valid = KnightPathFinder.valid_moves(pos) #[0,0]

        selected_pos = valid.select { |ele| !@considered_positions.include?(ele) }
        arr = []
        selected_pos.each do |ele|
            @considered_positions << ele
            arr << ele
        end
        arr #returns valid moves that haven't been considered

    end

    def build_move_tree
        #call new_move_positions to get an array of moves we haven't made
        #start queue with root node
        queue = [self.root_node]
       
        until queue.empty?
            ele = queue.shift
            positions = new_move_positions(ele.value)
            positions.each do |pos|
                node = PolyTreeNode.new(pos)
                ele.add_child(node)
                queue << node
            end
        end
        self.root_node
    end

    def find_path(end_pos)
        # debugger
        # self.root_node.bfs(end_pos)
        node = self.build_move_tree
        node.dfs(end_pos)
    end

    def trace_path_back

    end
    
    
end
