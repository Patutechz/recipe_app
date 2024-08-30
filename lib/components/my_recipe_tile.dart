import 'package:flutter/material.dart';

class MyRecipeTile extends StatelessWidget {
  final Function()? onTap;
  final String recipeImagePath;
  final String recipeName;
  final String recipePrice;
  const MyRecipeTile(
      {super.key,
      required this.recipeImagePath,
      required this.recipeName,
      required this.recipePrice,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25,
        top: 25,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
                          color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    // spreadRadius: 10,
                    offset: Offset(0, 2)),
                // BoxShadow(
                //   color: Colors.grey.shade400,
                //   blurRadius: 20,
                //   // spreadRadius: 10,
                //   offset: Offset(0,6)
                // ),
              ]),
          padding: EdgeInsets.all(8),
          // width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(recipeImagePath),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(
                    //   height: 4,
                    // ),
                    // Text(
                    //   "Beef Pizza for you",
                    //   style: TextStyle(color: Colors.grey[400]),
                    // ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text("\$4.00"),
              //       Container(
              //         padding: EdgeInsets.all(4),
              //         decoration: BoxDecoration(
              //           color: Colors.deepPurple,
              //           borderRadius: BorderRadius.circular(12)
              //         ),
              //         child: Icon(Icons.add),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
