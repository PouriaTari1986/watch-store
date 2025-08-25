class SliderModel {
  final int id;
  final String title;
  final String image;

  SliderModel({
    required this.id,
    required this.title,
    required this.image,
  });

  // Factory method to create a SliderModel from JSON
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id']as int,
      title: json['title']as String,
      image: json['image']as String,
    );
  }
    Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'image': image};
  }
}