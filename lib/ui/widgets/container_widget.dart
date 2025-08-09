import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.image,
    this.isActive = false,
  });

  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),

      width: 103,
      height: 62,
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isActive ? const Color(0xFF34A853) : Colors.grey,
            width: 1.5,
          ),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? const Color(0xFF34A853) : Colors.white,
            spreadRadius: 0,
            blurRadius: isActive ? 4 : 0,

            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: Container(
        width: 45,
        height: 31,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Image.asset(
            image,

            // fit: BoxFit.scaleDown, //image still save natural size
          ),
        ),
      ),
    );
  }
}
