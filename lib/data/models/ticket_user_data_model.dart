import '../../domain/entities/ticket_user_data.dart';

class TicketUserDataModel extends TicketUserData {
  const TicketUserDataModel(
      super.firstName, super.lastName, super.avatar, super.isUser);

  factory TicketUserDataModel.fromJson(Map<String, dynamic> json) {
    return TicketUserDataModel(
        json['first_name'], json['last_name'], json['avatar'], json['is_user']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['avatar'] = avatar;
    json['is_user'] = isUser;
    return json;
  }
}
