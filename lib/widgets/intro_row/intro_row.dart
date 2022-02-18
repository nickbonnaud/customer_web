import 'package:flutter/material.dart';

import 'widgets/background.dart';

class IntroRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Background()
        ],
      ),
    );
  }
}