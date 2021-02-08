Stefano Sanchini
Mat. 306439
Titolo del progetto: Applicativo per la gestione del Reparto Printing Apra CS

# apra_printing

## Introduzione

La scelta del progetto e' nata per necessita' lavorative, poter consultare in maniera veloce e
con la massima portabilita' la gestione del parco macchine (printing) dell'azienda in cui lavoro.
Tutte le macchine presenti vengono fornite al cliente con un contratto Costo Copia, ovvero un canone a
noleggio per la macchina mensile (fisso) con un costo sulla singola pagina stampata. Tutti i contratti
hanno vincolo contrattuale di 48-60 mesi.
Mi serviva quindi un applicativo che mi aiutasse nel tenere sotto controllo le scadenze di ogni
singolo contratto con la relativa scheda della macchina con Serial Number modello e marca e soprattutto
ragione sociale del cliente ad essa collegato.
E' stato scelto questo schema di dati perche' il software che monitorizza il numero delle copie
delle stampanti installate fornisce il file json di ogni singola installazione con questa precisa
struttura.

## Scelte di programmazione e casi d'usi

Come anticipato a fine Introduzione, il software che mi monitorizza il numero di copie stampate da ogni
singola macchina genera automaticamente un file json con al suo interno una lista di oggetti che
chiameremo Printer. Questo perche' ogni elemento della lista fa riferimento ad una singola macchina
installata con dati di Serial Number - univoco per ogni macchina - marca, modello, ragione sociale
del cliente legato alla macchina e le rispettive date di inizio contratto e fine contratto - calcolato
in base ai dati inseriti al momento della creazione tra 48 e 60 mesi - .
All'avvio dell' applicativo ho scelto di mostrare la schermata di caricamento che ho chiamato SplashScreen
Page in cui viene visualizzato un CircularProgressIndicator. Nel caso in cui ci sara' un problema
con il caricamento dei dati l'applicazione rimarra in questa schermata fino al suo sblocco.

![image](/assets/screenshot/splash_screen.PNG)

** Immagine della Splash Screen Page durante il caricamento **

L'elaborazione di tutti i dati viene interamente concentrata nella pagina di AppState.
All'avvio infatti il servizio http (di cui parleremo dopo) si occupa di
prelevare i dati nel file json appositamente posto in un hosting firebase esterno. Ovviamente la scelta
dell'hosting e' stata fatta per rendere piu veloce e semplice lo sviluppo del progetto, in quanto non
rientrava nelle specifiche e perche' il cambio di questo si limita alla sostituzione della stringa
contenente il link del file.
Una volta prelevato i dati dal nostro link effettuo la decodifica del file json in una lista di
tipo <Printer> e, da questa, genero le mie mappe e le mie liste ordinate in base alla necessita'.
All'interno di questa pagina inoltre sviluppo anche la funzione notificaGiornaliera(), che controlla
se la prima nuova data presente tra le scadenze coincide con la data di oggi, se la condizione e' vera
verra' inviata una notifica di promemoria.

![image](/assets/screenshot/notifica.PNG)

** Immagine della notifica in alto **

Qui sotto vediamo entrambi gli avvisi presenti nella barra delle notifiche. Ho scelto di visualizzare
due notifiche distinte in quanto sara' importante visualizzare i dati di entrambi i contratti in scadenza
singolarmente. Questo perche' in una singola data possono capitare anche scadenze di clienti diversi.

![image](/assets/screenshot/notifica2.PNG)

** Visualizzazione delle due notifiche nell'apposita' barra **

Questa scelta e' stata fatta per garantire all'utente di tenere sempre un 'promemoria'
nel centro notifiche del telefono. Nel corpo del messaggio infatti sara' presente la ragione sociale
del cliente con i dati della stampante (quindi del contratto) in scadenza oggi.
Finito l'elaborazione di tutti i dati necessari vengo proiettato, tramite la pagina bottom_bar_page
nella mia Home Page. Da qui possiamo muoverci liberamente nelle 3 pagine principali dell' applicativo:
Home Page - Clients - Calendar.

Home Page - qui ho deciso di mostrare le prossime 5 scadende imminenti. Ovviamente ogni
scadenza puo' contenere anche piu' di un contratto potendo creare piu installazioni lo
stesso giorno. Essendo la pagina iniziale ho decido di implementare anche il logo dell'azienda.
Ho deciso di farlo tramite funzione in quanto inizialmente volevo mostrarlo in tutte le pagine ma
poi mi e' sembrato esteticamente piu' gradevole ed ordinato metterlo solo nella Home.

![image](/assets/screenshot/home_page.PNG)

** Home Page **

Clients - e' la pagina in cui mostro le ragioni sociali di tutti i clienti con cui ho almeno
un contratto Printing. in questa pagina ho implementato la barra di ricerca veloce in alto.
Una volta cliccato su uno specifico cliente si entrera' nella sua pagina contenente tutti i suoi contratti.

![image](/assets/screenshot/clients_page.PNG)

** Clients Page **

Calendar - qui viene visualizzato il calendario con tutti gli eventi posizionati per ogni data.
Selezionando il giorno verranno elencati i contratti con scadenza in esso.

![image](/assets/screenshot/calendar_page.PNG)

** Esempio di due contratti in scadenza lo stesso giorno **

Essendo un applicativo utilizzabile in contesto lavorativo, voglio rendere l'esperienza d'uso la piu'
semplice e veloce possibile. Ho implementato inoltre la modalita' Landscape per tutte le pagine (la
pagina Clients non ne ha bisogno essendo presente una ListView che si espande) andando a riprogettare
l'impaginazione nella maniera piu' adeguata ad una visuale orizzontale.

![image](/assets/screenshot/home_landscape.PNG)
![image](/assets/screenshot/calendar_landscape.PNG)

** Qui mostro la Home e la Calendar Pege in Landscape Mode **

## Tecnologia

I pacchetti che ho integrato in aggiunta per lo sviluppo di questo progetto sono i seguenti:

- table_calendar: ^2.3.2 - implementa il widget table calendar per la creazione di un calendario
    e la gestione degli eventi al suo interno
- grouped_list: ^3.7.1 - particolare listview in cui gli elementi vengono raggruppati in sezioni
    definite da specifiche chiavi della lista di elementi
- equatable: ^1.2.5 - libreria che ci permette di confrontare ogni tipologia di oggetti.
- flutter_local_notifications: ^3.0.3 - integra diverse funzioni collegate alle norifiche locali
    permettendo di personalizzarle e organizzarle a piacimento
- http: ^0.12.2 - libreria che permette di effettuare richieste HTTPS, la usiamo per prelevare i
    dati su file json remoto
- flutter_search_bar: ^2.1.0 - implementa la barra di ricerca, la sfruttiamo nella pagina clients
    per filtrare i clienti che vogliamo visualizzare direttamente
