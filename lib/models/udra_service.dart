import 'package:flutter/material.dart';

class UdraService {
  UdraService({required this.name, this.iconData, this.list});
  final String name;
  IconData? iconData;
  List<UdraService>? list;
}

List<UdraService> studentList = [
  UdraService(name: "Student housing"),
  UdraService(name: "Student deporation"),
  UdraService(name: "Student meals"),
  UdraService(name: "Maintenance"),
  UdraService(name: "Student Uniforms"),
  UdraService(name: "Staff deporation"),
  UdraService(name: "Health insurance"),
];
List<UdraService> kidsList = [
UdraService(name: "Kindergarten"),
UdraService(name: "baby-sitter"),
UdraService(name: "Online"),
UdraService(name: "Home services"),
];
List<UdraService> generalList = [
  UdraService(name: "School"),
  UdraService(name: "Institute"),
  UdraService(name: "Training Center"),
  UdraService(name: "Collage"),
  UdraService(name: "University"),
  UdraService(name: "Scholarship"),
  UdraService(name: "Organization"),
  UdraService(name: "Teacher"),
  UdraService(name: "Acadimic Consultant"),
];

List<UdraService> udraServicesList = [
  //UdraService(name: "Learning ", iconData: Icons.menu_book_outlined),
  UdraService(name: "General", iconData: Icons.public, list: generalList),
  UdraService(
      name: "Students ", iconData: Icons.emoji_people_sharp, list: studentList),
  // UdraService(
  //     name: "Institute ", iconData: Icons.integration_instructions_outlined),
  //UdraService(name: "Universities ", iconData: Icons.domain_outlined),
  //UdraService(name: "Events ", iconData: Icons.event_available),
  UdraService(name: "Kids ", iconData: Icons.emoji_emotions_sharp, list: kidsList),
  //UdraService(name: "Scholarship ", iconData: Icons.touch_app_rounded),
  //UdraService(name: "Organization ", iconData: Icons.explicit_rounded),
  //UdraService(name: "Teching ", iconData: Icons.edit_rounded),
  UdraService(name: "UDRA Cloud", iconData: Icons.architecture_rounded),
  UdraService(
      name: "Social\nresponsbility", iconData: Icons.architecture_rounded),
  UdraService(name: "Specialist", iconData: Icons.architecture_rounded),
];

enum ServiceType {
  SCHOOL,
  INSTITUTE,
  UNIVERSITY,
  TRAINGING,
  COLLAGE,
  SHCOLARSHIP,
  ORGANIZATION,
  TEACHER,
  ACADIMIC_CONSULTANT,
  STUDENT_HOUSING,
  MEALS,
  SECURITY,
  MAINTENANCE,
  UNIFORMS,
  DEPORATION,
  HEALTH_INSURANCE,
  COURSE,
  BUSINESS_STARTUP,
  PROJECT,
  CLUB,
  HUB
}
