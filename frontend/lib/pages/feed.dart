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
String usernam='AtulReny';
class _FeedPageState extends State<FeedPage> {
  List<Data> posts = [
    Data(
      caption: 'Jackets are here!!!',
      username: usernam,
      content: 'Come and collect em today hehehehehe',
    ),
  ];
  void _updateState() {
    setState(() {});
  }

  void _deleteState() {
    setState(() {});
  }
  void _addState(String cap, String con){
    setState(() {
      posts.insert(0,Data(caption: cap, username: usernam, content: con));

    });
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _captionAdder = TextEditingController();
    TextEditingController _contentAdder = TextEditingController();
    String newcap='.';
    String newcon='.';

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
          floatingActionButton: FloatingActionButton(onPressed: () {
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _captionAdder,
                          cursorColor: Colors.black45,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Add Caption',
                            labelStyle: TextStyle(color: Colors.black45),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45),

                            ),

                          ),
                        ),
                        TextField(
                          controller: _contentAdder,
                          cursorColor: Colors.black45,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Add Content',
                            labelStyle: TextStyle(color: Colors.black45),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45),

                            ),

                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            newcap = _captionAdder.text;
                            newcon = _contentAdder.text;
                            _addState(newcap, newcon);
                            Navigator.of(context).pop();
                          },
                          child: Text('Post',style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF93B1A6), // Custom button color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );} ,backgroundColor: Color(0xFF93B1A6), child: Icon(CupertinoIcons.plus, color: Colors.white,),)
      ),
    );
  }
}
