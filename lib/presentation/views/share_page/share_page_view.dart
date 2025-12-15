import 'dart:io' show File;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litra_ar_draw_app/domain/entitys/user_entity.dart';
import 'package:litra_ar_draw_app/presentation/services/image_picker_services.dart';
import 'package:litra_ar_draw_app/presentation/view_models/explore_view_model.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/continue_button.dart';
import 'package:litra_ar_draw_app/presentation/widgets/login/custom_input_field.dart';
import 'package:provider/provider.dart' show ReadContext, Consumer;

class SharePageView extends StatefulWidget {
  @override
  State<SharePageView> createState() => _SharePageViewState();
}

class _SharePageViewState extends State<SharePageView> {
  final _titleEditingController = TextEditingController();
  final _contentEditingController = TextEditingController();
  final ImagePickerService _imagePickerService = ImagePickerService();
  File? file;

  @override
  void dispose() {
    _titleEditingController.dispose();
    _contentEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF8),
      body: SafeArea(
          top: false,
          bottom: false,
          child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    context.go('/home');
                  },
                  child: SvgPicture.asset("assets/icons/arrow_back_icon.svg",
                      width: 36,
                      height: 36
                  )
              )
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Share to give more ideas.",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Outfit',
                  fontSize: 24,
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        SizedBox(height: 16,),

        // Resim seçme alanı - tıklanabilir
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: GestureDetector(
            onTap: () => _pickAndShareImage(context),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[400]!, width: 2),
              ),
              child: file != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  file!,
                  fit: BoxFit.cover,
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate, size: 50, color: Colors.grey[600]),
                  SizedBox(height: 8),
                  Text(
                    "Tap to select image",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 24,),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: CustomInputField(
            hint: "Please enter the title of the post here.",
            title: "Title",
            icon: "",
            controller: _titleEditingController,
          ),
        ),

        SizedBox(height: 16,),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: CustomInputField(
            hint: "Please enter the post description here.",
            title: "Description",
            icon: "",
            controller: _contentEditingController,
          ),
        ),

        SizedBox(height: 24,),
        Consumer<ExploreViewModel>(builder: (context, viewModel, child) {
          return Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: ContinueButton(
                title: "Share",
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF50C4ED),
                onPressButton: () async {
                  if (file == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select an image first')),
                    );
                    return;
                  }

                  if (_titleEditingController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a title')),
                    );
                    return;
                  }

                  await viewModel.sharePostWithImage(
                    userId: _titleEditingController.text,
                    content: _contentEditingController.text,
                    imageFile: file!,
                  );
                },
                widthButton: double.infinity,
              )
          );
        })

      ],
    );
  }

  Future<void> _pickAndShareImage(BuildContext context) async {
    // Kullanıcıya seçenek sun: Galeri veya Kamera
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final selectedFile = await _imagePickerService.pickImage();
                  if (selectedFile != null) {
                    setState(() {
                      file = selectedFile;
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final selectedFile = await _imagePickerService.pickImageFromCamera();
                  if (selectedFile != null) {
                    setState(() {
                      file = selectedFile;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}