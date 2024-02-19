import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_online_shop/const/custom_widgets.dart';
import 'package:moon_online_shop/model/category_model.dart';
import 'package:moon_online_shop/model/product_model.dart';
import 'package:moon_online_shop/services/get_api.dart'; // Import the category service

class HomeCategory extends StatefulWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  late Future<List<Category>> _categoryFuture; // Future for fetching categories

  @override
  void initState() {
    super.initState();
    _categoryFuture = CategoryService.fetchCategories(); // Initialize the Future
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: _categoryFuture, // Provide the Future to the builder
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final categories = snapshot.data!; // Get the list of categories
          return SingleChildScrollView(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {},
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: const Color(0xffDC1D5C)),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(blurRadius: 4, color: Colors.black12, offset: Offset(0, 2)),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            category.icon,
                           scale: 1,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          category.name,
                          style: fontStyle(12, Colors.black, FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
