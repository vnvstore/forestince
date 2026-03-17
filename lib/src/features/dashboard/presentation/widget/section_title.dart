import 'package:flutter/material.dart';

Widget sectionTitle(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff0F172A),
        ),
  );
}
