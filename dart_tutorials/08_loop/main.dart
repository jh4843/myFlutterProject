void main() {
  // 01_while
  List<String> fruits = ['사과', '배', '포도', '귤', '딸기'];

  int i = 0;

  while (i < fruits.length) {
    print('나는 ${fruits[i]}를 좋아해');
    i++;
  }

  // 02_for

  for (int i = 0; i < fruits.length; i++) {
    print('나는 ${fruits[i]}를 좋아해');
  }

  // 03_forEatch with map
  Map<String, String> gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'third': 'necklace',
    'fourth': 'flower',
    'fifth': 'golden rings'
  };

  gifts.forEach((String key, String value) {
    print('$key, I like $value');
  });

  //
}
