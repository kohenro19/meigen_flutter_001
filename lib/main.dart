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
                  child: Container(
                    width: 200,
                    // marginは外側の余白を指定することができるプロパティ
                    // EdgeInsets.all(数値): 全方向の余白
                    // margin: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage('images/life.jpg'),
                              width: 400,
                              height: 400,
                              fit: BoxFit.fill,
                            // image: NetworkImage('https://www.tutorialkart.com/img/hummingbird.png'),
                          ),
                        ),
                      Center(
                        child: Container(
                          // margin: EdgeInsets.all(50),
                          child: Text("人生の名言",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      )
                      ]
                    )
                  )
              );
            }),
      ),
    );
  }
}