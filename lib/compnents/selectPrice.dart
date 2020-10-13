import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class SelectPrice extends StatefulWidget {
  final String price;
  Hexcolor colour;
  SelectPrice({this.price, this.colour});

  @override
  _SelectPriceState createState() => _SelectPriceState();
}

class _SelectPriceState extends State<SelectPrice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.17,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        border: Border.all(color: Hexcolor('EF715A')),
        color: this.widget.colour,
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: IconButton(
        onPressed: () {
          if (this.widget.colour == null) {
            setState(
              () {
                this.widget.colour = Hexcolor('#EF715A');
              },
            );
          } else {
            setState(() {
              this.widget.colour = null;
            });
          }
        },
        icon: Center(
          child: Text(this.widget.price),
        ),
      ),
    );
  }
}
