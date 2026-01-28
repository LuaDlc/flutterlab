import 'package:flutter/material.dart';
import 'package:flutterlab/router/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Builder(
        builder: (context) {
          return ListView(
            children: [
              const DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter Lab',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Playground de estudos Flutter'),
                  ],
                ),
              ),
              _item(
                context,
                icon: Icons.science,
                label: 'Dashboard (Lógica)',
                route: '/',
              ),
              _item(
                context,
                icon: Icons.calculate,
                label: 'Financeiro',
                route: '/numbers',
              ),
              _item(
                context,
                icon: Icons.text_fields,
                label: 'Texto',
                route: '/text',
              ),
              _item(
                context,
                icon: Icons.image,
                label: 'Mídia & Galeria',
                route: '/media',
              ),
              _item(
                context,
                icon: Icons.settings,
                label: 'Configurações',
                route: '/settings',
              ),
              _item(
                context,
                icon: Icons.person,
                label: 'Cadastro',
                route: '/forms',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        AppRouter.router.go(route);
      },
    );
  }
}
