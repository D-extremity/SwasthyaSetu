class DoctorDetails {
  final String uid;
  final String age;
  final String address;
  final String email;
  final String photourl;
  final String name;
  final String gender;
  final String bio;
  final String qualification;
  final String password;
  final List specializations;
  final String number;
  final String type;

  DoctorDetails(
      this.uid,
      this.age,
      this.address,
      this.email,
      this.photourl,
      this.name,
      this.gender,
      this.bio,
      this.qualification,
      this.password,
      this.specializations,
      this.number,
      this.type);

  Map<String, dynamic> getDetailsMap() {
    return {
      "uid": uid,
      "age": age,
      "address": address,
      "email": email,
      "photoURL": photourl,
      "name": name,
      "gender": gender,
      "bio": bio,
      "qualification": qualification,
      "password": password,
      "specialization": specializations,
      "type": type,
      "number": number,
      "open":"Nill",
      "close":"Nill"
    };
  }
}

class UserDetails {
  final String uid;
  final String age;
  final String address;
  final String email;
  final String photourl;
  final String name;
  final String gender;
  final String password;
  final String type;
  final String number;

  UserDetails(this.uid, this.age, this.address, this.email, this.photourl,
      this.name, this.gender, this.password, this.type, this.number);

  Map<String, dynamic> getDetailsMap() {
    return {
      "uid": uid,
      "age": age,
      "address": address,
      "email": email,
      "photoURL": photourl,
      "name": name,
      "gender": gender,
      "password": password,
      "type": type,
      "number": number
    };
  }
}
