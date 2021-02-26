class Tournament
    def self.calculate_tournament tournament_scores
        teams_scores = {}
        tournament_scores.each do |match|
            winning_team = ""
            winning_score = 0
            match.each do |team|
                if !winning_team.empty?
                    if team[:score] > winning_score
                        #Add winning team score
                        if teams_scores.key?(team[:name])
                            teams_scores[team[:name]] += 3
                        else
                            teams_scores[team[:name]] = 3
                        end
                        #Check if loosing team is in team list, if it doesn´t exist, set score to 0
                        if !teams_scores.key?(winning_team)
                            teams_scores[winning_team] = 0
                        end
                    elsif team[:score] == winning_score
                        #Add first team score to table
                        if teams_scores.key?(team[:name])
                            teams_scores[team[:name]] += 1
                        else
                            teams_scores[team[:name]] = 1
                        end
                        #add secnd team score to table
                        if teams_scores.key?(winning_team)
                            teams_scores[winning_team] += 1
                        else
                            teams_scores[winning_team] = 1
                        end
                    else
                        #Add winning team score
                        if teams_scores.key?(winning_team)
                            teams_scores[winning_team] += 3
                        else
                            teams_scores[winning_team] = 3
                        end
                        #Check if loosing team is in team list, if it doesn´t exist, set score to 0
                        if !teams_scores.key?(team[:name])
                            teams_scores[team[:name]] = 0
                        end
                    end
                else
                    #Set values to compare with next team
                    winning_score = team[:score]
                    winning_team = team[:name]
                end
            end
        end
        puts teams_scores.sort_by{ |k, v| v }.reverse.to_h 
    end
end

class Team
    attr_accesor :name, :score

    def initialize(**args)
        @name = args[:name]
        @score = 0
    end
end

class Match
    attr_reader :team1, :team2, :score1, :score2

    def initialize(**args)
        @team1 = args[:team1]
        @team2 = args[:team2]
        @score1 = args[:score1]
        @score2 = args[:score2]
    end

    def winner
        return team1 if score1 > score2
        return team2 if score2 > score1
    end
end

# Team A 3 x 1 Team B
# Team C 0 x 0 Team D
# Team A 1 x 1 Team C
# Team B 2 x 3 Team D
# Team A 2 X 1 Team D
# Team B 3 x 1 Team C

tournament_scores = [
    [{name: "A", score: 3}, {name: "B", score: 1}], 
    [{name: "C", score: 0}, {name: "D", score: 0}],
    [{name: "A", score: 1}, {name: "C", score: 1}],
    [{name: "B", score: 2}, {name: "D", score: 3}],
    [{name: "A", score: 2}, {name: "D", score: 1}],
    [{name: "B", score: 3}, {name: "C", score: 1}]
]
Tournament.calculate_tournament tournament_scores