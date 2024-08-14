import 'package:flutter/material.dart';

mixin HudMixins {
  static showSucess(
    BuildContext context,
  ) {}

  static showFailure(BuildContext context) {}

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

  Future betterResponseDialog(String dialogText, String title, String? subTitle,
      IconData? icon, Color? iconColor, BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text(title)),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor, size: 96.0),
                subTitle != null
                    ? Text.rich(TextSpan(
                        text: "$subTitle\n",
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)))
                    : const SizedBox(),
                Text(dialogText),
              ],
            ),
            actions: [
              Builder(
                  builder: (context) => ElevatedButton(
                      onPressed: () => Navigator.pop(context, "Fechar"),
                      child: const Text("Fechar"))),
            ],
          );
        });
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

  showErrorDialog(BuildContext context,
      {String? title, IconData? icon, String? content}) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // ignore: prefer_if_null_operators
        title: Center(child: Text(title != null ? title : 'Alerta')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              size: 120,
              icon ?? Icons.warning,
              color: Colors.red,
            ),
            Text(content ?? 'Não foi possivel modificar o registro')
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
