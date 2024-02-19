import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moon_online_shop/model/product_model.dart';

class SliderPhotoService {
  static Future<List<SliderPhoto>> fetchSliderPhotos() async {
    try {
      final response = await http.get(Uri.parse('https://munonlineshopbd.com/api/sliders'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        return jsonData.map((photoJson) => SliderPhoto.fromJson(photoJson)).toList();
      } else {
        throw Exception('Failed to load slider photos');
      }
    } catch (e) {
      print('Error fetching slider photos: $e');
      throw Exception('Failed to load slider photos');
    }
  }
}

class CategoryService {
  static Future<List<Category>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('https://munonlineshopbd.com/api/home-categories'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        return jsonData.map((categoryJson) => Category.fromJson(categoryJson)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      throw Exception('Failed to load categories');
    }
  }
}

class BrandService {
  static Future<List<Brand>> fetchBrands() async {
    try {
      final response = await http.get(Uri.parse('https://munonlineshopbd.com/api/brands'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        return jsonData.map((brandJson) => Brand.fromJson(brandJson)).toList();
      } else {
        throw Exception('Failed to load brands');
      }
    } catch (e) {
      print('Error fetching brands: $e');
      throw Exception('Failed to load brands');
    }
  }
}
