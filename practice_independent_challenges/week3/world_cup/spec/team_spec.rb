require './lib/team'
require './lib/player'

RSpec.describe Team do
  it 'exists and have attributes' do
    team = Team.new("France")  

    expect(team).to be_an_instance_of(Team)
    expect(team.country).to eq("France")
  end

  it "return false if a team is not eliminated" do
    team = Team.new("France")  

    expect(team.eliminated?).to eq(false)
  end

  it "return true if a team is eliminated" do
    team = Team.new("France")  

    team.eliminated = true
    expect(team.eliminated?).to eq(true)
  end

  it "have no player to start with" do
    team = Team.new("France")  

    expect(team.players).to eq([])
  end

  it "can add players" do 
    team = Team.new("France")  

    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    team.add_player(mbappe)
    team.add_player(pogba)

    expect(team.players)
  end

  it "can find player by position" do
    team = Team.new("France")  

    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    team.add_player(mbappe)
    team.add_player(pogba)

    expect(team.players_by_position("midfielder")).to eq([pogba])
    expect(team.players_by_position("defender")).to eq([])
  end

end