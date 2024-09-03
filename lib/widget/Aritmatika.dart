import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Arithmetic extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final number1Controller = useTextEditingController();
    final number2Controller = useTextEditingController();

    final result = useState<double?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Aritmatika'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka Pertama',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka Kedua',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(number1Controller.text);
                    final num2 = double.tryParse(number2Controller.text);
                    if (num1 != null && num2 != null) {
                      result.value = num1 + num2;
                    }
                  },
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(number1Controller.text);
                    final num2 = double.tryParse(number2Controller.text);
                    if (num1 != null && num2 != null) {
                      result.value = num1 - num2;
                    }
                  },
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(number1Controller.text);
                    final num2 = double.tryParse(number2Controller.text);
                    if (num1 != null && num2 != null) {
                      result.value = num1 * num2;
                    }
                  },
                  child: Text('x'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final num1 = double.tryParse(number1Controller.text);
                    final num2 = double.tryParse(number2Controller.text);
                    if (num1 != null && num2 != null && num2 != 0) {
                      result.value = num1 / num2; // <- Update state
                    }
                  },
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (result.value != null)
              Text(
                'Hasil: ${result.value}',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}