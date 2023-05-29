import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final counterStateNotifierProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Note: MyApp is a HookConsumerWidget, from hooks_riverpod.
class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterRead = ref.read(counterStateNotifierProvider.notifier);
    final counterState = ref.watch(counterStateNotifierProvider);

    final String value = "Value - $counterState";

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Column(
          children: [
            Center(
              child: Text(value),
            ),
            TextButton(
                onPressed: () {
                  counterRead.increment();
                },
                child: const Text("Increase"))
          ],
        ),
      ),
    );
  }
}
