import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  static const String adminLayout = 'adminLayout';
  static const String memberLayout = 'memberLayout';
  static const String professionalLayout = 'professionalLayout';

  static const String genderFemale = 'FEMALE';
  static const String genderMale = 'MALE';
  static const String genderOther = 'OTHER';

  final String id;
  final String uid;
  String name;

  final String email;

  final DateTime? created;
  DateTime? updated;
  // When update to 0 run cloud functions logout from all devices
  final int revokeTime;
  final String layout;
  bool linkedWithGoogle;
  bool onBoardingReady;

  String passwordTemp;

  User({
    required this.id,
    required this.uid,
    required this.email,
    this.name = '',
    this.created,
    this.updated,
    this.revokeTime = 0,
    this.layout = memberLayout,
    this.linkedWithGoogle = false,
    this.onBoardingReady = false,
    this.passwordTemp = '',
  });

  String getFullName() {
    return '$name ';
  }

  // Se utiliza solo al crear un usuario, por eso se pasan los valores comunes
  Map<String, dynamic> toMap() => {
        'id': id,
        'uid': uid,
        'email': email,
        'name': name,
        'created': created ?? FieldValue.serverTimestamp(),
        'updated': updated ?? FieldValue.serverTimestamp(),
        'revokeTime': revokeTime,
        'layout': layout,
        'linkedWithGoogle': linkedWithGoogle,
        'onBoardingReady': onBoardingReady,
        'passwordTemp': passwordTemp,
      };

  factory User.fromDocument(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> document =
        documentSnapshot.data() as Map<String, dynamic>;
    return User(
      id: documentSnapshot.id,
      uid: document['uid'],
      email: document['email'],
      name: document['name'],
      created: document['created']?.toDate(),
      updated: document['updated']?.toDate(),
      revokeTime: document['revokeTime'] ?? 0,
      layout: document['layout'] ?? memberLayout,
      linkedWithGoogle: document['linkedWithGoogle'] ?? false,
      onBoardingReady: document['onBoardingReady'] ?? false,
      passwordTemp: document['passwordTemp'] ?? '',
    );
  }
}
