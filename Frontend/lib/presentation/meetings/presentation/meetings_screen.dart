import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:flutter/material.dart';

class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({super.key});

  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const GradiantContainer(child: Text("Meetings"));
  }
}