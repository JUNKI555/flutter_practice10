import 'package:flutter/material.dart';

class Instruction extends Column {
  Instruction(
      BuildContext context, String title, String image, String instruction)
      : super(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: FlatButton(
                color: Colors.black54,
                onPressed: () {
                  Navigator.pushNamed(context, '/test');
                },
                child: Text(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: SizedBox(
                width: 300,
                child: Text(
                  instruction,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        );
}
