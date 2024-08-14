class CpfCnpjHelper {
  String formatarCPFouCNPJ(String documento) {
    if (documento.length == 11) {
      // CPF
      return "${documento.substring(0, 3)}.${documento.substring(3, 6)}.${documento.substring(6, 9)}-${documento.substring(9)}";
    } else if (documento.length == 14) {
      // CNPJ
      return "${documento.substring(0, 2)}.${documento.substring(2, 5)}.${documento.substring(5, 8)}/${documento.substring(8, 12)}-${documento.substring(12)}";
    } else {
      return "Documento inválido";
    }
  }
}
