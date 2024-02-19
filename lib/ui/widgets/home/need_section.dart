import 'package:flutter/material.dart';
import 'package:moon_online_shop/model/need_model.dart';

class NeedSection extends StatefulWidget {
  const NeedSection({super.key});

  @override
  State<NeedSection> createState() => _NeedSectionState();
}

class _NeedSectionState extends State<NeedSection> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 20,
          childAspectRatio: 1.1
      ),
      itemCount: needList.length,
      itemBuilder: (context, index) {
        return Image.asset(
          '${needList[index].img}',
        );
      },
    );
  }
}
