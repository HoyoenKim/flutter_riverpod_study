import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    //final state = ref.watch(selectProvider);
    // isSpicy 가 변경되었을 때만 rebuild
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    // hasBought 가 변경되었을 때만 listen이 불림
    ref.listen(
      selectProvider.select((value) => value.hasBought),
      (previous, next) {
        print('next: $next');
      },
    );
    // 랜더링 최적화를 할 때 select 이용

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.toString(),
            ),
            //Text(
            //  state.name,
            //),
            //Text(
            //  state.isSpicy.toString(),
            //),
            //Text(
            //  state.hasBought.toString(),
            //),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: const Text(
                'Spicy Toggle',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBougth();
              },
              child: const Text(
                'Spicy Hasbought',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
