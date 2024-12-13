import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Problem extends StatefulWidget {
  const Problem({super.key});

  @override
  State<Problem> createState() => _Problem();
}

class _Problem extends State<Problem> {
  List<File> _images = []; // 선택된 이미지 파일을 저장할 리스트
  final ImagePicker _picker = ImagePicker(); // 이미지 선택을 위한 인스턴스

  // 갤러리에서 이미지를 선택하는 메소드
  Future<void> _pickImageFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  // 카메라로 사진을 촬영하는 메소드
  Future<void> _pickImageFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 이미지 리스트 표시
          Expanded(
            child: _images.isEmpty
                ? const Center(
              child: Text(
                "사진을 선택하거나 촬영하세요",
                style: TextStyle(fontSize: 18),
              ),
            )
                : ListView.builder(
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                  },
                  child: Card(
                    child: Image.file(
                      _images[index],
                      width: double.infinity,
                      height: 100,
                    ),
                  ),
                );
              },
            ),
          ),
          // 버튼 영역
          Expanded(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _pickImageFromGallery,
                  child: const Text("갤러리에서 선택"),
                ),
                ElevatedButton(
                  onPressed: _pickImageFromCamera,
                  child: const Text("카메라로 촬영"),
                ),
              ],
            ),
          ),
        ],
      );
  }
}
