import 'package:flutter/material.dart';

import 'modals/constants.dart';

class Three extends StatefulWidget {
  const Three({Key? key}) : super(key: key);
  @override
  _ThreeState createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Digital Market',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Our Products',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Desired Discounts',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FoodCharacters(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCharacters extends StatefulWidget {
  const FoodCharacters({Key? key}) : super(key: key);

  @override
  _FoodCharactersState createState() => _FoodCharactersState();
}

class _FoodCharactersState extends State<FoodCharacters> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => FoodDetailsScreen(
              character: characters[0],
            ),
            transitionDuration: Duration(milliseconds: 360),
            // pageBuilder: (context) => CharactersDetailsScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: FoodCardBackgroundClipper(),
              child: Hero(
                tag: 'background-${characters[0].name}',
                child: Container(
                  height: 0.55 * screenHeight,
                  width: 0.9 * screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: characters[0].colors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.3),
            child: Hero(
              tag: 'image-{$widget.characters[0].name}',
              child: Image.asset(
                characters[0].imgPath,
                height: screenHeight * 0.55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'name-${characters[0].name}',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Text(
                        characters[0].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Tap to see details',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FoodCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);

    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height + 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}

class FoodDetailsScreen extends StatefulWidget {
  final Character character;

  const FoodDetailsScreen({Key? key, required this.character})
      : super(key: key);
  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'backgound-${widget.character.name}',
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: widget.character.colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft)),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close_rounded),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: 'image-${widget.character.name}',
                      child: Image.asset(
                        widget.character.imgPath,
                        height: screenHeight * 0.45,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Hero(
                      tag: 'name-${widget.character.name}',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(
                            widget.character.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 8, 15),
                    child: Text(
                      widget.character.description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
