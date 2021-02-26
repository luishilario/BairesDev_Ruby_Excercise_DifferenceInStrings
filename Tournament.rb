class Tournament
    attr_reader :teams, :matches
    
    def initialize(**args)
        @teams = args[:teams]
        @matches = args[:matches]
        calculate_tournament
    end

    def print_table
        teams.sort_by{|team| team.score * -1}.each do |team|
            puts "#{team.name}: #{team.score}"
        end
        
    end

    private
    def calculate_tournament
        matches.each do |match|
            add_points match
        end
    end

    def add_points match
        if match.winner.nil?
            match.team1.add_score 1
            match.team2.add_score 1
        else
            match.winner.add_score 3
        end
    end
end

class Team
    attr_accessor :name, :score

    def initialize(**args)
        @name = args[:name]
        @score = 0
    end

    def add_score value
        @score += value
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

teamA = Team.new(name: "A")
teamB = Team.new(name: "B")
teamC = Team.new(name: "C")
teamD = Team.new(name: "D")

matches = [
        {team1: teamA, team2: teamB, score1: 3, score2: 1},
        {team1: teamC, team2: teamD, score1: 0, score2: 0},
        {team1: teamA, team2: teamC, score1: 1, score2: 1},
        {team1: teamB, team2: teamD, score1: 2, score2: 3},
        {team1: teamA, team2: teamD, score1: 2, score2: 1},
        {team1: teamB, team2: teamC, score1: 3, score2: 1}
    ].map do |params|
        Match.new params
    end

tournament = Tournament.new(teams: [teamA, teamB, teamC, teamD], matches: matches)
tournament.print_table