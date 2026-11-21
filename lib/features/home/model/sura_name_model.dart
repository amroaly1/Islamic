class SuraNameModel {
  final int numberOfAya;
  final String index;
  final String nameAr;
  final String nameEn;

  SuraNameModel(
      {required this.numberOfAya,
      required this.index,
      required this.nameAr,
      required this.nameEn});
  factory SuraNameModel.fromJson(Map<String, dynamic> json) {
    return SuraNameModel(
      numberOfAya: json[ApiKey.count],
      index: json[ApiKey.index],
      nameAr: json[ApiKey.nameAr],
      nameEn: json[ApiKey.nameEn],
    );
  }
}

class ApiKey {
  static const count = "count";
  static const nameEn = "title";
  static const nameAr = "titleAr";
  static const index = "index";
}
