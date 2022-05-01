import 'package:flutter/material.dart';

class Fictif {
  final String title;
  final String type;
  final String name;
  final String exchange;
  final String imageProfil;
  final String imageBook;


  Fictif({
    required this.title,
    required this.type,
    required this.name,
    required this.exchange,
    required this.imageProfil,
    required this.imageBook

  });
}

List<Fictif> onFictif = [
  Fictif(type: 'Self-Help', title: 'The Last Night', name: 'Jean-Luc Reichman', imageProfil: 'assets/avatar5.jpg', exchange: '24 exchange', imageBook: 'assets/litbook.jpg'),
  Fictif(type: 'Self-Help', title: 'Self Life', name: 'Milon Henden', imageProfil: 'assets/avatar5.jpg', exchange: '10 exchange', imageBook: 'assets/yesman.jpeg'),
  Fictif(type: 'Self-Help', title: 'Versus Reality', name: 'Jordi alif', imageProfil: 'assets/avatar5.jpg', exchange: '4 exchange', imageBook: 'assets/alice.jpg'),
  Fictif(type: 'Self-Help', title: 'Spider-Monkey', name: 'Moun liod', imageProfil: 'assets/avatar5.jpg', exchange: '2 exchange', imageBook: 'assets/nadi.jpg'),
  Fictif(type: 'Self-Help', title: 'Your Self', name: 'Fakif Judh', imageProfil: 'assets/avatar5.jpg', exchange: '0 exchange', imageBook: 'assets/litbook.jpg'),
  Fictif(type: 'Biographies', title: 'Kilar bee', name: 'Notey Kidh', imageProfil: 'assets/avatar5.jpg', exchange: '12 exchange', imageBook: 'assets/alice.jpg'),
  Fictif(type: 'Romance', title: 'Two Of Us', name: 'Lodf jzfh', imageProfil: 'assets/avatar5.jpg', exchange: '15 exchange', imageBook: 'assets/litbook.jpg'),
  Fictif(type: 'Horror', title: 'Open Door', name: 'Daof Nibar', imageProfil: 'assets/avatar5.jpg', exchange: '22 exchange', imageBook: 'assets/alice.jpg'),
  Fictif(type: 'Horror', title: 'Dark Side', name: 'Lokfh ajnfb', imageProfil: 'assets/avatar5.jpg', exchange: '33 exchange', imageBook: 'assets/nadi.jpg'),
  Fictif(type: 'Romance', title: 'Life Matter', name: 'Webdh Lidh', imageProfil: 'assets/avatar5.jpg', exchange: '21 exchange', imageBook: 'assets/alice.jpg'),
  Fictif(type: 'Historical', title: 'we are in 1925', name: 'Moufa Nuhf', imageProfil: 'assets/avatar5.jpg', exchange: '10 exchange', imageBook: 'assets/litbook.jpg'),
  Fictif(type: 'Self-Help', title: 'Solo Ride', name: 'Melonch Kidh', imageProfil: 'assets/avatar5.jpg', exchange: '2 exchange', imageBook: 'assets/yesman.jpeg'),



];