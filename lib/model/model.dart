class ClassName {
  //final String? mobile;
  final String? lastName;
  final String? firstName;
  final String? age;
  final String? email;

  ClassName({
    //this.mobile,
    this.lastName,
    this.firstName,
    this.age,
    this.email,
  });

  ClassName.fromJson(Map<String, dynamic> json)
      : lastName = json['last_name'] as String?,
        firstName = json['first_name'] as String?,
        age = json['age'] as String?,
        email = json['email'] as String?;

  Map<String, dynamic> toJson() => {
    'last_name' : lastName,
    'first_name' : firstName,
    'age' : age,
    'email' : email
  };
}
