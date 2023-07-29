import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/riverpod/provider_observer.dart';
import 'package:flutter_riverpod_study/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(), //logging, monitoring 가능
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
