       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA15.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO:
      *======= DATA: 04/03/2025
      *======= OBSERVAÇÕES:CALCULO DE FRETE.
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.

       WORKING-STORAGE             SECTION.

      *=========================== VARIAVEIS DE APOIO.
       77 WRK-PRODUTO              PIC X(30)    VALUE SPACES.
       77 WRK-ESTADO               PIC X(02)    VALUE SPACES.
       77 WRK-VALOR                PIC 9(08)V99 VALUE ZEROS.
       77 WRK-FRETE                PIC 9(08)V99 VALUE ZEROS.

      *=========================== VARIAVEIS DE EDICAO.
       77 WRK-VALOR-ED                PIC ZZ.ZZZ.ZZ9,99.
       77 WRK-FRETE-ED                PIC ZZ.ZZZ.ZZ9,99.

       PROCEDURE DIVISION.
       0100-RECEBE                 SECTION.

       DISPLAY "PRODUTO "
       ACCEPT WRK-PRODUTO
       DISPLAY "VALOR "
       ACCEPT WRK-VALOR.
       DISPLAY "ESTADO (SP/RJ/ES)"
       ACCEPT WRK-ESTADO.

       0150-PROCESSA               SECTION.
       IF WRK-ESTADO EQUAL "SP"
           COMPUTE WRK-FRETE = WRK-VALOR * 0,10
       END-IF.

       IF WRK-ESTADO EQUAL "RJ"
           COMPUTE WRK-FRETE = WRK-VALOR * 0,15
           END-IF.

           IF WRK-ESTADO EQUAL "ES"
           COMPUTE WRK-FRETE = WRK-VALOR * 0,20

       END-IF.

           COMPUTE WRK-VALOR = WRK-VALOR + WRK-FRETE.
           MOVE WRK-VALOR TO WRK-VALOR-ED
           MOVE WRK-FRETE TO WRK-FRETE-ED.

       0200-MOSTRA                 SECTION.

       DISPLAY "VALOR FINAL" WRK-VALOR-ED.
       DISPLAY "FRETE      " WRK-FRETE-ED.

       0300-FINALIZAR              SECTION.
           STOP RUN.
