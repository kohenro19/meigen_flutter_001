import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/favorites.dart';
import 'ItemTile.dart';

class success_page extends StatelessWidget {
  success_page({Key? key}) : super(key: key);


Map meigens = {
     50: {'meigen': '歩け、歩け。続ける事の大切さ', 'person': '伊能忠敬'},
     51: {'meigen': '何であれ素晴らしいものは突如として生じるものではない。ブドウの1房、イチジクの実1つとて同じである。君がイチジクの実が欲しいというなら、私は時間が必要だと答えよう。花が咲き、実がつき、それが熟すのを待たねばならない。', 'person': 'エピクトス（奴隷出身哲学者）'},
     52: {'meigen': '最も重要な決定とは、何をするかではなく、何をしないかを決めることだ。', 'person': 'スティーブ・ジョブズ（アップル創業者）'},
     53: {'meigen': 'ビジネスで成功する一番の方法は、人からいくら取れるかをいつも考えるのではなく、人にどれだけのことをしてあげられるかを考えることである。', 'person': 'デール・カーネギー（米国の実業家）'},
     54: {'meigen': '戦術とは、一点に全ての力をふるうことである。', 'person': 'ナポレオン・ボナパルト（フランスの皇帝）'},
     55: {'meigen': '私はイチゴクリームが大好物だが、魚はどういうわけかミミズが大好物だ。だから魚釣りをする場合、自分のことは考えず、魚の好物のことを考える。', 'person': 'デール・カーネギー（米国の実業家）'},
     56: {'meigen': 'たとえ平凡で小さなことでも、それを自分なりに深く噛みしめ味わえば大きな体験に匹敵します。', 'person': '松下幸之助（パナソニック創業者）'},
     57: {'meigen':  'いくら厳しい規則を作って、家臣に強制しても、大将がわがままな振る舞いをしていたのでは、規則などあってなきがごとしである。人に規則を守らせるには、まず自身の言動を反省し、非があれば直ちに改める姿勢を強く持たねばならない。 ', 'person': '武田信玄（戦国武将）'},
 
    };
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector( // leadingは、戻りの矢印
          onTap: () {Navigator.pop(context);}, // 前のページに戻るときはpopを使う
          child: Icon(Icons.arrow_back, color: Colors.white)
          
        ),
        title: const Text('成功を掴むルール',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ),
 
 body: Center(
        child: ListView.builder(
          itemCount: meigens.length,
          // itemBuilder: (BuildContext context, index)  => ItemTile(index, meigens[index]['meigen']),
           itemBuilder: (BuildContext context, index)  {
            index = index + 50;
            return ItemTile(index, meigens[index]['meigen'], meigens[index]['person']);
           } 
      )
      
    )
    );
  }
}

// class ItemTile extends StatelessWidget {
//   final int itemNo;
//   final String meigen;

//   const ItemTile(
//     this.itemNo,
//     this.meigen
//   );

//   @override
//   Widget build(BuildContext context) {
//     // Provider.of<Favorites>(context) で親Widgetからデータを受け取る
//     var favoritesList = Provider.of<Favorites>(context);

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
//         ),
//         title: Text(
//           'Item $itemNo $meigen',
//           key: Key('text_$itemNo'),
//         ),
//         trailing: IconButton(
//           key: Key('icon_$itemNo'),
//           icon: favoritesList.items.contains(itemNo)
//               ? Icon(Icons.favorite)
//               : Icon(Icons.favorite_border),
//           onPressed: () {
//             !favoritesList.items.contains(itemNo)
//                 ? favoritesList.add(itemNo)
//                 : favoritesList.remove(itemNo);
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(favoritesList.items.contains(itemNo)
//                     ? 'Added to favorites.'
//                     : 'Removed from favorites.'),
//                 duration: Duration(seconds: 1),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }