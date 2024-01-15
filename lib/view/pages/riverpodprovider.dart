import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/controller/counterprovaider.dart';

class RiverpodProvider extends ConsumerWidget {
  const RiverpodProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(ref.watch(icons)),
        title: Text(ref.watch(greetingProvider)),
      ),
      body: Center(
        child: Text(
          ref.watch(counterProvider).toString(),
          style: TextStyle(fontSize: 60),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
