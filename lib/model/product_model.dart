class SliderPhoto {
  final String photo;

  SliderPhoto({required this.photo});

  factory SliderPhoto.fromJson(Map<String, dynamic> json) {
    return SliderPhoto(
      photo: json['photo'] ?? '',
    );
  }
}

class Category {
  final String name;
  final String icon;

  Category({
    required this.name,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      icon: json['icon'],
    );
  }
}

class Brand {
  final String name;
  final String logo;
  final String productsLink;

  Brand({
    required this.name,
    required this.logo,
    required this.productsLink,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'],
      logo: json['logo'],
      productsLink: json['links']['products'],
    );
  }
}
