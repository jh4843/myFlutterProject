// abstract class
abstract class Human {
  void walk();
}

class Player extends Human {
  String name = 'denv';
  int age, mp = 10;
  final String team;

  Player(
      {required this.name, this.age = 10, this.mp = 100, this.team = "blue"});

  Player.createRedPlayer({required String name, required int age})
      : this.name = name,
        this.age = age,
        this.mp = 88,
        this.team = "red";

  Player.fromJson(Map<String, dynamic> mapPlayerJson)
      : name = mapPlayerJson["name"],
        age = mapPlayerJson["age"],
        mp = mapPlayerJson["mp"],
        team = mapPlayerJson["team"];

  void showMp() {
    print("My mp is ${mp}");
  }

  void walk() {
    print("${name} is walking");
  }
}

enum HeroType { Betman, Ironman, Superman }

// inheritance
class HeroPlayer extends Player {
  final HeroType type;

  HeroPlayer({required this.type, required String name}) : super(name: name);

  @override
  void showMp() {
    super.showMp();
    print("Super Hero's mp is ${mp}");
  }
}

void main() {
  // ############################################################
  // 01_basic
  // ############################################################
  var player = Player(
    name: "jiny",
    age: 50,
    mp: 1000,
    team: "blue",
  );

  print(player.name);

  var player2 = Player.createRedPlayer(
    name: "jiny",
    age: 50,
  );

  print(player2.name);
  player2.name = "Jiny";
  print(player2.name);
  //player.mp = 200; // error

  player2.showMp();

  // ############################################################
  // 02_json and API
  // ############################################################

  var apiData = [
    {
      "name": "Denv",
      "age": 10,
      "team": "red",
      "mp": 300,
    },
    {
      "name": "Joe",
      "age": 12,
      "team": "blue",
      "mp": 700,
    },
    {
      "name": "Kim",
      "age": 14,
      "team": "red",
      "mp": 1700,
    },
  ];

  apiData.forEach((mapPlayerJson) {
    var player = Player.fromJson(mapPlayerJson);
    player.showMp();
  });

  // ############################################################
  // 03_cascade notation
  // ############################################################

  // var devPlayer = Player(name: "denv", age: 22, mp: 1100, team: "blue");
  // devPlayer.name = "George";
  // devPlayer.mp = 100000;
  // devPlayer.age = 10;

  var devPlayer = Player(name: "denv", age: 22, mp: 1100, team: "blue")
    ..name = "George"
    ..mp = 100000
    ..age = 10;

  devPlayer.showMp();

  // ############################################################
  // 04_abstract class
  // ############################################################

  devPlayer.walk();

  // ############################################################
  // 05_inheritance class
  // ############################################################

  var myHero = HeroPlayer(type: HeroType.Betman, name: "Dain");
  myHero.walk();
  myHero.showMp();
}
