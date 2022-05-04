require_relative "list"

class Item


    def self.valid_date?(date_string)
        date_arr = date_string.split("-")
        year = date_arr[0].to_i
        month = date_arr[1].to_i
        day = date_arr[2].to_i

        if (month < 1 || month > 12) || (day < 1 || day > 31) || year.digits.length < 4

            raise "Enter a valid date. Format should be 'yyyy-mm-dd'"
            return false
        end
    end

    attr_writer :title, :deadline, :description
    attr_reader :title, :deadline, :description

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description

        Item.valid_date?(@deadline)
    end
end