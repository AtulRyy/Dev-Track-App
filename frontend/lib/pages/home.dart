import 'package:dev_track_app/pages/domain.dart';
import 'package:flutter/material.dart';

class HomePag extends StatelessWidget {
  const HomePag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.purple,
               foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent, // Shadow color
                elevation: 5, // Elevation of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside the button 
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DomainPage()));
              },
              child: Text("Domain Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.deepOrange,
               foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent, // Shadow color
                elevation: 5, // Elevation of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding inside the button
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DomainPage()));
              },
              child: Text("Feed Page"),
            ),

            

          ],
        ),
      ),
    );
  }
}
