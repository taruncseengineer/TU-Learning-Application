import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MenuButtonAppBar extends StatelessWidget {
  const MenuButtonAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      duration: Duration(seconds: 1),
      minDistance: -8,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Drawer(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 50,
                ),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text("About"),
                      onTap: () {
                        print("About");
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.concave,
          color: Colors.grey[350]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuContainer(
            width: 32,
          ),
          SizedBox(
            height: 3,
          ),
          MenuContainer(
            width: 28,
          ),
          SizedBox(
            height: 3,
          ),
          MenuContainer(
            width: 32,
          ),
        ],
      ),
    );
  }
}

class MenuContainer extends StatelessWidget {
  final double width;
  const MenuContainer({
    Key key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: width,
      color: Colors.blue[900],
    );
  }
}
