import 'package:flutter_riverpod/flutter_riverpod.dart';

// future provider 에 로직을 넣을 때 사용
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return List.generate(5, (index) => index * data);
  //return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});
