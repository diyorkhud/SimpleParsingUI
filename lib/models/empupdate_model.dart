class EmpUpdate{
  String status;
  String message;

  EmpUpdate.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'];

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
      };
}