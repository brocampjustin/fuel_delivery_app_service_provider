import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceProviderDataModel {
  String name;
  String phoneNuber;
  String eamil;
  bool isAccepted;
  bool isRegisterd;
  ServiceProviderDataModel({
    required this.name,
    required this.phoneNuber,
    required this.eamil,
    required this.isAccepted,
    required this.isRegisterd,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phoneNuber': phoneNuber,
      'eamil': eamil,
      'isAccepted': isAccepted,
      'isRegisterd': isRegisterd,
    };
  }

  factory ServiceProviderDataModel.fromMap(Map<String, dynamic> map) {
    return ServiceProviderDataModel(
      name: map['name'] as String,
      phoneNuber: map['phoneNuber'] as String,
      eamil: map['eamil'] as String,
      isAccepted: map['isAccepted'] as bool,
      isRegisterd: map['isRegisterd'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProviderDataModel.fromJson(String source) => ServiceProviderDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceProviderDataModel(name: $name, phoneNuber: $phoneNuber, eamil: $eamil, isAccepted: $isAccepted, isRegisterd: $isRegisterd)';
  }
}
