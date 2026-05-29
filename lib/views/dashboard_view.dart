
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>{
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
          children: [], // ← Empty for now
        ),
      ),
    ),
  );
}
}