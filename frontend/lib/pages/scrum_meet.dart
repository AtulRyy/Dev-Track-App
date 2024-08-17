import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScrumMeetPage extends StatefulWidget {
  const ScrumMeetPage({Key? key}) : super(key: key);

  @override
  ScrumMeetPageState createState() => ScrumMeetPageState();
}

class ScrumMeetPageState extends State<ScrumMeetPage> {
  final TextEditingController _gMeetLinkController = TextEditingController();
  String _selectedMeetingType = 'Daily Meeting';
  String _selectedDomain = 'webdev';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final List<String> _meetingTypes = [
    'Daily Meeting',
    'Weekly Meeting',
    'Monthly Check',
  ];

  final List<String> _domains = [
    'webdev',
    'appdev',
    'ui-ux',
    'aiml',
    'web3',
    'gamedev',
  ];

  Future<void> _launchURL(String url) async {
    if (url.isNotEmpty && !url.startsWith('http')) {
      url = 'https://$url';
    }

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      if (!mounted) return;
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color.fromARGB(255, 11, 170, 96),
              onPrimary: Colors.white,
              surface: Color.fromARGB(255, 25, 25, 25),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.black,
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color.fromARGB(255, 11, 170, 96),
              onPrimary: Colors.white,
              surface: Color.fromARGB(255, 25, 25, 25),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.black,
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 80, // Adjust this height to push the title down
        flexibleSpace: const Center(
          child: Align(
            alignment: Alignment.bottomCenter, // Push the title down
            child: Text(
              'Project Cycle Scrum Meet',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 11, 170, 96),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  'Schedule Meeting',
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 170, 96),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Meeting Type',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.grey[900],
                value: _selectedMeetingType,
                icon: const Icon(Icons.arrow_downward, color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[800]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[850],
                ),
                style: const TextStyle(color: Colors.white, fontSize: 16),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedMeetingType = newValue!;
                  });
                },
                items:
                    _meetingTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose the Domain',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.grey[900],
                value: _selectedDomain,
                icon: const Icon(Icons.arrow_downward, color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[800]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[850],
                ),
                style: const TextStyle(color: Colors.white, fontSize: 16),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDomain = newValue!;
                  });
                },
                items: _domains.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Meeting Date',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "${_selectedDate.toLocal()}".split(' ')[0],
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 170, 96),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Select Date'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Meeting Time',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    _selectedTime.format(context),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 170, 96),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Select Time'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Google Meet Link',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _gMeetLinkController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[850],
                  labelText: 'Enter link here',
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[800]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 11, 170, 96),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 170, 96),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    final newLink = _gMeetLinkController.text.trim();
                    if (newLink.isNotEmpty) {
                      _launchURL(newLink);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid link'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Save and Join Meet',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
