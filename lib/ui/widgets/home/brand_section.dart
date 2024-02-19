import 'package:flutter/material.dart';
import 'package:moon_online_shop/model/product_model.dart';
import 'package:moon_online_shop/services/get_api.dart';
import 'package:moon_online_shop/ui/utils/color_pallate.dart';

class BrandSection extends StatefulWidget {
  const BrandSection({Key? key}) : super(key: key);

  @override
  State<BrandSection> createState() => _BrandSectionState();
}

class _BrandSectionState extends State<BrandSection> {
  late Future<List<Brand>> _brandsFuture;

  @override
  void initState() {
    super.initState();
    _loadBrands();
  }

  Future<void> _loadBrands() async {
    _brandsFuture = BrandService.fetchBrands();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Brand>>(
      future: _brandsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final brands = snapshot.data!;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 2,
            ),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return Container(
                decoration: BoxDecoration(border: Border.all(color: borderColor)),
                child: Image.network(
                  brand.logo,
                  fit: BoxFit.scaleDown,
                ),
              );
            },
          );
        }
      },
    );
  }
}
