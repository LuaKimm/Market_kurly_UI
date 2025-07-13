import 'package:flutter/material.dart';
import '../components/custom_actions.dart';
import 'components/my_kurly_body.dart';

class MyKurlyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false, //back버튼 수동으로 구현 or 완전히 제거하는 기능
        title: Text("마이컬리"),
        actions: [
          CustomActions(),
        ],
      ),
      body: SingleChildScrollView(
        child: MyKurlyBody(),
      ),
    );
  }
}