import 'package:flutter/material.dart';
import 'package:flutter_practice10/views/screens/root_page.dart';
import 'package:flutter_practice10/views/screens/stateful_instruction_page.dart';
import 'package:flutter_practice10/views/screens/riverpod_instruction_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'PageView Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => RootPage(),
          'stateful': (_) => StatefulInstructionPage(),
          'riverpod': (_) => RiverpodInstructionPage(),
        },
      ),
    );
  }
}
