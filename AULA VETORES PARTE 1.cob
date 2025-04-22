       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA19.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO:
      *======= DATA: 03/04/2025
      *======= OBSERVAÇÕES: AULA VETORES PARTE 1.
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.
       WORKING-STORAGE             SECTION.
       01  WRK-DATA.
           05  WRK-ANO PIC 9(04).
           05  WRK-MES PIC 9(02).
           05  WRK-DIA PIC 9(02).
       01  WRK-MESES.
           05  WRK-MES-EXT PIC X(09) OCCURS 12 TIMES.
       PROCEDURE DIVISION.
       0001-PRINCIPAL                  SECTION.
           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR.
           STOP RUN.
       0100-INICIALIZAR                SECTION.
       ACCEPT WRK-DATA FROM DATE  YYYYMMDD.
       0200-PROCESSAR                  SECTION.
           PERFORM 0250-MONTAMES
           DISPLAY WRK-DIA " DE " WRK-MES-EXT(WRK-MES) " DE " WRK-ANO.

           0250-MONTAMES              SECTION.
                 MOVE "JANEIRO" TO WRK-MES-EXT(1).
                 MOVE "FEVEREIRO" TO WRK-MES-EXT(2).
                 MOVE "MARCO" TO WRK-MES-EXT(3).
                 MOVE "ABRIL" TO WRK-MES-EXT(4).
                 MOVE "MAIO" TO WRK-MES-EXT(5).
                 MOVE "JUNHO" TO WRK-MES-EXT(6).
                 MOVE "JULHO" TO WRK-MES-EXT(7).
                 MOVE "AGOSTO" TO WRK-MES-EXT(8).
                 MOVE "SETEMBRO" TO WRK-MES-EXT(9).
                 MOVE "OUTUBRO" TO WRK-MES-EXT(10).
                 MOVE "NOVEMBRO" TO WRK-MES-EXT(11).
                 MOVE "DEZEMBRO" TO WRK-MES-EXT(12).
       0300-FINALIZAR                  SECTION.
       STOP RUN.
