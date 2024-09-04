import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, kToolbarHeight)),
        child: const Text('Close')
    );

  }
}
