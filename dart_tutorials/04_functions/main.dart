String sayHello(String name) {
  return "hello ~ $name nice to meet you";
}

// one line func
String otherHello(String name) => "hello ~ $name nice to meet you";

// 02_named parameter
String sayHelloinWithNamedParam({
  required String name,
  required int age,
  String country = "EveryWhere",
}) {
  return "Hello $name, you are $age, and you com from $country";
}

// 03_optional parameter
String sayHelloinWithOptionalParam(String name, int age,
    [String? country = "EveryWhere"]) {
  return "Hello $name, you are $age, and you com from $country";
}

// 04_QQ operator
String capitalizeName(String? name) =>
    //name != null ? name.toUpperCase() : "ANON";
    name?.toUpperCase() ?? "ANON"; // if left is null return right "ANON"

// 05_Typedef

typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;

  return reversed.toList();
}

void main() {
  // ############################################################
  // 01_basic
  // ############################################################

  print("==01_basic==============================================");

  print(sayHello("Denv"));
  print(otherHello("Kim"));

  // ############################################################
  // 02_named parameter
  // ############################################################

  print("==02_named parameter====================================");

  print(sayHelloinWithNamedParam(name: "Dev", age: 35, country: "Korea"));
  print(sayHelloinWithNamedParam(name: "JIN", age: 15));

  // ############################################################
  // 03_optional parameter
  // ############################################################
  print("==03_optional parameter=================================");
  print(sayHelloinWithOptionalParam("LEE", 30));

  // ############################################################
  // 04_QQ opperator ??
  // ############################################################
  print("==04_QQ opperator =====================================");
  print(capitalizeName("dev"));
  String? qName;
  qName ??= "dev"; // if null put dev
  print(qName);
  qName = null;
  qName ??= "Kim";
  print(qName);

  // ############################################################
  // 05_Typedef
  // ############################################################
  print("==05_Typedef =====================================");
  print(reverseListOfNumbers([1, 2, 3, 4, 5]));
}
