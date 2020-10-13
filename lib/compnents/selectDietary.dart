import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectDietary extends StatefulWidget {
  final String text;
  IconData icon;
  bool check;

  SelectDietary({this.text, this.icon, this.check});

  @override
  _SelectDietaryState createState() => _SelectDietaryState();
}

class _SelectDietaryState extends State<SelectDietary> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
            child: Text(this.widget.text),
          ),
          Icon(
            this.widget.icon,
            color: Colors.green,
          ),
        ],
      ),
      onTap: () {
        if (!this.widget.check) {
          setState(() {
            this.widget.icon = Icons.check;
            this.widget.check = !this.widget.check;
          });
        } else {
          setState(() {
            this.widget.icon = null;
            this.widget.check = !this.widget.check;
          });
        }
      },
    );
  }
}
