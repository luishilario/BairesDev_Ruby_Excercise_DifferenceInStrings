class DifferenceInStrings

    def self.reverse? (first, second)
        first.reverse.eql? second
    end

    def calculate_steps_to_reverse
    end

    def self.distance_to(first:, second:)
        return [first.length, second.length].max if [first.length, second.length].min == 0

        return levenshtein(first: first, second: second) unless block_given?
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
        print_matrix matrix
        return matrix.last.last
    end

    def self.print_matrix matrix
        matrix.each do |x|
            puts x.to_s
        end
        30.times { print "-" }
        puts
    end
end

puts DifferenceInStrings.distance_to(first: "HYUNDAI",second: "HONDA") 
#{ |first, second| [first.length, second.length].max} #example of bloc code