import 'package:flutter/material.dart';
import 'package:moon_online_shop/model/sale_model.dart';

class SaleSection extends StatelessWidget {
  const SaleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 16,
          childAspectRatio: 1.7),
      itemCount: saleList.length,
      itemBuilder: (context, index) {
        return
        //   Container(
        //   height: 96.h,
        //   width: 160.w,
        //   decoration: BoxDecoration(
        //       image:
        //           DecorationImage(image: AssetImage('${saleList[index].img}'))),
        // );

          Image.asset(
          '${saleList[index].img}',
        );
      },
    );
  }
}
