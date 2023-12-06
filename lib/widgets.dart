import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              20.0.sp), // Ajusta el radio según sea necesario
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 11.sp,
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
      elevation: 10.0.sp,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.only(left: 8.sp),
          alignment: Alignment.center,
          width: 40.0.sp,
          height: 40.0.sp,
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
