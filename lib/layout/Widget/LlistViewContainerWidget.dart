import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ListviewContainer extends StatelessWidget {
  final String name1;
  final String name2;
  final String imgname;
  final Color color;
  final Function onpressed;
  const ListviewContainer({
    Key key,
    this.name1,
    this.name2,
    this.imgname,
    this.color,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Neumorphic(
        margin: EdgeInsets.only(right: 10),
        style: NeumorphicStyle(
          depth: -10,
          //shape: NeumorphicShape.convex,
          //color: Colors.purple[400],
          //color: Colors.grey[300],

          color: color,
          intensity: 0.9,
          // boxShape:
          //     NeumorphicBoxShape.roundRect(BorderRadius.circular(16.0),),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.90,
          width: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imgname),
                      fit: BoxFit.contain,
                    )
                    //color: Colors.black
                    ),
                // child: Icon(Icons.image,color: Colors.black,size: 50,),
              ),
              SizedBox(
                height: 10,
              ),
              NeumorphicText(
                name1,
                style: NeumorphicStyle(
                  color: Colors.black,
                  depth: 9,
                  intensity: 0.5,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              // SizedBox(
              //   height: ,
              // ),
              NeumorphicText(
                name2,
                style: NeumorphicStyle(
                  color: Colors.black,
                  depth: 9,
                  intensity: 0.5,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
