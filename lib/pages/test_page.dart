import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text("Food Recipe App")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                  image: AssetImage("lib/images/pizza.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken)),
            ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Text("Hello Flutter"),
            //   ],
            // ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Welcome To Recipe App",
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "We have the best Food recipe",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(height: 24,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(onPressed:() {
                    
                  }, child: Text("About Us")),
                  SizedBox(width: 12,),
                  FilledButton(onPressed:() {
                    
                  }, child: Text("Get Started"))
                ],)
            ],
          )),
        ],
      ),
    );
  }
}
