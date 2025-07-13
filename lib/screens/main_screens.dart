//5개 화면을 하단 탭바로 이동하면서 보여주는 UI
//선택된 탭(index)에 따라 IndexedStack으로 해당 화면만 보여줌

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../models/nav_item.dart';
import 'category/category_screen.dart';
import 'home/home_screen.dart';
import 'my_kurly/my_kurly_screen.dart';
import 'recommend/recommend_screen.dart';
import 'search/search_screen.dart';

class MainScreens extends StatefulWidget {
  static String routeName = "/main_screens";

  @override
  _MainScreensState createState() => _MainScreensState(); //statefulWidget필수 메서드 실제 상태 생성
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0; //어떤 탭이 선택됐는지 기억하는 변수 ex) 0번 홈화면 1번 추천화면

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( //stack처럼 모든 자식을 쌓되 index에 해당하는 자식만 보이게 함 (나머지는 보이지 않지만 상태 유지)
        index: _selectedIndex,
        children: [
          HomeScreen(),
          RecommendScreen(),
          CategoryScreen(),
          SearchScreen(),
          MyKurlyScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex, //지금 어떤 탭이 화성화 됐는지 표시
        backgroundColor: Colors.white,
        onTap: onTaped,
        items: List.generate( //리스트를 동적으로 만드는 Dart문법, nav_item.dart에서 만든 데이터 navItems의 개수만큼 반복문 돌면서 _buildBottomNavigationBottom() 메서드 호출
          navItems.length,
              (index) => _buildBottomNavigationBarItem( //탭마다 다른 아이콘, 텍스트 넣기위해..
            icon: navItems[index].icon,
            label: navItems[index].label, //현재 선택한 BottomNavigationBarItem 인덱스 번호와 NavItem 객체의 id값이 같으면 true
            isActive: navItems[index].id == _selectedIndex ? true : false,
          ),
        ),
      ),
    );
  }

  void onTaped(index) { //탭바의 항목을 눌렀을때 실행할 함수
    setState(() {
      _selectedIndex = index;
    });
  } // 선택된 탭을 _selectedIndex에 반영 -> setState()로 화면 다시 그림

  _buildBottomNavigationBarItem( //탭바 아이템 만드는 커스텀 생성 함수
      {String? icon,
        String? label,
        bool isActive = false,
        GestureTapCallback? press}) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 38,
        height: 38,
        child: IconButton(
          onPressed: press,
          icon: SvgPicture.asset(icon ?? "assets/icons/star.svg",
              color: isActive ? kPrimaryColor : Colors.black),
        ),
      ),
      label: label,
    );
  }
}