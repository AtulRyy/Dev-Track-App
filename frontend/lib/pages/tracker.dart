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
  ProgressTrackerPageState createState() => ProgressTrackerPageState();
}

class ProgressTrackerPageState extends State<ProgressTrackerPage>
    with SingleTickerProviderStateMixin {
  List<bool> isExpandedList = []; // Initialize an empty list for expanded state
  List<TextEditingController> progressControllers =
      []; // Initialize an empty list for controllers
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Initialize lists based on the number of items
    int numberOfMembers = 4;
    isExpandedList = List.generate(numberOfMembers, (_) => false);
    progressControllers =
        List.generate(numberOfMembers, (_) => TextEditingController());
  }

  @override
  void dispose() {
    _controller.dispose();
    for (var controller in progressControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Progress Tracker'),
        backgroundColor: const Color.fromARGB(255, 20, 116, 70),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            value: _animation.value,
                            strokeWidth: 10,
                            backgroundColor:
                                const Color.fromARGB(255, 20, 116, 70),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Days Left: 10',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 20, 116, 70)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tasks Completed: 8/10',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 20, 116, 70)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Project Title',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 20, 116, 70)),
                ),
                Text(
                  'Project Domain',
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 20, 116, 70)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: isExpandedList.length, // Use the length of the list
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: const EdgeInsets.all(0),
                      expansionCallback: (int itemIndex, bool isExpanded) {
                        setState(() {
                          isExpandedList[index] = !isExpandedList[index];
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                'Member ${index + 1}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              trailing: PopupMenuButton<String>(
                                onSelected: (String result) {
                                  if (result == 'edit') {
                                    _showEditDialog(context, index);
                                  }
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: 'edit',
                                    child: Text('Edit'),
                                  ),
                                ],
                                icon: const Icon(Icons.more_vert),
                              ),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Member ${index + 1} Details:',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'This section contains details about Member ${index + 1}.\nYou can describe your role, progress, and other relevant information.',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 16),
                                TextField(
                                  controller: progressControllers[index],
                                  decoration: const InputDecoration(
                                    labelText: 'Add progress here...',
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: 3,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Details for Member ${index + 1} saved!'),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 55, 218, 139),
                                  ),
                                  child: const Text('Save Details'),
                                ),
                              ],
                            ),
                          ),
                          isExpanded: isExpandedList[index],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    TextEditingController editController =
        TextEditingController(text: progressControllers[index].text);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Member ${index + 1}'),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(
              labelText: 'Edit details here...',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  progressControllers[index].text = editController.text;
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Details for Member ${index + 1} updated!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 44, 218, 134),
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
