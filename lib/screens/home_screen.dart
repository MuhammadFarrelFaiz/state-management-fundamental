import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/counter_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Anda telah menekan tombol ini sebanyak:'),
            const SizedBox(height: 10),
            Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(counterProvider.notifier).decrement();
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Kurangi'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(counterProvider.notifier).reset();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        tooltip: 'Tambah',
        child: const Icon(Icons.add),
      ),
    );
  }
}
