class Printer {
  int  idStampante;
  String rag_cliente;
  String marca;
  String modello;
  String serial_number;
  DateTime installazione;
  String media_mono;
  String media_colore;
  DateTime fineContratto;


  Printer ({
    this.idStampante,
    this.rag_cliente,
    this.marca,
    this.modello,
    this.serial_number,
    this.installazione,
    this.media_mono,
    this.media_colore,
    this.fineContratto,
      }
      );

  // TODO: Qui deserializzo i dati del file json
  // factory method puo' essere chiamato come metodo di conversione
  factory Printer.fromJson(Map<String, dynamic> json) {
    return Printer (
        idStampante : json['id'],
        rag_cliente : json['ragione_sociale'],
        marca : json['marca'],
        modello : json['modello'],
        serial_number : json['serial_number'],
        installazione : DateTime.parse(json['installazione']),
        media_mono : json['media_mono'],
        media_colore : json['media_colore'],
        fineContratto : DateTime.parse(json['scadenza'])
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : idStampante,
    'ragione_sociale' : rag_cliente,
    'marca' : marca,
    'modello' : modello,
    'serial_number' : serial_number,
    'installazione' : installazione,
    'media_mono' : media_mono,
    'media_colore' : media_colore,
    'scadenza' : fineContratto
  };


  @override
  List<Object> get props => [ idStampante ];

  @override
  String toString() {
    return rag_cliente;
  }
}

