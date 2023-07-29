import 'package:flutter_riverpod/flutter_riverpod.dart';

// future provider의 cached 를 자동으로 삭제해줌
// autoDispose를 사용하지 않게되면 삭제하고 사용하게 되면 다시 로딩한다.
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
