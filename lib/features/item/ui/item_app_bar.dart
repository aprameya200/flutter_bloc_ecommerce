import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/constants.dart';

class ItemAppBar extends StatefulWidget {
  const ItemAppBar({super.key});

  @override
  State<ItemAppBar> createState() => _ItemAppBarState();
}

class _ItemAppBarState extends State<ItemAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Icon(
              Icons.favorite_border_sharp,
              size: 35,
            )
          ],
        ),
      );
  }
}
