import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // 각각의 state 가 변경되었을 때 국소적으로만 rendnering 하려면 consumer widget 으로 잘라줘야 했다.
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(
      gStateMultiplyProvider(
        number1: 10,
        number2: 20,
      ),
    );

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'State1 : $state1',
          ),
          state2.when(
            data: (data) {
              return Text(
                'State2: $data',
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          state3.when(
            data: (data) {
              return Text(
                'State3: $data',
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Text(
            'State4 : $state4',
          ),
          Consumer(
            builder: (context, ref, child) {
              print('builder build');
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [
                  Text(
                    'State5 : $state5',
                  ),
                  if (child != null) child,
                ],
              );
            },
            child: const Text('won'), // builder build 가 되어도 다시 랜더링되지 않는다.
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: const Text(
                  'Increment',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: const Text(
                  'Decrement',
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // dispose, 초기 상태로 반환
              ref.invalidate(gStateNotifierProvider);
            },
            child: const Text(
              'Invalidate',
            ),
          ),
        ],
      ),
    );
  }
}
