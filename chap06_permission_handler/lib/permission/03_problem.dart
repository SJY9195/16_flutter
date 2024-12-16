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
  bool _isLoading = false;

  // 갤러리에서 이미지를 선택하는 메소드
  Future<void> _pickImageFromGallery() async {
    setState(() {
      _isLoading = true;
    });

    final XFile? pickeredFile =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickeredFile != null) {
      setState(() {
        _images.add(File(pickeredFile.path));
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 카메라에서 이미지 찍는 메소드
  Future<void> _pickImageFromCamera() async {
    setState(() {
      _isLoading = true;
    });
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
        _isLoading = false;
      });
    }
  }

  // 이미지를 삭제할 때 확인 다이얼로그 메소드
  void _showDeleteDialog(File image) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("이미지 삭제"),
            content: Text("정말로 이 이미지를 삭제 하시겠습니까?"),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      _images.remove(image);
                    });
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("삭제")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("취소"))
            ],
          );
        });
  }

  // 미리보기 다이얼로그
  void _showDialog(File image) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("미리보기"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(image),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      _showDeleteDialog(image);
                    },
                    child: Text("이미지 삭제"))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isLoading
              ? CircularProgressIndicator()
              : _images.isEmpty
              ? Text("사진을 선택하세요")
              : Column(
            children: _images.map((image) {
              return GestureDetector(
                onTap: () => _showDialog(image),
                child: Image.file(
                  image,
                  width: 100,
                  height: 100,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: _pickImageFromGallery, child: Text("갤러리에서 사진 선택")),
          ElevatedButton(
              onPressed: _pickImageFromCamera, child: Text("카메라로 사진 찍기")),
        ],
      ),
    );
  }
}

