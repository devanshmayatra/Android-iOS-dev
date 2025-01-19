class UserDetailsModel {
  UserDetailsModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.maidenName,
      required this.age,
      required this.gender,
      required this.email,
      required this.phone,
      required this.image,
      required this.birthDate,
      required this.bloodGroup,
      required this.height,
      required this.weight});

  factory UserDetailsModel.fromMap(Map<String, dynamic> map) {
    return UserDetailsModel(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      maidenName: map['maidenName'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      image: map['image'] as String,
      birthDate: map['birthDate'] as String,
      bloodGroup: map['bloodGroup'] as String,
      height: map['height'].toDouble() as double,
      weight: map['weight'].toDouble() as double,
    );
  }

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String image;
  final String birthDate;
  final String bloodGroup;
  final double height;
  final double weight;
}
