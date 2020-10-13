import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectTag extends StatefulWidget {
  final String name;

  Hexcolor colour;

  SelectTag({this.name, this.colour});

  @override
  _SelectTagState createState() => _SelectTagState();
}

class _SelectTagState extends State<SelectTag> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: this.widget.colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Text(this.widget.name),
        ),
      ),
      onTap: () {
        if (this.widget.colour == Hexcolor('#ECEDE3')) {
          setState(
            () {
              this.widget.colour = Hexcolor('#EF715A');
            },
          );
        } else {
          setState(() {
            this.widget.colour = Hexcolor('#ECEDE3');
          });
        }
      },
    );
  }
}
