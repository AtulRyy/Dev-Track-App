import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class Data {
  String caption;
  String username;
  String content;

  Data({required this.caption, required this.username, required this.content});
}

Widget CardTemplate(List<Data> datalist, int index, BuildContext contextt,
    Function onUpdate, Function onDelete) {
  // Initialize TextEditingController with the current caption and content
  TextEditingController _captionController =
      TextEditingController(text: datalist[index].caption);
  TextEditingController _contentController =
      TextEditingController(text: datalist[index].content);

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
              datalist[index].caption,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              datalist[index].username,
              style: TextStyle(color: Color(0xFF93B1A6)),
            ),
            trailing: Container(
              width: 70,
              child: PopupMenuButton<int>(
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Color(0xFF93B1A6),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Edit'),
                        ],
                      ),
                      onTap: () {
                        Future.delayed(
                          Duration.zero,
                          () {
                            showDialog(
                              context: contextt,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: _captionController,
                                          cursorColor: Colors.black45,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            labelText: 'Edit Caption',
                                            labelStyle: TextStyle(
                                                color: Colors.black45),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black45),
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          controller: _contentController,
                                          cursorColor: Colors.black45,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            labelText: 'Edit Content',
                                            labelStyle: TextStyle(
                                                color: Colors.black45),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black45),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            datalist[index].caption =
                                                _captionController.text;
                                            datalist[index].content =
                                                _contentController.text;
                                            onUpdate();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Update',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF93B1A6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Color(0xFF93B1A6),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Delete'),
                      ],
                    ),
                    onTap: () {
                      datalist.removeAt(index);
                      onDelete();
                    },
                  ),
                ],
                iconColor: Color(0xFF93B1A6),
              ),
              // Uncommented for reference, but now redundant
              // child: Row(
              //   children: [
              //     Expanded(
              //       child: IconButton(
              //         onPressed: () {
              //           showDialog(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return Dialog(
              //                 child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(15),
              //                   child: Container(
              //                     padding: EdgeInsets.all(20),
              //                     child: Column(
              //                       mainAxisSize: MainAxisSize.min,
              //                       children: [
              //                         TextField(
              //                           controller: _captionController,
              //                           cursorColor: Colors.black45,
              //                           style: TextStyle(color: Colors.black),
              //                           decoration: InputDecoration(
              //                             labelText: 'Edit Caption',
              //                             labelStyle: TextStyle(color: Colors.black45),
              //                             enabledBorder: UnderlineInputBorder(
              //                               borderSide: BorderSide(color: Colors.black38),
              //                             ),
              //                             focusedBorder: UnderlineInputBorder(
              //                               borderSide: BorderSide(color: Colors.black45),
              //
              //                             ),
              //
              //                           ),
              //                         ),
              //                         TextField(
              //                           controller: _contentController,
              //                           cursorColor: Colors.black45,
              //                           style: TextStyle(color: Colors.black),
              //                           decoration: InputDecoration(
              //                             labelText: 'Edit Content',
              //                             labelStyle: TextStyle(color: Colors.black45),
              //                             enabledBorder: UnderlineInputBorder(
              //                               borderSide: BorderSide(color: Colors.black38),
              //                             ),
              //                             focusedBorder: UnderlineInputBorder(
              //                               borderSide: BorderSide(color: Colors.black45),
              //
              //                             ),
              //
              //                           ),
              //                         ),
              //                         SizedBox(height: 20),
              //                         ElevatedButton(
              //                           onPressed: () {
              //                             datalist[index].caption = _captionController.text;
              //                             datalist[index].content = _contentController.text;
              //                             onUpdate();
              //                             Navigator.of(context).pop();
              //                           },
              //                           child: Text('Update',style: TextStyle(color: Colors.white),),
              //                           style: ElevatedButton.styleFrom(
              //                             backgroundColor: Color(0xFF93B1A6), // Custom button color
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               );
              //             },
              //           );
              //         },
              //         icon: Icon(Icons.edit),color: Color(0xFF93B1A6),
              //       ),
              //     ),
              //     Expanded(
              //       child: IconButton(
              //         onPressed: () {
              //           datalist.removeAt(index);
              //           onDelete(); // Notify parent to update the state
              //         },
              //         icon: Icon(Icons.delete),color: Color(0xFF93B1A6),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFC6C6C6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(datalist[index].content),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
