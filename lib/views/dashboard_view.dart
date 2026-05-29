
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>{
//background and scroll
@override
Widget build(BuildContext context) {
  const Color bgColor = Color(0xFFF7F2E9);
  return Scaffold(
    backgroundColor: bgColor,
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //HEADER
    children: [
      const Text(
        'E-Recipe',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFB84715)),
      ),
      CircleAvatar(
        radius: 18,
        backgroundColor: Color(0xFFB84715),
        child: const Icon(Icons.person, size: 20, color: Colors.white),
      ),
    ],
  ),
  const SizedBox(height: 20),
],
        ),
      ),
    ),
  );
}
}