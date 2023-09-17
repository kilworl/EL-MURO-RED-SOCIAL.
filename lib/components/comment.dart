import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  const Comment(
      {super.key, required this.text, required this.user, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(188, 0, 0, 0),
          borderRadius: BorderRadius.circular(4),
        ),
        margin: EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          //comment
          Text(
            text,
            style: TextStyle(color: Colors.grey[400]),
          ),
          // user , time
          Row(
            children: [
              Text(
                user,
                style: TextStyle(color: Colors.grey[400]),
              ),
              Text(" . ",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 252, 252))),
              Text(time, style: TextStyle(color: Colors.grey[400])),
            ],
          )
        ]));
  }
}
