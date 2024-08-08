import 'package:dev_track_app/components/bottomNav.dart';
import 'package:dev_track_app/components/post.dart';
import 'package:dev_track_app/components/topNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dev_track_app/components/post.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Data> post=[
    Data(caption: 'Jackets are here!!!', username: 'AtulReny', content: 'Come and collect em today hehehehehe')
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF040D12),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            TopNav(),
                SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: post.map((datalist)=> CardTemplate(datalist)).toList(),
            ),
            SizedBox(height: 10),

          ],
              )

        )


    );
  }
}
