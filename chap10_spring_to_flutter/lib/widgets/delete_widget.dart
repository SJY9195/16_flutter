import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuDeleteWidget extends StatefulWidget {
  const MenuDeleteWidget({super.key});

  @override
  State<MenuDeleteWidget> createState() => _MenuDeleteWidgetState();
}

class _MenuDeleteWidgetState extends State<MenuDeleteWidget> {

  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = []; // 메뉴 목록을 담을 리스트
  dynamic _selectedMenu;

  @override
  void initState() {
    super.initState();
    _loadMenus();
  } // 선택된 메뉴

  // 메뉴 목록을 불러오는 함수
  void _loadMenus() async{
    List<dynamic> menuData = await _menuModel.searchMenu();
    setState(() {
      _menus = menuData;
    });
  }

  // 수정 메뉴 등록 메소드
  void _deleteMenu() async{

    try{
      String result = await _menuModel.deleteMenu(_selectedMenu);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
      Navigator.pushReplacementNamed(context, "/home");
    }catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownButton(
            value: _selectedMenu,
            hint: Text("메뉴 선택"),
            onChanged: (dynamic newValue){
              setState(() {
                _selectedMenu = newValue;
              });
            },
            items: _menus.map((dynamic menu){
              return DropdownMenuItem(
                value: menu,
                child: Text(menu['menuName']),
              );
            }).toList(),
          ),
          ElevatedButton(onPressed: _deleteMenu, child: Text("메뉴 삭제하기")),
        ],
      ),
    );
  }
}
