import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyCard extends HookWidget {
  final String shapename;
  final String image;
  final VoidCallback onTap; 

  const MyCard({
    super.key,
    required this.shapename,
    required this.image, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final tapped = useState(false);

    return GestureDetector(
      onTap: () {

        tapped.value = !tapped.value;

        onTap();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[

              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),

                child: Image.asset(
                  image,
                  height: 50,
                  
                ),
              ),

              SizedBox(width: 16.0),

              Text(
                shapename,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}