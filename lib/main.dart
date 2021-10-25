import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';

final counterProvider = StateNotifierProvider((_) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
  void decrement() => state--;
}

void main() {
  runApp(
    ProviderScope(
      child: CounterApp(),
    ),
  );
}

// Note: CounterApp is a HookWidget, from flutter_hooks.
class CounterApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CounterApp')),
        body: Center(
          child: Text(counter.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() => handlePress(context),
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

void handlePress(BuildContext context){
  context.read(counterProvider.notifier).decrement();
}
