String sayHello(String name) {
  return "hello ~ $name nice to meet you";
}

// one line func
String otherHello(String name) => "hello ~ $name nice to meet you";

void main() {
  print(sayHello("Denv"));
  print(otherHello("Kim"));
}
