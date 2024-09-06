import 'package:dev_track_app/components/bottomNav.dart';
import 'package:dev_track_app/pages/mgmt_previous_projects/mgmg_prev_projects.dart';
import 'package:dev_track_app/pages/previous_projects.dart';
import 'package:dev_track_app/pages/splashscreen.dart';
import 'package:dev_track_app/pages/confirm_page.dart';
import 'package:dev_track_app/pages/domain.dart';
import 'package:dev_track_app/pages/specific_project.dart';
import 'package:dev_track_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dev_track_app/pages/tracker.dart';
import 'package:dev_track_app/pages/submission_page.dart';
import 'package:dev_track_app/pages/submission_page.dart';

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
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Home Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DomainPage()));
              },
              child: Text("Domain Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 39, 94, 176),
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNav()));
              },
              child: Text("Bottom Nav"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 39, 94, 176),
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SubmissionPage()));
              },
              child: Text("Submission Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 39, 94, 176),
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent, // Shadow color
                elevation: 5, // Elevation of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 15), // Padding inside the button
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SubmissionPage()));
              },
              child: Text("Submission Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 39, 94, 176),
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent, // Shadow color
                elevation: 5, // Elevation of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 15), // Padding inside the button
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SubmissionPage()));
              },
              child: Text("Submission Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfirmPage()));
              },
              child: const Text("Confirm"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(

                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 15), // Padding inside the button

                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PreviousProjects()));

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SpecificProject()));

              },
              child: Text("Previous Projects"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 50, 7, 120),
                foregroundColor: Color.fromARGB(255, 242, 244, 244),
                shadowColor: Colors.black12,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Splash()));
              },
              child: const Text("SplashScreen"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProgressTrackerPage()));
              },
              child: const Text("Tracker Page"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shadowColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>MgmtPreviousProjects()));
              },
              child: const Text("Management Project View Page"),
            ),
          ],
        ),
      ),
    );
  }
}
