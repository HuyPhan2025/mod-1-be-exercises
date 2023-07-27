class WorldCup
  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
   @teams.flat_map do |team|
      team.players.select do |player|
         player.position == position unless team.eliminated
      end
    end
  end

  def all_players_by_position

    # forward = active_players_by_position("forward")

    # midfielder = active_players_by_position("midfielder")

    # defender = active_players_by_position("defender")

    # {
    #   "forward" => forward,
    #   "midfielder" => midfielder,
    #   "defender" => defender
    # }

    positions = ["forward", "midfielder", "defender"]

    positions.reduce({}) do |accumulator, position|
      accumulator[position] = active_players_by_position(position)
      accumulator
    end
  end
end