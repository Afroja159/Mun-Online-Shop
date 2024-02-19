import 'package:flutter/material.dart';
import 'package:moon_online_shop/model/care_model.dart';

class CareSection extends StatefulWidget {
  const CareSection({super.key});

  @override
  State<CareSection> createState() => _CareSectionState();
}

class _CareSectionState extends State<CareSection> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 18,
          childAspectRatio: 1.1),
      itemCount: careList.length,
      itemBuilder: (context, index) {
        return Image.asset(
          '${careList[index].img}',
        );
      },
    );
  }
}
