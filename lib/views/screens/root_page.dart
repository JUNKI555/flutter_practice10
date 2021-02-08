import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: const Text('StatefulWidget Instruction Page'),
              onPressed: () {
                Navigator.of(context).pushNamed('stateful');
              },
            ),
            RaisedButton(
              child: const Text('Riverpod Instruction Page'),
              onPressed: () {
                Navigator.of(context).pushNamed('riverpod');
              },
            ),
          ],
        ),
      ),
    );
  }
}
