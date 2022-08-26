import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';



void main(){
  runApp(MaterialApp(
    title: "Image Picker",
    home: HomePage(),
    debugShowCheckedModeBanner: true,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    File? _image;

  Future cameraImage() async
  {
    final image =  await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return;

    final temporaryImage= File(image.path);
    setState(() {
      this._image = temporaryImage;
    });
  }

    Future galleryImage() async
    {
      final image =  await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      final temporaryImage= File(image.path);
      setState(() {
        this._image = temporaryImage;
      });
    }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
      title: Text("Image Picker"),
      ),
      body: Column(

        children: <Widget>[
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.lightGreen,
            child: _image == null?Center(child: Text("No data")):Image.file(_image!),
          ),
          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              FloatingActionButton(onPressed: (){cameraImage();}, child: Icon(Icons.camera),),
              SizedBox(width: 30,),
              FloatingActionButton(onPressed: (){galleryImage();}, child: Icon(Icons.image),),
            ],
          ),

        ],
      ),
    );
  }
}
