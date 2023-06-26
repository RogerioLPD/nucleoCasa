// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nucleo/kpadding.dart';

import 'package:nucleo/pages/premios/viagem_item.dart';

class Item extends StatelessWidget {
  final String? photo;
  final String name;
  final String city;
  Item({
    Key? key,
    required this.photo,
    required this.name,
    required this.city,
  }) : super(key: key);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(kPadding),
            height: 180,
            width: 450,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
            child: photo != "" ? Hero(
              tag: "$photo",
              child: CachedNetworkImage(
                imageUrl: photo!,
                fit: BoxFit.contain,
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),

              ),
            ) : Container(),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding / 4),
            child: Text(
              name,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 20),
            ),
          ),
          Text(
            city,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),

        ],
      ),
    );
  }
}
