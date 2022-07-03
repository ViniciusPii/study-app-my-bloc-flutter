import 'dart:convert';

class AddressModel {
  AddressModel({
    required this.uf,
    required this.cep,
    required this.gia,
    required this.ddd,
    required this.ibge,
    required this.siafi,
    required this.street,
    required this.locality,
    required this.complement,
    required this.neighborhood,
  });

  final String uf;
  final String cep;
  final String gia;
  final String ddd;
  final String ibge;
  final String siafi;
  final String street;
  final String locality;
  final String complement;
  final String neighborhood;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uf': uf});
    result.addAll({'cep': cep});
    result.addAll({'gia': gia});
    result.addAll({'ddd': ddd});
    result.addAll({'ibge': ibge});
    result.addAll({'siafi': siafi});
    result.addAll({'logradouro': street});
    result.addAll({'localidade': locality});
    result.addAll({'complemento': complement});
    result.addAll({'bairro': neighborhood});

    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      uf: map['uf'] ?? '',
      cep: map['cep'] ?? '',
      gia: map['gia'] ?? '',
      ddd: map['ddd'] ?? '',
      ibge: map['ibge'] ?? '',
      siafi: map['siafi'] ?? '',
      street: map['logradouro'] ?? '',
      locality: map['localidade'] ?? '',
      complement: map['complemento'] ?? '',
      neighborhood: map['bairro'] ?? '',
    );
  }

  static AddressModel get addressEmpty => AddressModel(
        uf: '',
        cep: '',
        gia: '',
        ddd: '',
        ibge: '',
        siafi: '',
        street: '',
        locality: '',
        complement: '',
        neighborhood: '',
      );

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
