


import 'package:flutter/material.dart';

class PageModel{
  final String title;
  final String subTitle;
  final Color color;
  final Tween<double> progress;

  PageModel({required this.title, required this.subTitle, required this.color, required this.progress});


  static List<PageModel> pagesDetails = [
    PageModel(
      title: 'Manage your notes easily',
      subTitle: 'A completely easy way to manage and customize your notes.',
      color: Colors.brown.shade300,
      progress: Tween<double>(
        begin: 0,
        end: 0.5,
      ),
    ),
    PageModel(
      title: 'Organize your thougts',
      subTitle: 'Most beautiful note taking application.',
      color: Colors.red,
      progress: Tween<double>(
        begin: 0.5,
        end: 0.75,
      ),
    ),
    PageModel(
      title: 'Create cards and easy styling',
      subTitle: 'Making your content legible has never been easier.',
      color:  Colors.blue,
      progress: Tween<double>(
        begin: 0.75,
        end: 1,
      ),
    ),
  ];

}