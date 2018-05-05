hero_list = ["Tracer","Reaper","Doomfist","McCree"
            "Soldier 76","Sombra","Pharah","Genji",
            "Junkrat","Hanzo","Widowmaker","Torbjorn",
            "Mei","Bastion","Winston","D.Va","Reinhardt","Zarya","Orisa","Roadhog"
            "Mercy","Ana","Symmetra","Lucio","Zenyatta","Brigitte","Moira"]

hero_list.each do |name|
  hero = Hero.new
  hero.name = name
  hero.save
end

team_list = ["New York Excelsior","Los Angeles Valiant","Seoul Dynasty","London Spitfire","Shanghai Dragons","Houston Outlaws"
            "Florida Mayhem","Boston Uprising","Dallas Fuel","Los Angeles Gladiators","Philadelphia Fusion",
          "San Francisco Shock"]

team_list.each do |name|
  team = Team.new
  team.name = name
  team.save
end

player_list = {"STRIKER"=>"Boston Uprising","Snow"=>"Boston Uprising","NotE"=>"Boston Uprising",
  "Neko"=>"Boston Uprising","Mistakes"=>"Boston Uprising","Kellex"=>"Boston Uprising","Kalios"=>"Boston Uprising",
  "Gamsu"=>"Boston Uprising","Avast"=>"Boston Uprising","AimGod"=>"Boston Uprising","Unkoe"=>"Dallas Fuel",
  "Taimou"=>"Dallas Fuel","Seagull"=>"Dallas Fuel","OGE"=>"Dallas Fuel","Mickie"=>"Dallas Fuel","HarryHook"=>"Dallas Fuel",
  "EFFECT"=>"Dallas Fuel","cocco"=>"Dallas Fuel","Chipshajen"=>"Dallas Fuel","aKm"=>"Dallas Fuel","Zuppeh"=>"Florida Mayhem",
  "Zebbosai"=>"Florida Mayhem","zappis"=>"Florida Mayhem","TviQ"=>"Florida Mayhem","Sayaplayer"=>"Florida Mayhem","Manneten"=>"Florida Mayhem",
  "Logix"=>"Florida Mayhem","CWoosH"=>"Florida Mayhem","aWesomeGuy"=>"Florida Mayhem","SPREE"=>"Houston Outlaws","Rawkus"=>"Houston Outlaws",
  "Muma"=>"Houston Outlaws","Mendokusaii"=>"Houston Outlaws","LiNkzr"=>"Houston Outlaws","Jake"=>"Houston Outlaws","FCTFCTN"=>"Houston Outlaws",
  "Coolmatt"=>"Houston Outlaws","Clockwork"=>"Houston Outlaws","Boink"=>"Houston Outlaws","Bani"=>"Houston Outlaws","Arhan"=>"Houston Outlaws",
  "WooHyaL"=>"London Spitfire","TiZi"=>"London Spitfire","Profit"=>"London Spitfire","NUS"=>"London Spitfire","Hooreg"=>"London Spitfire",
  "HaGoPeun"=>"London Spitfire","Gesture"=>"London Spitfire","Fury"=>"London Spitfire","Closer"=>"London Spitfire","birdring"=>"London Spitfire",
  "Bdosin"=>"London Spitfire","Void"=>"Los Angeles Gladiators","Surefour"=>"Los Angeles Gladiators","silkthread"=>"Los Angeles Gladiators",
  "Shaz"=>"Los Angeles Gladiators","iRemiix"=>"Los Angeles Gladiators","Hydration"=>"Los Angeles Gladiators","Fissure"=>"Los Angeles Gladiators",
  "Bischu"=>"Los Angeles Gladiators","BigGoose"=>"Los Angeles Gladiators","Asher"=>"Los Angeles Gladiators","Verbo"=>"Los Angeles Valiant",
  "Space"=>"Los Angeles Valiant","Soon"=>"Los Angeles Valiant","Numlocked"=>"Los Angeles Valiant","KSF"=>"Los Angeles Valiant","Kariv"=>"Los Angeles Valiant",
  "Izayaki"=>"Los Angeles Valiant","Finnsi"=>"Los Angeles Valiant","Fate"=>"Los Angeles Valiant","Custa"=>"Los Angeles Valiant","Bunny"=>"Los Angeles Valiant",
  "Agilities"=>"Los Angeles Valiant","Saebyeolbe"=>"New York Excelsior","Pine"=>"New York Excelsior","Meko"=>"New York Excelsior","Mano"=>"New York Excelsior",
  "Libero"=>"New York Excelsior","Jjonak"=>"New York Excelsior","Janus"=>"New York Excelsior","Ark"=>"New York Excelsior","Anamo"=>"New York Excelsior",
  "Snillo"=>"Philadelphia Fusion","ShaDowBurn"=>"Philadelphia Fusion","SADO"=>"Philadelphia Fusion","Poko"=>"Philadelphia Fusion","Neptuno"=>"Philadelphia Fusion",
  "Joemeister"=>"Philadelphia Fusion","Hotba"=>"Philadelphia Fusion","fragi"=>"Philadelphia Fusion","Eqo"=>"Philadelphia Fusion","DayFly"=>"Philadelphia Fusion",
  "Carpe"=>"Philadelphia Fusion","Boombox"=>"Philadelphia Fusion","super"=>"San Francisco Shock","sleepy"=>"San Francisco Shock","sinatraa"=>"San Francisco Shock",
  "Nomy"=>"San Francisco Shock","Nevix"=>"San Francisco Shock","Moth"=>"San Francisco Shock","iddqd"=>"San Francisco Shock","dhaK"=>"San Francisco Shock",
  "Danteh"=>"San Francisco Shock","BABYBAY"=>"San Francisco Shock","Architect"=>"San Francisco Shock","ZUNBA"=>"Seoul Dynasty","XepheR"=>"Seoul Dynasty",
  "Wekeed"=>"Seoul Dynasty","tobi"=>"Seoul Dynasty","ryujehong"=>"Seoul Dynasty","Munchkin"=>"Seoul Dynasty","Miro"=>"Seoul Dynasty","KuKi"=>"Seoul Dynasty",
  "gido"=>"Seoul Dynasty","Gambler"=>"Seoul Dynasty","FLETA"=>"Seoul Dynasty","Xushu"=>"Shanghai Dragons","Sky"=>"Shanghai Dragons","Roshan"=>"Shanghai Dragons",
  "MG"=>"Shanghai Dragons","Geguri"=>"Shanghai Dragons","Freefeel"=>"Shanghai Dragons","Fiveking"=>"Shanghai Dragons","Fearless"=>"Shanghai Dragons",
  "Diya"=>"Shanghai Dragons","Daemin"=>"Shanghai Dragons","Altering"=>"Shanghai Dragons","Ado"=>"Shanghai Dragons"}

player_list.each do |player,team|
  play = Player.new
  t = Team.find_by(name: team)
  play.name = player
  play.team = t
  play.save
end

jjonak = Player.find_by(name: "Jjonak")
jjonak.hero << Hero.find_by(name: "Zenyatta")
