import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: Text('Welcome to Q Yaar',
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              )),
        ),
      ),
    );
  }
}
