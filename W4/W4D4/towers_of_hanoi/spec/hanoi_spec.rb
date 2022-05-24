require 'hanoi'
require 'rspec'
require 'byebug'

describe "Hanoi" do
    subject(:game) { Hanoi.new }
    
    describe "Hanoi#won?" do
    # debugger
        it "should return true when the game is over" do
            game.board = [[],[],[5,4,3,2,1]]
            expect(game.won?).to eq(true)
        end

        it "should return false when the game is over" do
            game.board = [[5],[],[4,3,2,1]]
            expect(game.won?).to eq(false)
        end
    end

    describe "Hanoi#move" do
        it "should take an initial array and a final array index as arguments" do
            game.move(0, 2)
        end
        
        it "should take the last element of the initial array and place it as the last element of the final array" do
            expect(game.move(0, 2)).to eq([[5,4,3,2],[],[1]])
        end

        it "should raise an error if the initial array is empty" do
            expect { game.move(1, 2) }.to raise_error("stack is empty")
        end

        it "should raise an error if the last element of the end array is smaller than the element you want to move" do
            game.board = [[5,4,3],[1],[2]]
            expect{ game.move(0,2) }.to raise_error("invalid move")
        end
    end
end