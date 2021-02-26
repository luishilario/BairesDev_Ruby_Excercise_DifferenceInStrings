class DifferenceInStrings

    def self.reverse? (first, second)
        first.reverse.eql? second
    end

    def calculate_steps_to_reverse
    end

    def self.distance_to(first:, second:)
        return 0 if first.downcase!.eql? second.downcase!
        return first.length if second.empty?
        return second.length if first.empty?
        return self.levenshtein(first: first, second: second) unless block_given?
        puts "Continues to yield"
        yield first,second
    end

    def self.levenshtein(first:, second:)

        matrix = [(0..first.length).to_a]

        (1..second.length).each do |j|
            matrix << [j] + [0] * (first.length)
        end
        (1..second.length).each do |i|
            (1..first.length).each do |j|
                if first[j-1] == second[i-1]
                    matrix[i][j] = matrix[i-1][j-1]
                else
                    matrix[i][j] = [
                        matrix[i-1][j],
                        matrix[i][j-1],
                        matrix[i-1][j-1],
                    ].min + 1
                end
            end
        end
        matrix.each do |x|
            puts x.to_s
        end
        puts "..............................."
        return matrix.last.last
    end
end

# puts DifferenceInStrings.distance_to(first: "HYUNDAI",second: "HONDA") { |first, second| [first.length, second.length].max}
puts DifferenceInStrings.distance_to(first: "HYUNDAI",second: "HONDA")  do |first, second|
    [first.length, second.length].max
end 