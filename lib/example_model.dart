

class ExampleModel {
  String name;
  String imageUrl;

  ExampleModel({
    required this.name,
    required this.imageUrl,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
        name: json['name'] as String,
        imageUrl: json["imageUrl"] as String,
      );
  Map<String, dynamic> toJson(ExampleModel instance) => <String, dynamic>{
        'name': instance.name,
        'imageUrl': instance.imageUrl,
      };
}
