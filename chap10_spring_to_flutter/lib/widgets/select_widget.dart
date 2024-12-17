import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuSelectWidget extends StatefulWidget {
  const MenuSelectWidget({super.key});

  @override
  State<MenuSelectWidget> createState() => _MenuSelectWidgetState();
}

class _MenuSelectWidgetState extends State<MenuSelectWidget> {

  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];

  @override
  void initState() {
    super.initState();
    _loadMenus();
  } // 메뉴 목록을 담을 리스트


  void _loadMenus() async{
    List<dynamic> menuData = await _menuModel.searchMenu();
    setState(() {
      _menus = menuData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Menu List",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _menus.isEmpty
            ? Center(child: CircularProgressIndicator())
                : Expanded(
              child: ListView.builder(
                itemCount: _menus.length,
                itemBuilder: (context, i) {
                  final menu = _menus[i];
                  return Container(
                    child: ListTile(
                      title: Text(menu['menuName'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                      subtitle: Text('${menu['menuPrice']}원',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                          MenuDetailPage(menu: _menus[i]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        )
    );
  }
}

class MenuDetailPage extends StatelessWidget {
  final Map<String, dynamic> menu;

  const MenuDetailPage({
    required this.menu,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu['menuName']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
            alignment: Alignment.centerLeft,
            child:
            ElevatedButton(
                onPressed: (){
              Navigator.pop(context);
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
                child: Text("Back"),
            ),
            ),
            Text("메뉴 이름: ${menu['menuName']}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 10),
            Text("가격: ${menu['menuPrice']}"),
            SizedBox(height: 10),
            Text("카테고리 코드: ${menu['menuCode']}"),
            SizedBox(height: 10),
            Text("주문 가능 상태: ${menu['orderableStatus']}"),
          ],
        ),
      ),
    );
  }
}


