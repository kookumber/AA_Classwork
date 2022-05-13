require 'tdd_testing'

describe "#my_uniq" do 
    it "should take an array and return unique elements of that array" do
        expect(my_uniq([1,1,2,2,3,3])).to eq([1,2,3])
    end

    it "should not use the built in .uniq method" do
        expect([1,1,2,2,3,3]).to_not receive(:uniq)
    end

end

describe "Array" do
    describe "#two_sum" do
        context "when array is flat and contains numbers" do
            it "return a 2d array of pairs of element's indices that sum up to zero" do
                expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
                expect([-1, -1, 2, 3, 5].two_sum).to eq([])
            end
        end

        context "when array is empty" do
            it "should return self, an empty array" do
                expect([].two_sum).to eq([])
            end
        end
    end

    describe "#my_transpose" do 
        it "should transpose a 2D array" do
            expect([[1, 2, 3], [4, 5, 6], [7, 8, 9]].my_transpose).to eq([[1, 4, 7],[2, 5, 8],[3, 6, 9]])
        end
        
        it "should not use the array#transpose built method" do
            arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
            expect(arr).to_not receive(:transpose)
            arr.my_transpose
        end
    end
end

describe "#stock_picker" do 
    it "should take a 2D array of stock prices with their respective days and return the most profitable pair of days" do 
        expect(stock_picker([[1, 10], [2, 5], [3, 6], [4, 15], [5, 7]])).to eq([[2, 5], [4, 15]])
    end
end

