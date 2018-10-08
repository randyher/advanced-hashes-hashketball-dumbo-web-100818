require "pry"

def game_hash
  game={

    :home =>{
      :team_name => "Brooklyn Nets",
      :colors =>["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
      },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
      },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
      },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
      },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
      }
    }
  },
    :away=>{
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
      },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
      },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
      },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
      },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
      }
    }
  }
}
end

def num_points_scored (player)
  player_hash={}
  game_hash.each do |location, team_data|
    player_hash=team_data[:players].find do |player_names, data|
       player_names==player
    end
    if player_hash!=nil 
      return player_hash[1][:points]
    end 
  end
end

def shoe_size (player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_names, data|
      if (player_names==player)
        return data[:shoe]
      end
    end
  end
end

def team_colors (team_name)
  game_hash.each do |location, team_data|
    if (team_name==team_data[:team_name])
      return team_data[:colors]
    end
  end
end

def team_names 
  output=[]
  output.push(game_hash[:home][:team_name])
  output.push(game_hash[:away][:team_name])
  output
end

def player_numbers (team_name)
  output=[]
  game_hash.each do |location, team_data|
    if (team_name==team_data[:team_name])
      team_data[:players].each do |player_names, data|
        output.push(data[:number])
      end
    end
  end
  output
end

def player_stats (player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_names, stats|
      if (player_names==player)
      return stats
      end
    end
  end
end

def big_shoe_rebounds

  biggest_shoe=0
  player_with_biggest_shoe=""
  game_hash.each do |location, team_data|
    team_data[:players].each do |names, stats|
      if (stats[:shoe]>biggest_shoe)
        biggest_shoe=stats[:shoe]
        player_with_biggest_shoe=names
      end
    end
  end 
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |names, stats|
      if (names==player_with_biggest_shoe)
        return stats[:rebounds]
      end
    end
  end
end

def add_to_slam 
  game_hash.each do |location, team_data|
    if location==:away
    team_data[:players].each do |names, stats|
        states[:slam_dunk]+=1
      end 
    end 
  end 
end 