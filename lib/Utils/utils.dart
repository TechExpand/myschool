import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Utils with ChangeNotifier{

  File selected_image;

var picker  = ImagePicker();

  Future selectimage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    selected_image = File(image.path);
    notifyListeners();
  }
}