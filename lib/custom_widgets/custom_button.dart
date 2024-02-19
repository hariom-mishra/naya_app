import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback voidCallback;
  final String text;

  const CustomButton(
      {super.key, required this.voidCallback, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        
        onPressed: voidCallback,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
      ),
    );
  }
}
