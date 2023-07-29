import 'package:flutter_riverpod/flutter_riverpod.dart';

// caching, process once, future restart funciton not exist
final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(
    const Duration(
      seconds: 2,
    ),
  );

  //sthrow Exception('Error!');

  return [1, 2, 3, 4, 5];
});
