enum Team { red, blue }

class Player {
  String name = 'denv';
  int age, mp = 10;
  Team team;

  Player(
      {required this.name,
      this.age = 10,
      this.mp = 100,
      this.team = Team.blue});

  Player.createRedPlayer({required String name, required int age})
      : this.name = name,
        this.age = age,
        this.mp = 88,
        this.team = Team.red;

  Player.fromJson(Map<String, dynamic> mapPlayerJson)
      : name = mapPlayerJson["name"],
        age = mapPlayerJson["age"],
        mp = mapPlayerJson["mp"],
        team = mapPlayerJson["team"];

  void showMp() {
    print("My mp is ${mp}");
  }

  void showTeam() {
    print("My team is ${team}");
  }
}

void main() {
  var player = Player(
    name: "jiny",
    age: 50,
    mp: 1000,
    team: Team.blue,
  );

  player.showTeam();
}
