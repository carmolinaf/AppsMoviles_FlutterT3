import 'dart:convert';
import 'package:demo_camara/Models/image_model.dart';
import 'package:http/http.dart' as http;

class ImagenServices{

  static const link= "http://257e-190-95-124-31.ngrok.io";
  Future<int> subirImagen(ImageModel img) async {
    var headers ={
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(link+"/api/Fotos/"));
    request.body = json.encode({
      "base64Image": img.base64Image,
      "imagename": img.imagename
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200){
      print(await response.stream.bytesToString());
    }
    else{
      print(response.reasonPhrase);
    }
    return 1;
  }
}