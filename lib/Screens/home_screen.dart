import 'package:celebraredemo/Constants/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile  = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Use the picked image, you can process it further as per your requirement
      print('Image picked from gallery: ${pickedFile.path}');
    } else {
      // User canceled the picker
      print('User canceled image picking.');
    }
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        actions: [
          Expanded(child: Container()),
          const Text("Add Image/Icon",style: TextStyle(color: Colors.white,fontSize: 25.0),),
          Expanded(child: Container()),
        ],
      ),
     ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 110.0,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: AppColors.borderColor
              )
            ),
            child: Column(
              children: [
                const SizedBox(height: 15.0,),
                const Text("Upload Image",style: TextStyle(fontSize: 20.0,color: AppColors.textColor),),
                const SizedBox(height: 15.0,),
                InkWell(
                  onTap: () {
                    _pickImage(context);
                  },
                  child: Container(
                    height: 35.0,
                    width: 175.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.secondaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        "Choose from Device",
                        style: TextStyle(color: AppColors.backgroundColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
   );
  }

}
