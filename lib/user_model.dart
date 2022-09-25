import 'package:flutter/foundation.dart';

class UserModel{
  String? uid;
  String? userName;
  String? email;
  String? password;
  String? userphone;
  String? idCardNumber;
  String? p_phone;

  UserModel({this.uid,this.userName,this.email,this.password,this.userphone,this.idCardNumber,this.p_phone});

  //Receiving Data From Server
  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid: map['uid'],
      userName: map['userName'],
      email: map['email'],
      password: map['password'],
      userphone: map['userphone'],
      idCardNumber: map['idCardNumber'],
      p_phone: map['p_phone'],
    );
  }

  //Sending Data to our Server
  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'userName': userName,
      'email': email,
      'password': password,
      'userphone': userphone,
      'idCardNumber': idCardNumber,
      'p_phone': p_phone,
    };
  }
}