# Dart Coding Convention

[reference #1](https://dart.dev/effective-dart/style)
[reference #2](https://medium.com/flutter-community/flutter-best-practices-and-tips-7c2782c9ebb5)

## Naming convention

### UpperCamelCase

class, enum, typedefs, extensions name

```javascript
class MainScreen { ... }
enum MainItem { .. }
typedef Predicate<T> = bool Function(T value);
extension MyList<T> on List<T> { ... }
```

### lowerCamelCase

Variables, constants, parameters, named parameters

```javascript
var item;
const bookPrice = 3.14;
final urlScheme = RegExp('^([a-z]+):');
void sum(int bookPrice) {
  // ...
}
```

### sname_case(lowercase_with_underscores)

Libraries, packages, directories, source files

```javascript
library firebase_dynamic_links;
import 'socket/socket_manager.dart';
```

## Use (Do) / Avoid (Don't)

### Relative path

```dart
// Don't
import 'package:demo/src/utils/dialog_utils.dart';


// Do
import '../../../utils/dialog_utils.dart';
```

## Specify type

```dart
//Don't
var item = 10; // need to avoid var
final car = Car();
const timeOut = 2000;


//Do
int item = 10;
final Car bar = Car();
String name = 'john';
const int timeOut = 20;
```

## use 'is' instead of 'as'

if you use 'as', that throws an exception when you meet errors

```dart
//Don't
(item as Animal).name = 'Lion';


//Do
if (item is Animal)
  item.name = 'Lion';
```

## use '??' and '?.'

'??' is if null, '?.' is null aware

```dart
//Don't
v = a == null ? b : a;

//Do
v = a ?? b;


//Don't
v = a == null ? null : a.b;

//Do
v = a?.b;
```
