import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_english/l10n/app_localizations.dart';
import 'package:nexus_english/src/features/dashboard/domain/booking_controller.dart';
import 'package:nexus_english/src/features/dashboard/domain/facility_controller.dart';

import '../../dashboard/data/model/booking_model.dart';

class AddBookingScreen extends ConsumerStatefulWidget {
  const AddBookingScreen({super.key});

  @override
  ConsumerState<AddBookingScreen> createState() => _AddBookingScreenState();
}

class _AddBookingScreenState extends ConsumerState<AddBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _selectedFacilityId;
  DateTime? _selectedDateTime;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;
    setState(() {
      _selectedDateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedFacilityId == null || _selectedDateTime == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("please fill all fields")));
      return;
    }

    // Construct BookingModel - adjust fields to match your model's constructor
    final booking = BookingModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      facility: _selectedFacilityId!,
      time: DateTime.now().toString(),
      status: BookingStatus.pending,
    );

    // Call notifier to add booking; notifier should update state so dashboard rebuilds
    ref.read(bookingControllerProvider.notifier).addBooking(booking);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.addBooking)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? "Name is required" : null,
              ),
              const SizedBox(height: 12),
              // Facility dropdown fetched from facilityControllerProvider
              ref.watch(facilityControllerProvider).when(
                    data: (facilities) => DropdownButtonFormField<String>(
                      value: _selectedFacilityId,
                      items: facilities
                          .map((f) => DropdownMenuItem(
                                value: f.id,
                                child: Text(f.name),
                              ))
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _selectedFacilityId = val),
                      decoration: InputDecoration(labelText: "Facility"),
                      validator: (v) =>
                          v == null ? "Facility is required" : null,
                    ),
                    loading: () => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: CircularProgressIndicator(),
                    ),
                    error: (_, __) => Text(l10n.errorLoadingFacilities),
                  ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _pickDateTime,
                      child: Text(
                        _selectedDateTime == null
                            ? "Select time"
                            : '${_selectedDateTime!.toLocal()}'
                                .split('.')
                                .first,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text("Save Booking"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
