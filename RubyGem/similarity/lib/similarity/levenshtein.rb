module Similarity
    def distance_to(second)
        return [self.length, second.length].max if [self.length, second.length].min == 0

        return levenshtein(first: self, second: second) unless block_given?
        yield self,second
    end

    def levenshtein(first:, second:)
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
        return matrix.last.last
    end
end