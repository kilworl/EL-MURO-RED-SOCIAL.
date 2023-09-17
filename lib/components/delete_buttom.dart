import 'package:flutter/material.dart';

class DeleteButtom extends StatelessWidget {
  final void Function()? onTap;
  const DeleteButtom({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.cancel,
        color: Colors.grey,
      ),
    );
  }
}
