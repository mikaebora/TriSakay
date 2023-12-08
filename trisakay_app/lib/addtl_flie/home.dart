import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trisakay_app/addtl_flie/confirmed.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController locationController = TextEditingController();
  TextEditingController anotherController = TextEditingController();
  double totalPrice = 0.0; // Initialize to 0.0

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 600.0,
            height: 140.0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 83, 110),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30), // Set the bottom radius as needed
              ),
            ),
          ),

          // logo
          Positioned(
            top: 25.0, // Adjust the top position as needed
            right: 30.0, // Adjust the right position as needed
            child: Container(
              width: 100.0, // Set the width of the picture
              height: 100.0, // Set the height of the picture
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Set the shape as circle or any other shape
                image: DecorationImage(
                  image: AssetImage('lib/images/Trisakaylogo.png'), // Replace with the actual image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60.0, // Adjust the top position as needed
            left: 45.0, // Adjust the left position as needed
            child: Text(
              'WELCOME TO',
              style: GoogleFonts.poppins(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w700,),
            ),
          ),
          Center(
            child: Text(
              'Text Inside Blue Background',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
          ),
          Positioned(
            top: 150, // Adjust the top position as needed
            left: 30, // Adjust the left position as needed
            child: Text(
              'Set your location',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 200, // Adjust the top position as needed
            left: 16.0, // Adjust the left position as needed
            right: 16.0, // Adjust the right position as needed
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDDDDDD),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: locationController,
                  onChanged: (value) {
                    // Update the total price only if the text field is not empty
                    setState(() {
                      // Add your logic here if needed for the "Set your location" TextField
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Your Current Location',
                    border: InputBorder.none,
                    icon: Icon(Icons.location_pin, color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 21.0, // Adjust the bottom position as needed
            left: 16.0, // Adjust the left position as needed
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDDDDDD),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total Price: \PHP ${totalPrice.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black, ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0, // Adjust the bottom position as needed
            right: 25, // Adjust the right position as needed
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Success()));
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 83, 110), // Change this color to the desired color
            ),
              child: Text('Ride Now!',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),),
            ),
          ),
          Positioned(
            top: 270, // Adjust the top position as needed
            left: 16.0, // Adjust the left position as needed
            right: 16.0, // Adjust the right position as needed
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDDDDDD),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: anotherController,
                  onChanged: (value) {
                    // Update the total price only if the text field is not empty
                    setState(() {
                      totalPrice = value.isEmpty ? 0.0 : 10.0;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Your Destination',
                    border: InputBorder.none,
                    icon: Icon(Icons.location_city, color: Colors.green),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    ),
  );
}
