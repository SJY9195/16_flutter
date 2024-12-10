import 'package:flutter/material.dart';

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("y._.ssjj", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [    //landing (좌측) ,action(우측), title(center)
          IconButton(
          onPressed: (){},
        icon: Icon(Icons.favorite_border,
            color: Colors.black)),
         IconButton(
           onPressed: (){},
           icon: Icon(
             Icons.message_outlined,
             color: Colors.black,
           )
         ) ,
        ]
      ),

      body: Column(children: [
        Expanded(child: Container(
          color: Colors.purple,
        )),
        Container(height: 100, child: Row(
          children: [
            Flexible(child: Container(color: Colors.brown), flex: 1,),
            Flexible(child: Container(color: Colors.orange), flex: 1,),
          ],
        ),
        )
      ],),

      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home), color: Colors.white,
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.search), color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
