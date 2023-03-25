void main() {
  // ############################################################
  // 01_basic types
  // ############################################################
  String name = "nico";

  bool alive = true;
  int age = 12;
  double money = 69.99;

  num x = 12;
  x = 1.1;

  // ############################################################
  // 02_string interpolation
  // ############################################################

  var myName = "nico";
  var myAge = 35;
  var greeting =
      "Hello, my name is $myName, nice to meet you and I'm ${myAge + 2}";

  print(greeting);

  // in Pytrhon
  // List = List(Python)
  // Map = Dictionary(Python)
  // Set = Tuple(Pyton)

  // ############################################################
  // 03_list
  // ############################################################

  var giveMeFive = true;
  List<int> numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5, // collection if
  ];
  numbers.add(1);

  print("$numbers ${numbers.first}");

  var oldFriends = ["jin", "jamy"];
  var newFrieds = [
    "Kim",
    "Lee",
    "Han",
    for (var friend in oldFriends) "$friend", // collection for
  ];

  print(newFrieds);

  // ############################################################
  // 04_map
  // ############################################################

  // like: dictionary in python

  Map<String, Object> player = {
    'name': 'jaehyeok',
    'hp': 500,
    'mp': 200,
  };

  Map<String, List<int>> friendsNum = {
    'JIN': [1, 2, 3],
    'KIM': [4, 5, 6],
    'LEE': [7, 8, 9],
  };

  friendsNum.addAll({
    'COOL': [6, 7, 10, 11]
  });

  print(player);
  print(friendsNum);

  // ############################################################
  // 05_map
  // ############################################################

  // items are unique in set.
  Set<int> nums = {
    1,
    2,
    3,
    4,
  };

  nums.add(1);
  nums.add(1);
  nums.add(1);
  nums.add(1);

  print(nums);
}
