import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// بيانات الشركة والروابط
const String companyName = 'IZO Future Vision';
const String companySlogan = "Software's & Hardware's Solutions";
const String companyLogoUrl = 'assets/images/logo8.png';
const String mainImageUrl = 'assets/images/imag1.png';

// الألوان
const Color primaryColor = Colors.black;
const Color secondaryColor = Color(0xFFE94E77);
const Color backgroundColor = Color(0xFFF0F0F0);
const Color cardColor = Colors.white;

// الروابط
const String contactUrl = 'https://izomena.com/contact';
const String productsUrl = 'https://izomena.com/products';
const String websiteUrl = 'https://izomena.com/';
const String whatsAppNumber = '+971501770199';
const String locationUrl = 'https://www.google.com/maps/place/IZO+-+FUTURE+VISION+TR+LLC+-+%D8%B1%D8%A4%D9%8A%D8%A9+%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D9%82%D8%A8%D9%84+%D8%B0+%D9%85+%D9%85%E2%80%AD/@25.3383315,55.4081303,17z/data=!3m1!4b1!4m6!3m5!1s0x3e5f590341cf20c7:0x17605e395f34a663!8m2!3d25.3383267!4d55.4055607!16s%2Fg%2F11y2p8wfd0?authuser=0&entry=ttu&g_ep=EgoyMDI1MTAyMi4wIKXMDSoASAFQAw%3D%3D';
const String facebookUrl = 'https://www.facebook.com/izo.mena/';
const String instagramUrl = 'https://www.instagram.com/izo.mena/';
const String tiktokUrl = 'https://www.tiktok.com/@izo.mena?_t=ZS-8zWnYQT4lvM&_r=1';

// دالة لفتح الروابط
Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    print('Could not launch $url');
  }
}

// دالة لفتح الواتساب
Future<void> _launchWhatsApp() async {
  const String url = 'https://wa.me/$whatsAppNumber';
  await _launchUrl(url);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLargeScreen = constraints.maxWidth > 800;

        return Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: isLargeScreen
                    ? _buildLargeScreenLayout(context)
                    : _buildSmallScreenLayout(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLargeScreenLayout(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
          gradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0.4),
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.1),
            const Color(0x00ee6800).withOpacity(0.1),
            const Color(0x00ee6800).withOpacity(0.2),
            const Color(0x00ee6800).withOpacity(0.3),
            const Color(0x00ee6800).withOpacity(0.4),
            const Color(0x00ee6800).withOpacity(0.5),
          ]),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: _buildLeftColumn(context),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 3,
            child: _buildRightColumn(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallScreenLayout(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      decoration: BoxDecoration(
        color: Colors.white,
        // image: const DecorationImage(
        //     image: AssetImage("assets/images/background.jpg")),
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.8),
          Colors.white.withOpacity(0.1),
          const Color(0x00ee6800).withOpacity(0.1),
          const Color(0x00ee6800).withOpacity(0.2),
          const Color(0x00ee6800).withOpacity(0.3),
          const Color(0x00ee6800).withOpacity(0.4),
          const Color(0x00ee6800).withOpacity(0.5),

        ]),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildCircularLogo(context),
          const SizedBox(height: 15),
          const Text(
            companySlogan,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          _buildSocialMediaIcons(context),
          const SizedBox(height: 25),
          //_buildMainImage(),
          const SizedBox(height: 20),
          _buildLinkButtons(context),
        ],
      ),
    );
  }

  Widget _buildLeftColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildCircularLogo(context),
        const SizedBox(height: 20),
        const Text(
          companyName,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          companySlogan,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        _buildSocialMediaIcons(context),
      ],
    );
  }

  Widget _buildRightColumn(BuildContext context) {
    return Column(
      children: [
        //  _buildMainImage(),
        const SizedBox(height: 30),
        _buildLinkButtons(context),
      ],
    );
  }

  Widget _buildLinkButtons(BuildContext context) {
    return Column(
      children: [
        _LinkCard(
          label: 'Website',
          onPressed: () => _launchUrl(websiteUrl),
          context: context,
        ),
        _LinkCard(
          label: 'Product',
          onPressed: () => _launchUrl(productsUrl),
          context: context,
        ),
        _LinkCard(
          label: 'Contact',
          onPressed: () => _launchUrl(contactUrl),
          context: context,
        ),
        _LinkCard(
          label: "Location",
          onPressed: () => _launchUrl(locationUrl),
          context: context,
        ),
      ],
    );
  }

  Widget _buildCircularLogo(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoSize = screenWidth > 800 ? screenWidth * 0.15 : screenWidth * 0.3;

    return Container(
      width: logoSize,
      height: logoSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          companyLogoUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[100],
              child: const Icon(Icons.business, size: 50, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSocialMediaIcons(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth > 800 ? 24.0 : screenWidth * 0.07;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIcon(
            FontAwesomeIcons.whatsapp, _launchWhatsApp, context, iconSize),
        _buildIcon(FontAwesomeIcons.instagram, () => _launchUrl(instagramUrl),
            context, iconSize),
        _buildIcon(FontAwesomeIcons.facebookF, () => _launchUrl(facebookUrl),
            context, iconSize),
        _buildIcon(FontAwesomeIcons.tiktok, () => _launchUrl(tiktokUrl),
            context, iconSize),
      ],
    );
  }

  Widget _buildIcon(IconData icon, VoidCallback onPressed, BuildContext context,
      double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: IconButton(
        icon: FaIcon(icon, color: primaryColor, size: size),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildMainImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        mainImageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Placeholder for Main Image/Video',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LinkCard extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool showIcon;
  final bool isMap;

  const _LinkCard({
    required this.label,
    required this.onPressed,
    this.showIcon = false,
    this.isMap = false,
    Key? key,
    required BuildContext context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Card(
          color: cardColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
