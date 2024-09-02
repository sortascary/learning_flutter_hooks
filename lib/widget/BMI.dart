import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BMICalculatorService {
  double calculateBMI(double height, double weight) {
    if (height > 0 && weight > 0) {
      return weight / ((height / 100) * (height / 100));
    }
    return 0.0;
  }

  String getMessage(double bmi) {
    if (bmi < 18.5) {
      return 'Anda perlu makan lebih banyak, BMI Anda rendah.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Bagus! BMI Anda normal, pertahankan gaya hidup sehat.';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'BMI Anda sedikit berlebih, pertimbangkan diet sehat.';
    } else {
      return 'BMI Anda tinggi, mungkin perlu diet dan olahraga.';
    }
  }
}

class BMICalculator extends HookWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightController = useTextEditingController();
    final weightController = useTextEditingController();
    final bmi = useState(0.0);
    final message = useState('');
    final bmiService = BMICalculatorService();

    void calculateBMI() {
      final height = double.tryParse(heightController.text) ?? 0;
      final weight = double.tryParse(weightController.text) ?? 0;

      bmi.value = bmiService.calculateBMI(height, weight);
      message.value = bmi.value > 0 ? bmiService.getMessage(bmi.value) : 'Masukkan tinggi dan berat badan yang valid.';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kalkulator BMI',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tinggi Badan (cm)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.height),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Berat Badan (kg)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.fitness_center),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text('Hitung BMI'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
            const SizedBox(height: 24),
            if (bmi.value > 0)
              Card(
                color: Colors.tealAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'BMI Anda: ${bmi.value.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        message.value,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            if (bmi.value == 0)
              const Text(
                'Masukkan tinggi dan berat badan yang benar untuk menghitung BMI.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
