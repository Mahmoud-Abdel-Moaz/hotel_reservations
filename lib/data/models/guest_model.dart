import '../../domain/entities/guest.dart';

class GuestModel extends Guest {
  const GuestModel(super.firstName, super.lastName, super.avatar);

  factory GuestModel.fromJson(Map<String, dynamic> json) {
    return GuestModel(json['first_name'], json['last_name'], json['avatar']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['avatar'] = avatar;
    return json;
  }
}
