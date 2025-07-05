import 'package:famka_app/src/data/auth_repository.dart';
import 'package:famka_app/src/data/database_repository.dart';
import 'package:flutter/material.dart';

class OnboardingProgress2 extends StatelessWidget {
  // Attribute
  final DatabaseRepository db;
  final AuthRepository auth;

  // Konstruktor
  const OnboardingProgress2(this.db, this.auth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildClickableIconBox(context, Icons.check, Colors.black),
        _buildClickableIconBox(context, Icons.check, Colors.black),
        _buildIconBox(Icons.check, Colors.white),
        _buildIconBox(Icons.check, Colors.white),
      ],
    );
  }

  Widget _buildClickableIconBox(
      BuildContext context, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () async {
          await auth.signOut(); // Nutzer ausloggen
          // Optional: hier kannst du noch navigieren, falls nötig
          // z.B. Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SomeScreen()));
        },
        child: Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 26),
        ),
      ),
    );
  }

  Widget _buildIconBox(IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 80,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 26),
      ),
    );
  }
}
