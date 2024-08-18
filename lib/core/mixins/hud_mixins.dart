import 'package:flutter/material.dart';

mixin HudMixins {
  static showSucess(
    BuildContext context,
  ) {}

  Future showCustomDialog(BuildContext context,
      {Widget? content, Widget? title, List<Widget>? actions}) async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: content,
              title: title,
              actions: actions,
            ));
  }

  Future<bool?> showConfirmationDialog(
    final BuildContext context,
    final String title,
  ) async {
    final bool? response = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Center(child: Text('Alerta')),
              content: SizedBox(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.warning,
                      size: 120,
                      color: Colors.yellow,
                    ),
                    Text(title)
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red)),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                        )),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ));

    return response;
  }

  showFailure(BuildContext context,
      {String? title, IconData? icon, String? content}) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // ignore: prefer_if_null_operators
        title: Center(child: Text(title != null ? title : 'Aviso')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              size: 120,
              icon ?? Icons.warning,
              color: Colors.red,
            ),
            Text(content ?? 'Oops! algo aconteceu, tente novamente!')
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'))
        ],
      ),
    );
  }
}
