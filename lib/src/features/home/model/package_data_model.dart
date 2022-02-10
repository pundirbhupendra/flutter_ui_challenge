class PackagesDataModel {
  CurrentBookings? currentBookings;
  List<Packages> packages = [];

  PackagesDataModel({this.currentBookings});

  PackagesDataModel.fromJson(Map<String, dynamic> json) {
    currentBookings = json['current_bookings'] != null
        ? CurrentBookings.fromJson(json['current_bookings'])
        : null;
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages.add(Packages.fromJson(v));
      });
    }
  }
}

class CurrentBookings {
  String? packageLabel;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  CurrentBookings(
      {this.packageLabel,
      this.fromDate,
      this.fromTime,
      this.toDate,
      this.toTime});

  CurrentBookings.fromJson(Map<String, dynamic> json) {
    packageLabel = json['package_label'];
    fromDate = json['from_date'];
    fromTime = json['from_time'];
    toDate = json['to_date'];
    toTime = json['to_time'];
  }
}

class Packages {
  int? id;
  String? packageName;
  int? price;
  String? description;

  Packages({this.id, this.packageName, this.price, this.description});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    price = json['price'];
    description = json['description'];
  }
}
