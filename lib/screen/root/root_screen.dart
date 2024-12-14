import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            color: themeData.colorScheme.secondary,
            child: const Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 75,
                        child: Row(
                          children: [],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 75,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
