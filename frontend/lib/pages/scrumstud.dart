import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentMeetPage extends StatefulWidget {
  const StudentMeetPage({Key? key}) : super(key: key);

  @override
  StudentMeetPageState createState() => StudentMeetPageState();
}

class StudentMeetPageState extends State<StudentMeetPage> {
  final TextEditingController _gMeetLinkController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 80,
        flexibleSpace: const Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Join The Scrum Meet',
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
                  'Enter Meeting Link',
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
                    'Join Meet',
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
