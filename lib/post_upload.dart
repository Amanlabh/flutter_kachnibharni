import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import dart:io for File
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler package

class PostUpload extends StatefulWidget {
  const PostUpload({super.key});

  @override
  _PostUploadState createState() => _PostUploadState();
}

class _PostUploadState extends State<PostUpload> {
  XFile? _image; // Selected image
  final ImagePicker _picker = ImagePicker(); // Image picker instance
  String? _text; // Text input

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile; // Update the state with the selected image
    });
  }

  // Function to capture an image from the camera
  Future<void> _takePhoto() async {
    // Request camera permission
    PermissionStatus cameraPermission = await Permission.camera.request();

    if (cameraPermission.isGranted) {
      final capturedFile = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = capturedFile; // Update the state with the captured image
      });
    } else if (cameraPermission.isDenied) {
      // Permission denied, show a dialog or message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Camera permission is required to take a photo.")),
      );
    } else if (cameraPermission.isPermanentlyDenied) {
      // If permission is permanently denied, you can show an alert directing the user to settings.
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the start
          children: [
            // Display selected or captured image
            _image != null
                ? Image.file(File(_image!.path), height: 200)
                : const Text("No image selected"),
            const SizedBox(height: 10),
            // Text field for text input
            TextField(
              decoration: const InputDecoration(
                labelText: "Enter your text here",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _text = value; // Capture text input
              },
            ),
            const SizedBox(height: 10),
            // Button to pick image from gallery
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Pick Image from Gallery"),
            ),
            const SizedBox(height: 10),
            // Button to capture image using camera
            ElevatedButton(
              onPressed: _takePhoto,
              child: const Text("Take Photo"),
            ),
            const SizedBox(height: 10),
            // Button to upload the post
            ElevatedButton(
              onPressed: () {
                // Handle post upload functionality
                if (_image != null && _text != null && _text!.isNotEmpty) {
                  // Add upload functionality here
                  // For now, just print to console
                  print("Uploading Post with Image: ${_image!.path} and Text: $_text");
                } else {
                  // Show error if image or text is not provided
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select an image and enter some text.")),
                  );
                  return;
                }

                // Go back to the previous screen after upload
                Navigator.pop(context);
              },
              child: const Text("Upload Post"),
            ),
          ],
        ),
      ),
    );
  }
}
