import 'package:flutter/material.dart';

class PPMScreen extends StatelessWidget {

  final int i;
  const PPMScreen(this.i,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('PPM Screen $i'),
      ),
    );
  }
}
