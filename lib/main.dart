// kindacode.com
// main.dart
import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'detail_page2.dart';
import 'detail_page3.dart';
import 'note_card.dart';
import 'db_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Meigen',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> meigen_category = [
    {"category": "images/life.png", "nextpage": DetailPage()},
    // {"category": "名声", "nextpage": DetailPage2()}, 
    // {"category": "夫婦", "nextpage": DetailPage3()} 
    
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: meigen_category.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=> meigen_category[index]['nextpage']));
                },
                // child: Container(
                //   // padding: EdgeInsets.all(kDefaultPadding),
                //   height: 180,
                //   width: 160,
                //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                //   child: Image.asset(meigen_category[index]['category'])
                // )
                child: ClipRRect(
                    child: Image.asset('images/life.png',),
                    borderRadius: BorderRadius.all(Radius.circular(30)),   
                )
              );
            }),
      ),
    );
  }
}