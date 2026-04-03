// Flutter 相机 / 相册 — image_picker（真机相机；Web 以相册为主）
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CameraDemoPage());
  }
}

class CameraDemoPage extends StatefulWidget {
  const CameraDemoPage({super.key});

  @override
  State<CameraDemoPage> createState() => _CameraDemoPageState();
}

class _CameraDemoPageState extends State<CameraDemoPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pick(ImageSource source) async {
    final file = await _picker.pickImage(source: source, maxWidth: 800);
    if (!mounted) return;
    setState(() => _image = file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera / gallery')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (kIsWeb)
                const Text(
                  'Web: 通常使用相册；相机能力取决于浏览器与权限。',
                  textAlign: TextAlign.center,
                ),
              if (_image != null) ...[
                const SizedBox(height: 12),
                SelectableText('Picked: ${_image!.name}'),
              ],
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => _pick(ImageSource.gallery),
                child: const Text('从相册选择'),
              ),
              if (!kIsWeb) ...[
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => _pick(ImageSource.camera),
                  child: const Text('拍照'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
