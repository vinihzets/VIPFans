class BasePaths {
  late String localhost;

  BasePaths() {
    localhost = Uri.base.host.isNotEmpty ? Uri.base.host : 'smartlegacy.com.br';
  }

  final baseMap = {
    "dev.smartlegacy.com.br": "api.dev.mycontrol.io",
    "smartlegacy.com.br": "api.v5.mycontrol.io",
    "lysmart.com.br": "api.v5.mycontrol.io",
    "chip.waysis.com.br": "api.v5.mycontrol.io",
  };
}
