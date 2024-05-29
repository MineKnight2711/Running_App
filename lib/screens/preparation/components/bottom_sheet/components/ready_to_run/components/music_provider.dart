import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthorizeMusicProvider extends StatelessWidget {
  final List<String> musicProviders = const [
    'spotify',
    'applemusic',
    'nhaccuatui'
  ];

  const AuthorizeMusicProvider({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedMusicProvider = "".obs;
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Obx(
                () => MusicProviderOption(
                  selectedProvider: selectedMusicProvider.value,
                  onSelected: (provider) {
                    selectedMusicProvider.value = provider;
                  },
                  provider: musicProviders[index],
                ),
              ),
            ),
        separatorBuilder: (context, index) => const Divider(
              thickness: 0.5,
              height: 5,
            ),
        itemCount: musicProviders.length);
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
            SizedBox(
                width: 40.w,
                height: 40.w,
                child: SvgPicture.asset(
                    "assets/svg/music_provider/$provider.svg")),
            SizedBox(width: 20.w),
            Text(
              provider,
              style: CustomGoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
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
