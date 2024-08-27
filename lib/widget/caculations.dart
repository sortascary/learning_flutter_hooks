import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShapeCalculator {
  double calculateArea(String shape, double num1, {double num2 = 0}) {
    switch (shape) {
      case "Rectangle":
        return num1 * num2;
      case "Triangle":
        return (num1 * num2) / 2;
      case "Circle":
        return 3.14 * num1 * num1;
      default:
        return 0;
    }
  }
}

class Caculate extends HookWidget {
  final String name;
  final ShapeCalculator calculator;

  const Caculate({
    super.key,
    required this.name,
    required this.calculator,
  });

  @override
  Widget build(BuildContext context) {
    final num1Controller = useTextEditingController();
    final num2Controller = useTextEditingController();
    final result = useState(0.0);

    void performCalculation() {
      final num1 = double.tryParse(num1Controller.text) ?? 0;
      final num2 = double.tryParse(num2Controller.text) ?? 0;

      result.value = calculator.calculateArea(name, num1, num2: num2);
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
                    labelText: "Height",
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                performCalculation();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Result: ${result.value}')),
                );
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
