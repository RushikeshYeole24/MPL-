// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const HealthApp());
}

class HealthApp extends StatelessWidget {
  const HealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health App Dashboard'),
        backgroundColor: const Color.fromARGB(255, 99, 91, 209),
        leading: Image.asset(
          'health.png', // Replace 'health.png' with the actual path to your image asset
          width: 40,
          height: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildCard(
              context,
              title: 'BMI Calculator',
              icon: Icons.calculate,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMICalculatorPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            buildCard(
              context,
              title: 'Exercise Tracker',
              icon: Icons.directions_run,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExerciseTrackerPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            buildCard(
              context,
              title: 'Nutrition Tracker',
              icon: Icons.restaurant_menu,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NutritionTrackerPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            buildCard(
              context,
              title: 'Sleep Tracker',
              icon: Icons.hotel,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SleepTrackerPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            buildCard(
              context,
              title: 'Meditation',
              icon: Icons.self_improvement,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MeditationPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpForm()),
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'android.png', // Replace 'android.png' with the actual path to your Android image asset
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'ios.png', // Replace 'ios.png' with the actual path to your iOS image asset
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 32, color: Colors.blueAccent),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;

  void calculateBMI() {
    double height = double.parse(heightController.text) / 100; // Convert height to meters
    double weight = double.parse(weightController.text);
    setState(() {
      bmiResult = weight / (height * height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              'BMI: ${bmiResult.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}


class ExerciseTrackerPage extends StatefulWidget {
  @override
  _ExerciseTrackerPageState createState() => _ExerciseTrackerPageState();
}

class _ExerciseTrackerPageState extends State<ExerciseTrackerPage> {
  TextEditingController exerciseTypeController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  List<String> exerciseEntries = [];

  void _saveExercise() {
    String exerciseType = exerciseTypeController.text;
    int duration = int.tryParse(durationController.text) ?? 0;

    // Build the exercise entry string
    String entry = '$exerciseType - $duration minutes';

    // Add the entry to the list
    setState(() {
      exerciseEntries.add(entry);
    });

    // Clear the text fields after saving
    exerciseTypeController.clear();
    durationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: exerciseTypeController,
              decoration: InputDecoration(
                labelText: 'Exercise Type',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Duration (minutes)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveExercise,
              child: Text('Save Exercise'),
            ),
            SizedBox(height: 20),
            Text(
              'Exercise Entries:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: exerciseEntries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(exerciseEntries[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NutritionTrackerPage extends StatefulWidget {
  @override
  _NutritionTrackerPageState createState() => _NutritionTrackerPageState();
}

class _NutritionTrackerPageState extends State<NutritionTrackerPage> {
  TextEditingController mealTypeController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  List<String> nutritionEntries = [];

  void _saveNutrition() {
    String mealType = mealTypeController.text;
    int calories = int.tryParse(caloriesController.text) ?? 0;

    // Build the nutrition entry string
    String entry = '$mealType - $calories calories';

    // Add the entry to the list
    setState(() {
      nutritionEntries.add(entry);
    });

    // Clear the text fields after saving
    mealTypeController.clear();
    caloriesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: mealTypeController,
              decoration: InputDecoration(
                labelText: 'Meal Type',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: caloriesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Calories',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNutrition,
              child: Text('Save Nutrition'),
            ),
            SizedBox(height: 20),
            Text(
              'Nutrition Entries:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: nutritionEntries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(nutritionEntries[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SleepTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Tracker'),
      ),
      body: Center(
        child: Text(
          'This is the Sleep Tracker page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class MeditationPage extends StatefulWidget {
  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  int _durationInSeconds = 0;
  bool _isTimerRunning = false;

  void _startTimer(int duration) {
    setState(() {
      _isTimerRunning = true;
    });

    Future.delayed(Duration(seconds: duration), () {
      setState(() {
        _isTimerRunning = false;
      });
      _showTimerFinishedDialog();
    });
  }

  void _showTimerFinishedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Meditation Timer'),
        content: Text('Your meditation session has ended.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Meditation Timer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Set Duration (minutes)',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Slider(
              value: _durationInSeconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _durationInSeconds = value.toInt();
                });
              },
              min: 0,
              max: 60,
              divisions: 12,
              label: _durationInSeconds.toString(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _startTimer(_durationInSeconds * 60);
              },
              child: Text('Start Meditation'),
            ),
            SizedBox(height: 20),
            if (_isTimerRunning)
              CircularProgressIndicator()
            else
              Text(
                'Tap "Start Meditation" to begin your session.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Your sign-up form fields go here
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement sign-up logic here
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
