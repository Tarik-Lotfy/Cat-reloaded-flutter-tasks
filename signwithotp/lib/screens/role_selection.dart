import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Role'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text('Let us know how you\'ll be using the platform.',
            style: TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: _RoleCard(
                title: 'Designer',
                icon: Icons.palette,
                isSelected: _selectedRole == 'designer',
                onTap: () => setState(() => _selectedRole = 'designer'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _RoleCard(
                title: 'Client',
                icon: Icons.business_center,
                isSelected: _selectedRole == 'client',
                onTap: () => setState(() => _selectedRole = 'client'),
              ),
            ),
          ],
        ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _selectedRole != null
                        ? () => Navigator.pushNamed(context, 'signup')
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
              ),
            ],
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 240, // Fixed height for square cards
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withAlpha(7) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 40,
                      color: isSelected ? Colors.blue : Colors.grey),
                  const SizedBox(height: 10),
                  Text(title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.blue : Colors.black,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}