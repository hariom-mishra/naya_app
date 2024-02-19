import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        
        onPressed: null,
        child: CircularProgressIndicator(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          fixedSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
      ),
    );
  }
}
