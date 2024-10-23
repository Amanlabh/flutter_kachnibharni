import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For handling file I/O
import 'login_signup.dart'; // Importing LoginSignupPage

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage; // File for the profile image
  final ImagePicker _picker = ImagePicker(); // Instance of ImagePicker
  String _bio = "This is a short bio about the user."; // User's bio (replaceable)
  final List<String> _posts = List.generate(5, (index) => "Post ${index + 1} content here."); // Example posts

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery); // Can switch to ImageSource.camera
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path); // Update the profile image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Make the page scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : const NetworkImage('https://via.placeholder.com/150') as ImageProvider,
              ),
              const SizedBox(height: 20),
              const Text('Aman Labh', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('amanlabh4@gmail.com', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              const SizedBox(height: 10),
              Text(_bio, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey[600])),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: _pickImage, child: const Text('Edit Profile Picture')),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                setState(() {
                  _bio = "This is the updated bio of the user."; // Update the bio
                });
              }, child: const Text('Edit Bio')),
              const SizedBox(height: 30),
              const Text('Posts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.article),
                    title: Text(_posts[index]),
                    subtitle: Text("Description of ${_posts[index]}"),
                  );
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const LoginSignupPage())); // Navigate back to Login/Signup page on logout
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}