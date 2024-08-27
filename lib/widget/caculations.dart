import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Caculate extends HookWidget {
  final String name;

  const Caculate({super.key, required this.name});

  double mathin(String name, double num1, {double num2 = 0}) {
    double result = 0;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final num1Controller = useTextEditingController();
    final num2Controller = useTextEditingController();
    final result = useState(0.0);

    void mathing() {
      final num1 = double.tryParse(num1Controller.text) ?? 0;
      final num2 = double.tryParse(num2Controller.text) ?? 0;

      if (name == "Rectangle") {
        result.value = num1 * num2;
      } else if (name == "Triangle") {
        result.value = (num1 * num2) / 2;
      } else if (name == "Circle") {
        result.value = 3.14 * num1 * num1;
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: TextField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Color.fromARGB(255, 119, 119, 119), fontSize: 14),
                decoration: InputDecoration(
                    labelText: name == "Circle" ? "Radius" : "Width",
                    border: OutlineInputBorder()),
              ),
            ),
            if (name != "Circle")
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextField(
                  controller: num2Controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 119, 119, 119), fontSize: 14),
                  decoration: InputDecoration(
                    labelText: "Height", // Conditional label
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                mathing(); 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Result: ${result.value}')),
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
