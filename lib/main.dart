import 'package:filter/compnents/selectPrice.dart';
import 'package:filter/compnents/selectTag.dart';
import 'package:filter/compnents/selectDietary.dart';
import 'package:filter/compnents/title.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter & Sort',
      home: Filsort(),
    );
  }
}

class Filsort extends StatefulWidget {
  @override
  _FilsortState createState() => _FilsortState();
}

class _FilsortState extends State<Filsort> with TickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 2, vsync: this);

    Widget tabBarItem() {
      return TabBar(
        unselectedLabelColor: Colors.black,
        labelColor: Hexcolor('#EF715A'),
        indicatorColor: Hexcolor('#EF715A'),
        tabs: [
          Tab(
            text: 'Filter',
          ),
          Tab(
            text: 'Sort',
          ),
        ],
        controller: tabController,
      );
    }

    // ignore: non_constant_identifier_names
    Widget Filter() {
      return Wrap(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(title: 'Price Range'),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectPrice(price: '\$'),
                    SelectPrice(price: '\$\$'),
                    SelectPrice(price: '\$\$\$'),
                    SelectPrice(price: '\$\$\$\$'),
                  ],
                ),
                SizedBox(height: 10.0),
                TitleText(title: 'Dietary'),
                SizedBox(height: 8.0),
                SelectDietary(text: 'Vegetarian', check: false),
                Divider(color: Colors.grey[800]),
                SelectDietary(text: 'Vegan', check: false),
                Divider(color: Colors.grey[800]),
                SelectDietary(text: 'Giuten-Free', check: false),
                Divider(color: Colors.grey[800]),
                SizedBox(height: 8.0),
                TitleText(title: 'Cuisines'),
                Wrap(
                  children: [
                    SelectTag(name: 'All', colour: Hexcolor('#ECEDE3')),
                    SelectTag(name: 'Irish', colour: Hexcolor('#ECEDE3')),
                    SelectTag(name: 'India', colour: Hexcolor('#ECEDE3')),
                    SelectTag(name: 'Japan', colour: Hexcolor('#ECEDE3')),
                    SelectTag(name: 'Asian', colour: Hexcolor('#ECEDE3')),
                    SelectTag(name: 'America', colour: Hexcolor('#ECEDE3')),
                    SelectTag(name: 'Russia', colour: Hexcolor('#ECEDE3')),
                    SelectTag(name: 'Korea', colour: Hexcolor('#ECEDE3')),
                  ],
                ),
                SizedBox(height: 10.0),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Hexcolor('#EF715A'),
                    ),
                    child: Center(
                      child: const Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    // ignore: non_constant_identifier_names
    Widget Sort() {
      return Padding(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0),
        child: Column(
          children: [
            SelectDietary(text: 'Recommended', check: false),
            Divider(color: Colors.grey[800]),
            SelectDietary(text: 'Most Popular', check: false),
            Divider(color: Colors.grey[800]),
            SelectDietary(text: 'Rating', check: false),
            Divider(color: Colors.grey[800]),
            SelectDietary(text: 'Delivery time', check: false),
            Divider(color: Colors.grey[800]),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Text(
                'Reset',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.only(right: 10.0),
              onPressed: () {},
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
            onPressed: () => Navigator.pop(context, false),
          ),
          bottom: tabBarItem(),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Filter(),
            Sort(),
          ],
        ),
      ),
    );
  }
}
