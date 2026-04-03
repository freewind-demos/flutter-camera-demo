# Flutter 相机与相册（image_picker）

## 简介

使用 **`image_picker`**：从相册选图，在非 Web 平台再提供「拍照」按钮。Web 上通常以相册/文件选择为主，相机能力取决于浏览器与权限。

## 快速开始

### 环境要求

Flutter SDK。真机调试相机、相册最可靠。

### 运行

```bash
flutter pub get
flutter run
```

## 概念讲解

### 第一部分：`ImagePicker` 与 `XFile`

`pickImage(source: ImageSource.gallery | camera)` 返回 `XFile?`。界面展示文件名作最小反馈；若要预览图像可用 `Image.file`（注意平台路径）。

### 第二部分：权限

Android `AndroidManifest.xml` 已声明 `CAMERA`。iOS `Info.plist` 已写入 `NSCameraUsageDescription`、`NSPhotoLibraryUsageDescription`。真机首次调用会弹系统对话框。

## 完整示例

见 `lib/main.dart`：`kIsWeb` 分支与两个 `FilledButton`。

## 注意事项

- 模拟器常无相机硬件，拍照请优先真机。
- 生产应用要处理用户拒绝权限、无可用相机等分支。

## 完整讲解（中文）

选图类需求在 Flutter 里很少自己碰 Intent，**官方插件把各平台差异先抹平一半**。Demo 刻意只做「选完告诉你文件名」，避免把图片解码、裁剪、上传再搅在一起。先把 **权限与 `XFile`** 跑顺，再接到你们的 OSS、压缩、裁剪链，会省很多排查时间。
