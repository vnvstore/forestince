import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FacilityScreen extends ConsumerStatefulWidget {
  const FacilityScreen({super.key});

  @override
  ConsumerState<FacilityScreen> createState() => _FacilityScreenState();
}

class _FacilityScreenState extends ConsumerState<FacilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Text('Home Screen'),
    );
  }
}
