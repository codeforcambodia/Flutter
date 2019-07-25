# uploadimage

This project is learn about how to upload image from your mobile phone to server side and response back data.

It will uses -[MultipartRequest](https://pub.dev/documentation/http/latest/http/MultipartRequest-class.html)

Code below.
Future upLoadImage(File image) async {

  /* Work fine but complicate */
  img.Image imageTemp = img.decodeImage(image.readAsBytesSync());
  img.Image resizedImg = img.copyResize(imageTemp, width: 800);
  var request = new http.MultipartRequest(
    'POST',
    Uri.parse('$_urlPostImage/uploadoc'),
  );
  var multipartFile = new http.MultipartFile.fromBytes(
    'file',
    img.encodeJpg(resizedImg),
    filename: 'resized_image.jpg',
    contentType: MediaType.parse('image/jpeg'),
  );
  request.files.add(multipartFile);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });

  /* Use with dio to upload but not work fine yet */
  Dio dio = Dio();
  String fileName = path.basename(image.path);
  print(image.path);
  print(fileName);
  FormData formData = new FormData.from({
   "file": new UploadFileInfo(image, fileName)
  });
  Response responses = await dio.post("$_urlPostImage/uploadoc", data: formData, options: Options(contentType: ContentType('Content-Type', 'multipart/form-data')));
  print(responses.data);

}

- [Lab: Write your first Flutter app](https://stackoverflow.com/questions/52603614/flutter-resize-image-before-upload?answertab=votes#tab-top)

