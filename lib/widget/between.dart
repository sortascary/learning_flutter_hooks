import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Between extends HookWidget {
  const Between({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                Navigator.pushNamed(context, '/BMI');
              },
              child: Text('BMI')
                        ),
            ),


            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/datar');
                }, 
              child: Text('Bangun datar')
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
