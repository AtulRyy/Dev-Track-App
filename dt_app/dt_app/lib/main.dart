// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProgressTrackerPage(),
  ));
}

class ProgressTrackerPage extends StatefulWidget {
  const ProgressTrackerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProgressTrackerPageState createState() => _ProgressTrackerPageState();
}

class _ProgressTrackerPageState extends State<ProgressTrackerPage> {
  List<bool> isExpandedList = [false, false, false]; // Control expansion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracker'),
        backgroundColor: Colors.grey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section with circular tracker and tracked items
            Row(
              children: [
                // Left section - Circular Tracker
                Expanded(
                  flex: 1,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 100,
                    child: const Center(
                      child: CircularProgressIndicator(
                        value: 0.7, // Progress value, adjust as needed
                        strokeWidth: 8,
                      ),
                    ),
                  ),
                ),
                // Right section - Tracked Items
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Days Left: 10',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tasks Completed: 5/10',
                        style: TextStyle(fontSize: 16),
                      ),
                      // Add more tracked items as needed
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Project Title and Domain
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Project Title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Project Domain',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Sections for members
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Number of sections for members
                itemBuilder: (context, index) {
                  return ExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: EdgeInsets.all(0),
                    expansionCallback: (int itemIndex, bool isExpanded) {
                      setState(() {
                        isExpandedList[index] = !isExpanded;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text('Member ${index + 1}'),
                          );
                        },
                        body: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Add progress here...',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 3,
                          ),
                        ),
                        isExpanded: isExpandedList[index],
                      ),
                    ],
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
