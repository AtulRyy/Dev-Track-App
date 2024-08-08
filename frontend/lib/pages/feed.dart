import 'package:dev_track_app/components/bottomNav.dart';
import 'package:dev_track_app/components/post.dart';
import 'package:dev_track_app/components/topNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Data> posts = [
    Data(
      caption: 'Jackets are here!!!',
      username: 'AtulReny',
      content: 'Come and collect em today hehehehehe',
    ),
    // Add more Data objects here as needed
  ];
  void _updateState() {
    setState(() {});
  }

  void _deleteState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF040D12),
        body: Column(
          children: [
            TopNav(), // Add the top navigation bar
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return CardTemplate(posts, index, context, _updateState, _deleteState);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
