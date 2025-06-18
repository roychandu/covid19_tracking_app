class CountryReport {
  final String country;
  final int cases;
  final int deaths;
  final int recovered;
  final int population;
  final int active;
  final int critical;
  final CountryInfo countryInfo;

  CountryReport({
    required this.country,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.population,
    required this.active,
    required this.critical,
    required this.countryInfo,
  });

  factory CountryReport.fromJson(Map<String, dynamic> json) {
    return CountryReport(
      country: json['country'] ?? '',
      cases: json['cases'] ?? 0,
      deaths: json['deaths'] ?? 0,
      recovered: json['recovered'] ?? 0,
      population: json['population'] ?? 0,
      active: json['active'] ?? 0,
      critical: json['critical'] ?? 0,
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
