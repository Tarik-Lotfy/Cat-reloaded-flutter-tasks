import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text(
          'Select Your Language',
          style: TextStyle(
           fontWeight: FontWeight.bold,
          ),
        )
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => setState(() => _selectedLanguage = 'en'),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _selectedLanguage == 'en',
                        onChanged: (v) => setState(() => _selectedLanguage = 'en'),
                      ),
                      const Text('English',
                          style: TextStyle(
                              fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => setState(() => _selectedLanguage = 'ar'),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _selectedLanguage == 'ar',
                        onChanged: (v) => setState(() => _selectedLanguage = 'ar'),
                      ),
                      const Text('العربية',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('You can change it later from settings',
                style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 12,
                ),),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: ElevatedButton(
            onPressed: _selectedLanguage != null
            ? () => Navigator.pushNamed(context, 'role')
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontWeight: FontWeight.w500),
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(8),
            ),
            ),
            child: const Text('Continue',
            style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}