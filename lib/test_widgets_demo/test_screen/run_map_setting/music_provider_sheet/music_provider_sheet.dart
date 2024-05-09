import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'music_provider_option.dart';

class AuthorizeMusicProvider extends StatefulWidget {
  const AuthorizeMusicProvider({super.key});

  @override
  AuthorizeMusicProviderState createState() => AuthorizeMusicProviderState();
}

class AuthorizeMusicProviderState extends State<AuthorizeMusicProvider> {
  late String _selectedMusicProvider;
  List<String> musicProviders = ['spotify', 'applemusic', 'nhaccuatui'];
  @override
  void initState() {
    super.initState();
    _selectedMusicProvider = musicProviders.first;
  }

  void _handleMusicProviderChange(String provider) {
    setState(() {
      _selectedMusicProvider = provider;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 0.85.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Authorize music provider',
                style: CustomGoogleFonts.roboto(
                    fontSize: 16.r, color: Colors.white),
              ),
              const Icon(CupertinoIcons.xmark, color: Colors.white),
            ],
          ),
          ...musicProviders.map(
            (provider) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MusicProviderOption(
                selectedProvider: _selectedMusicProvider,
                onSelected: (provider) {
                  _handleMusicProviderChange(provider);
                },
                provider: provider,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Xử lý khi nhấn nút "Complete"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appButton,
                padding: const EdgeInsets.symmetric(
                  horizontal: 150.0,
                  vertical: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Agree',
                style:
                    CustomGoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
