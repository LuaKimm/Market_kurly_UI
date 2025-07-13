import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'circle_container.dart';
import 'product_filter_button.dart';
import '../../../models/product.dart';
import '../../components/product_item.dart';

class NewProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      // 1
      child: CustomScrollView( //슬라이더 직접 제공하여 목록, 그리드 및 확장 헤더와 같은 다양한 스크로 효과 생성
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return Future<void>.delayed(const Duration(seconds: 1));
            },
          ),
          // 2
          SliverAppBar( //머티리얼 디자인 앱 바, 스크롤 될때마다형태가 바뀌거나 사라지는 효과
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            titleSpacing: 0,
            actions: [
              SizedBox(
                child: ProductFilterButton(),
                width: 100,
              )
            ],
          ),
          // 3
          SliverGrid( //다 같이 스크롤 하고 싶거나 더 복잡한 스크롤 뷰 효과 만들고 싶을때 슬리버 리스트와 슬리버 그리드 사용
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // 4 한 항목에 최대크기 지정 교차 축의 범위 균등하게 나눔
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 30.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.6,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                // 5 stack 위젯을 통해 위젯을 더 추가해서 꾸밀 수 있음
                return Stack(
                  children: [
                    ProductItem(
                      product: productList[index],
                    ),
                    Positioned(
                      bottom: 90,
                      right: 10,
                      child: CircleContainer(
                          iconPath: 'assets/icons/shopping-cart.svg'),
                    )
                  ],
                );
              },
              // 6 자식의 위젯의 총 개수
              childCount: productList.length,
            ),
          ),
        ],
      ),
    );
  }
}