
class Printer {
  final int idStampante;
  final String rag_cliente;
  final String marca;
  final String modello;
  final String serial_number;
  final DateTime installazione;
  final int media_mono;
  final int media_colore;
  final DateTime fineContratto;


  Printer (
      this.idStampante,
      this.rag_cliente,
      this.marca,
      this.modello,
      this.serial_number,
      this.installazione,
      this.media_mono,
      this.media_colore,
      this.fineContratto
      );
}