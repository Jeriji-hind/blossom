class Usermodel {
  String? uid;
  String? firstname;
  String? lastname;
  String? email;

  Usermodel({this.uid, this.firstname, this.lastname, this.email});

  factory Usermodel.fromMap(map) {
    return Usermodel(
        uid: map['uid'],
        firstname: map['firstname'],
        lastname: map['lastname'],
        email: map['email']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'email': email
    };
  }
}
