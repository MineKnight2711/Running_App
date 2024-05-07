import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        height: 0.7.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
        ),
        padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: musicProviders
              .map((provider) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MusicProviderOption(
                      selectedProvider: _selectedMusicProvider,
                      onSelected: (provider) {
                        _handleMusicProviderChange(provider);
                      },
                      provider: provider,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class MusicProviderOption extends StatelessWidget {
  final String provider, selectedProvider;
  final Function(String) onSelected;
  const MusicProviderOption(
      {super.key,
      required this.provider,
      required this.onSelected,
      required this.selectedProvider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(provider);
      },
      child: SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //   padding: EdgeInsets.all(8.0),
            //   decoration: BoxDecoration(
            //     color: Colors.grey[800],
            //     shape: BoxShape.circle,
            //   ),
            //   child: Icon(Icons.music_note, color: Colors.white),
            // ),
            SizedBox(
                width: 40.w,
                height: 40.w,
                child: SvgPicture.asset(
                    "assets/svg/music_provider/$provider.svg")),
            SizedBox(width: 20.0),
            Text(
              provider,
              style: CustomGoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Radio(
              value: provider,
              groupValue: selectedProvider,
              onChanged: (value) {
                onSelected(value.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
