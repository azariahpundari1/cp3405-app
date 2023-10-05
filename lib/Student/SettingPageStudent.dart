import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<String> getAppVersion() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

class SettingsPageStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Settings Example",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // TODO #11 fix toggle dark theme.
  bool _isDarkModeEnabled = false;
  String _appVersion = ''; // Add this line

  @override
  void initState() {
    super.initState();
    _loadAppVersion(); // Load the app version when the widget is initialized
  }

  _loadAppVersion() async {
    final appVersion = await getAppVersion();
    setState(() {
      _appVersion = appVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    _isDarkModeEnabled = value;
                  });
                },
                initialValue: _isDarkModeEnabled,
                leading: const Icon(Icons.format_paint),
                title: const Text('Enable Dark Mode'),
              ),
              SettingsTile(
                leading: const Icon(Icons.info),
                title: const Text('App Version'),
                trailing: Text(_appVersion),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
