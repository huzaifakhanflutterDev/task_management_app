class USerModel {
  String id, name, email, password;

//<editor-fold desc="Data Methods">
  USerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'password': this.password,
    };
  }

  factory USerModel.fromMap(Map<String, dynamic> map) {
    return USerModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}
