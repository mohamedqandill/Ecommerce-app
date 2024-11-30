import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageFunction {
  static Future<File?> cameraPicker() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static Future<File?> galleryPicker() async {
    PermissionStatus status;

    status = await Permission.photos.request();

    if (status.isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      }
    }

    return null;
  }

  static Future<void> saveImagePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('pickedImage', path);
  }

// Function to load the image path
  static Future<String?> loadImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pickedImage');
  }


  }
