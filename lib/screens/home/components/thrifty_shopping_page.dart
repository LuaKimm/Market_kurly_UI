import 'package:flutter/material.dart';
import 'circle_container.dart';
import 'product_filter_button.dart';
import '../../../models/product.dart';
import '../../components/product_item.dart';

class ThriftyShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 1
        SliverList( //여러 개의 자식 상자를 만들때 사용 하는 SilverList 사용
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: 120,
                child: Image.asset(
                  "assets/images/kurly_banner_1.jpg",
                  fit: BoxFit.fitWidth, // width에 맞춰 잘라주는 역할
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  child: ProductFilterButton(),
                  width: 100,
                ),
              )
            ],
          ),
        ),
        // 2
        SliverPadding( //그리드형 리스트 (2단 or 3단 구조) padding을 Sliver에 적용할 수 있는 특별한 구조
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // 4
              maxCrossAxisExtent: 200.0, //한 아이템의 최대 너비를 지정하고 자동으로 칼럼 수 조절
              mainAxisSpacing: 30.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.6, //가로/세로 비율
            ),
            delegate: SliverChildBuilderDelegate( //항목을 효율적으로 빌드 (React의 Lazy load와 유사)
                  (BuildContext context, int index) {
                // 5
                return Stack( //Stack으로 상품 카드 위에 장바구니 아이콘을 겹쳐놓은 구조
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
              // 6
              childCount: productList.length,
            ),
          ),
        )
      ],
    );
  }
}