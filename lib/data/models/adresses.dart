class Addresses {
  final String address;
  final double lat;
  final double lng;
  final String postalCode;

  Addresses({
    required this.address,
    required this.lat,
    required this.lng,
    required this.postalCode,
  });

  factory Addresses.fromJson(Map<String, dynamic> json) {
    return Addresses(
      address: json['address'],
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      postalCode: json['postal_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'lat': lat,
      'lng': lng,
      'postal_code': postalCode,
    };
  }
}
