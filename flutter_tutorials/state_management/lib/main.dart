import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 01_Counter
  //int counter = 0;

  // 02_show List
  List<int> numbers = [];

  bool showTitle = true;

  void toggleShowTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClick() {
    // notify "data is new !!" do refresh !!
    // calling build method again
    setState(() {
      numbers.add(numbers.length);
      print(numbers);
      //counter = counter + 1;
    });
  }

  void onClear() {
    setState(() {
      numbers.clear();
      print(numbers);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.red),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text("nothing"),
              for (var n in numbers) Text('$n'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    onPressed: onClick,
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: onClear,
                    icon: const Icon(Icons.clear),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: toggleShowTitle,
                    icon: Icon(showTitle ? Icons.toggle_on : Icons.toggle_off),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // Life cycle
  @override
  void initState() {
    super.initState();
    print("initState!");
  }

  @override
  void dispose() {
    // destroy
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("Build!");
    return Text(
      //"click count",
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
