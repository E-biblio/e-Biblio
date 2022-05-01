library globals;
import 'package:flutter/material.dart';

int _currentStep = 0;
final double spacing = 8;
bool check = false;
bool isComplete = false;
String? value;
StepperType stepperType = StepperType.vertical;
final  ville = ['Agadir','Rabat', 'Marrakech', 'Fes', 'Chefchaouen', 'Essaouira', 'Casablanca', 'Tanger' ];




DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(item, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),)
);