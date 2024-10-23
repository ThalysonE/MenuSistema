import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: 0,
              onDestinationSelected: (int index) {},
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert),
                    onSelected: (String value) {
                      print(value);
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'Option 1',
                          child: Text('Option 1'),
                        ),
                        PopupMenuItem(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                      ];
                    },
                  ),
                  label: Text('Options'),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text('Content goes here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
