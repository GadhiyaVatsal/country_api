const String tableCountry = 'country';

class CountryField {
  static final List<String> values = [
    id,
    name,
    region,
    subregion,
    population,
    flag,
    isSelected,
    latlng0,
    latlng1,
    currencies0,
    currencies1,
    currencies2
  ];

  static const String id = '_id';
  static const String name = 'name';
  static const String region = 'region';
  static const String subregion = 'subregion';
  static const String population = 'population';
  static const String flag = 'flag';
  static const String isSelected = 'isSelected';
  static const String latlng0 = 'latlng0';
  static const String latlng1 = 'latlng1';
  static const String currencies0 = 'curr0';
  static const String currencies1 = 'curr1';
  static const String currencies2 = 'curr2';
}

class Country {
  final int? id;
  final String name;
  final List<dynamic>? latlng;
  final String region;
  final String subregion;
  final String population;
  final List<Currencies>? currencies;
  final String flag;
  late bool isSelected;

  String? currencies0;
  String? currencies1;
  String? currencies2;
  String? latlng0;
  String? latlng1;

  Country({
    this.id,
    this.currencies0,
    this.currencies1,
    this.currencies2,
    this.latlng0,
    this.latlng1,
    required this.name,
    this.latlng,
    required this.region,
    required this.subregion,
    required this.population,
    required this.flag,
    this.currencies,
    this.isSelected = false,
  });

  Country copy({
    int? id,
    String? name,
    String? latlng0,
    String? latlng1,
    String? region,
    String? subregion,
    String? population,
    String? currencies0,
    String? currencies1,
    String? currencies2,
    String? flag,
    bool? isSelected,
  }) =>
      Country(
        id: id ?? this.id,
        currencies0: currencies0 ?? this.currencies![0].name,
        currencies1: currencies1 ?? this.currencies![0].code,
        currencies2: currencies2 ?? this.currencies![0].symbol,
        latlng0: latlng0 ?? this.latlng![0].toString(),
        latlng1: latlng1 ?? this.latlng![1].toString(),
        name: name ?? this.name,
        population: population ?? this.population,
        isSelected: isSelected ?? this.isSelected,
        flag: flag ?? this.flag,
        region: region ?? this.region,
        subregion: subregion ?? this.subregion,
        currencies: this.currencies,
        latlng: this.latlng,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'],
        latlng: json['latlng'],
        region: json['region'],
        subregion: json['subregion'],
        population: json['population'].toString(),
        flag: json['flag'],
        isSelected: false,
        currencies: (json['currencies'] as List)
            .map((e) => Currencies.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, Object?> toJson() => {
        CountryField.id: id,
        CountryField.name: name,
        CountryField.population: population,
        CountryField.flag: flag,
        CountryField.isSelected: isSelected ? 1 : 0,
        CountryField.region: region,
        CountryField.subregion: subregion,
        CountryField.latlng0: latlng![0],
        CountryField.latlng1: latlng![1],
        CountryField.currencies0: currencies![0].name,
        CountryField.currencies1: currencies![0].code,
        CountryField.currencies2: currencies![0].symbol,
      };

  factory Country.fJson(Map<String, Object?> json) => Country(
        id: json[CountryField.id] as int?,
        name: json[CountryField.name] as String,
        population: json[CountryField.population] as String,
        flag: json[CountryField.flag] as String,
        isSelected: json[CountryField.isSelected] == 0,
        region: json[CountryField.region] as String,
        subregion: json[CountryField.subregion] as String,
        latlng0: json[CountryField.latlng0] as String,
        latlng1: json[CountryField.latlng1] as String,
        currencies0: json[CountryField.currencies0] as String,
        currencies1: json[CountryField.currencies1] as String,
        currencies2: json[CountryField.currencies2] as String,
      );
}

class Currencies {
  String code;
  String name;
  String symbol;

  Currencies.name(this.code, this.name, this.symbol);

  factory Currencies.fromJson(Map<String, dynamic> json) =>
      Currencies.name(json['code'], json['name'], json['symbol']);
}
