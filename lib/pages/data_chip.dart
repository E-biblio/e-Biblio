import 'package:flutter/material.dart';

class OnChip {
  final String label;
  late bool iseclect;
  final Color color;


  OnChip({
    required this.label,
    required this.iseclect,
    required this.color

  });
}

List<OnChip> onChipContent = [
  OnChip(label: 'Horror', iseclect: false, color: Colors.green),
  OnChip(label: 'Mystery', iseclect: true, color: Colors.blue),
  OnChip(label: 'Historical', iseclect: false, color: Colors.grey),
  OnChip(label: 'Action/Adventure', iseclect: false, color: Colors.red),
  OnChip(label: 'Science Fiction', iseclect: false, color: Colors.purple),
  OnChip(label: 'Comic', iseclect: false, color: Colors.brown),
  OnChip(label: 'Romance', iseclect: false, color: Colors.cyan),
  OnChip(label: 'Biographies', iseclect: false, color: Colors.deepPurple),
  OnChip(label: 'Self-Help', iseclect: false, color: Colors.pink),


];