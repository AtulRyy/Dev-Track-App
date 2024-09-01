import 'package:flutter/material.dart';

void main() {
  runApp(const DevtrackApp());
}

class DevtrackApp extends StatelessWidget {
  const DevtrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devtrack-App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const ProjectRegistrationScreen(),
    );
  }
}

class ProjectRegistrationScreen extends StatefulWidget {
  const ProjectRegistrationScreen({super.key});

  @override
  _ProjectRegistrationScreenState createState() =>
      _ProjectRegistrationScreenState();
}

class _ProjectRegistrationScreenState extends State<ProjectRegistrationScreen> {
  final List<String> _topics = [
    'Web Development',
    'Mobile App Development',
    'Blockchain',
    'AI/ML',
    'Game Development',
    'UI/UX Designing'
  ];

  String? _selectedPreference1;
  String? _selectedPreference2;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Register for a Project Cycle',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Choose Preference 1:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedPreference1,
              dropdownColor: const Color.fromARGB(255, 55, 55, 55),
              items: _topics.map((String topic) {
                return DropdownMenuItem<String>(
                  value: topic,
                  child: Text(
                    topic,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPreference1 = newValue;
                });
              },
              hint: const Text(
                'Select your first preference',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose Preference 2:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedPreference2,
              dropdownColor: const Color.fromARGB(255, 62, 62, 62),
              items: _topics.map((String topic) {
                return DropdownMenuItem<String>(
                  value: topic,
                  child: Text(
                    topic,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPreference2 = newValue;
                });
              },
              hint: const Text(
                'Select your second preference',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'I agree to the Terms and Conditions: "I’m all in! I’ll give 100% effort, stay chill under pressure, and back up my teammates like the Wi-Fi when everyone’s streaming."',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              value: _agreeToTerms,
              onChanged: (bool? value) {
                setState(() {
                  _agreeToTerms = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff007721),
                      Color(0xff007700),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: _agreeToTerms &&
                          _selectedPreference1 != null &&
                          _selectedPreference2 != null
                      ? _registerForProject
                      : null,
                  child: const Text(
                    'Enroll Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerForProject() {
    if (_selectedPreference1 == _selectedPreference2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preference 1 and Preference 2 cannot be the same.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 46, 46, 46),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 48, 47, 47),
          title: const Text(
            'Registration Successful',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'You have registered with the following Domains:\n\n'
            'Preference 1: $_selectedPreference1\n'
            'Preference 2: $_selectedPreference2',
            style: const TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.green)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
