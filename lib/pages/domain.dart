import 'package:dev_track_app/components/topNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DomainPage extends StatelessWidget {
  const DomainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF040D12),
        body: Column(
          children: [
            TopNav(),
            Container(
              decoration: BoxDecoration(color: Color(0xFF183D3D)),
              margin: EdgeInsets.only(left: 14,right: 14),
            )
          ],
        ),
      ),
    );
  }
}
