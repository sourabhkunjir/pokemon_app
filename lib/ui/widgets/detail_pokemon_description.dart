import 'package:flutter/material.dart';

class DetailPokemonDescription extends StatelessWidget {
  const DetailPokemonDescription({
    super.key,
    required this.width,
    required this.title,
    required this.value,
  });

  final double width;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.35,
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text(value,style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
