import 'package:flutter/material.dart';
import 'meigen.dart';
import 'db_provider.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  DBProvider dBProvider = DBProvider();

  List<Color> colorList = [Colors.cyan, Colors.deepOrange, Colors.indigo];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
 
      body: Center(
        child: FutureBuilder<List>(
          future: dBProvider.getMeigens(),
          initialData: [],
          builder: (BuildContext context, snapshot) {
            var data = snapshot.data;
            var datalength = data!.length;

            return datalength == 0
              ? const Center(
                child: Text('no data found'),
              )
              : ListView.builder(
                itemCount: datalength,
                itemBuilder: (context, i) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: Icon(Icons.delete, color: Colors.white),
                    onDismissed: (direction) {
                      
                    },
                  );
                },
              );
          }),
      )
      
    );
  }
}