import 'package:dev_track_app/components/bottomNav.dart';
import 'package:dev_track_app/components/topNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF040D12),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            TopNav(),
            SizedBox(
              height: 15,
            ),
            Card(
              color: Color(0xFF040D12),
            child: Container(
            height: 250,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  color: Color(0xFF183D3D),
                  borderRadius: BorderRadius.circular(15),
                ),
              child: Column(
                children: <Widget>[
                  ListTile(leading: CircleAvatar(backgroundImage: AssetImage('assets/images/hitler.png'),),
                  title: Text("Jackets are here!!!",style: TextStyle(color: Colors.white),),
                  subtitle: Text('AtulReny', style: TextStyle(color: Color(0xFF93B1A6)),),
                  ),SizedBox(height: 5,),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFC6C6C6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Time to get your dev flex merch and you can have it this Wednesday!'
                      ),
                    )),

                  ],
                ))),
          SizedBox(height: 10,
          ),
            Card(
                color: Color(0xFF040D12),
                child: Container(
                    height: 250,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFF183D3D),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(leading: CircleAvatar(backgroundImage: AssetImage('assets/images/hitler.png'),),
                          title: Text("Jackets are here!!!",style: TextStyle(color: Colors.white),),
                          subtitle: Text('AtulReny', style: TextStyle(color: Color(0xFF93B1A6)),),
                        ),SizedBox(height: 5,),
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFC6C6C6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('Time to get your dev flex merch and you can have it this Wednesday!'
                              ),
                            )),

                      ],
                    ))),
            SizedBox(height: 10,
            ),
            Card(
                color: Color(0xFF040D12),
                child: Container(
                    height: 250,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFF183D3D),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(leading: CircleAvatar(backgroundImage: AssetImage('assets/images/hitler.png'),),
                          title: Text("Jackets are here!!!",style: TextStyle(color: Colors.white),),
                          subtitle: Text('AtulReny', style: TextStyle(color: Color(0xFF93B1A6)),),
                        ),SizedBox(height: 5,),
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFC6C6C6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('Time to get your dev flex merch and you can have it this Wednesday!'
                              ),
                            )),

                      ],
                    ))),SizedBox(height: 10,
            ),
            Card(
                color: Color(0xFF040D12),
                child: Container(
                    height: 250,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFF183D3D),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(leading: CircleAvatar(backgroundImage: AssetImage('assets/images/hitler.png'),),
                          title: Text("Jackets are here!!!",style: TextStyle(color: Colors.white),),
                          subtitle: Text('AtulReny', style: TextStyle(color: Color(0xFF93B1A6)),),
                        ),SizedBox(height: 5,),
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFC6C6C6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('Time to get your dev flex merch and you can have it this Wednesday!'
                              ),
                            )),

                      ],
                    ))),
          ],
              )

        )


    );
  }
}
