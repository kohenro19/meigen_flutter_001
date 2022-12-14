import 'package:flutter/material.dart';
import 'success_page.dart';
import 'happiness_page.dart';
import 'love_page.dart';

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
      title: 'Word Power',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> meigen_category = [
    {"image": "images/happiness.jpg", "title": "幸福を引き寄せる\nマインドセット", "nextpage": happiness_page()},
    {"image": "images/success.png", "title": "成功を掴むルール", "nextpage": success_page()}, 
    {"image": "images/love.jpg", "title": "男女関係の悩みに効く\nコトバ", "nextpage": love_page()}, 
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // タイトルを中央揃えにする
        title: const Text('名言セラピー',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          )
        ),
        elevation:2 // 境界線に影を付ける
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400, // 2列するには、200にする
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
                    // Stack: 複数のwidgetを重ねる
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage(meigen_category[index]['image']),
                              width: 400,
                              height: 400,
                              fit: BoxFit.fill, // fit: BoxFit.fillによって、画像の角を丸くする
                          ),
                        ),
                      Center(
                        child: Container(
                          child: Text(meigen_category[index]['title'],
                            textAlign:TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              
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