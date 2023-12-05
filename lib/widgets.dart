import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RoundedButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              20.0), // Ajusta el radio según sea necesario
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'CaptainMarvel'),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey,
      elevation: 10.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.center,
          width: 50.0,
          height: 50.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Color de fondo del botón
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black, // Color del icono
            ),
          ),
        ),
      ),
    );
  }
}
