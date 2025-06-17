class CountryReport {
  final String country;
  final int cases;
  final CountryInfo countryInfo;

  CountryReport({
    required this.country,
    required this.cases,
    required this.countryInfo,
  });

  factory CountryReport.fromJson(Map<String, dynamic> json) {
    return CountryReport(
      country: json['country'] ?? '',
      cases: json['cases'] ?? 0,
      countryInfo: CountryInfo.fromJson(json['countryInfo'] ?? {}),
    );
  }
}

class CountryInfo {
  final String flag;

  CountryInfo({required this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(flag: json['flag'] ?? '');
  }
}
