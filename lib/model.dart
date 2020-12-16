import 'package:cloud_firestore/cloud_firestore.dart';
class EducationModel{
  String highestQualification;
  String university;
  String principalSubject;
  String percentageMarks;
  int passingYear;
  EducationModel({this.highestQualification,
    this.university,
    this.principalSubject,
    this.percentageMarks,
    this.passingYear,});

  Map<String, dynamic> toMapEducationInfo() {
    var map = Map<String, dynamic>();
    map["highestQualification"] = highestQualification;
    map["university"] = university;
    map["principalSubject"] = principalSubject;
    map["percentageMarks"] = percentageMarks;
    map["passingYear"] = passingYear;
    return map;
  }

  EducationModel.fromEducationalInfoDocumentSnapshot(
      DocumentSnapshot snapshot) {
    highestQualification = snapshot["highestQualification"];
    university = snapshot["university"];
    principalSubject = snapshot["principalSubject"];
    percentageMarks = snapshot["percentageMarks"];
    passingYear = snapshot["passingYear"];
  }


}

//USE
