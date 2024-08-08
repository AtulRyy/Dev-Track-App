import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data {
  String caption;
  String username;
  String content;

  Data({required this.caption, required this.username, required this.content});
}

Widget CardTemplate(datalist) {
  return Card(
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
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/hitler.png'),
              ),
              title: Text(
                datalist.caption,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                datalist.username,
                style: TextStyle(color: Color(0xFF93B1A6)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFC6C6C6),
                borderRadius: BorderRadius.circular(10),
              ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(datalist.content),
                  ),
            )),
          ],
        )),
  );
}
