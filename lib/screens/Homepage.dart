import 'package:flutter/material.dart';
import 'package:milkman_application_4/widgets/homepagehelper.dart';
import 'package:provider/provider.dart';

import '../providers/ProductsProvider.dart';
import 'navscreen/bottomna.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi,Vicky'),
              Row(
                children: [
                  Icon(Icons.location_on, size: 15),
                  Text(
                    'Gurgaon',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.bookmark_outline_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: HomePageHelp(),
        bottomNavigationBar: BottomNavigationB(),
      ),
    );
  }
}
