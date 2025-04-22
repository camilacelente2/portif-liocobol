       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA16.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO:
      *======= DATA: 04/03/2025
      *======= OBSERVAÇÕES:CALCULO DO FRETE USANDO EVALUATE.
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

       EVALUATE WRK-ESTADO
       WHEN "SP"
           COMPUTE WRK-FRETE = WRK-VALOR * 0,10
       WHEN "RJ"
           COMPUTE WRK-FRETE = WRK-VALOR * 0,15
       WHEN "ES"
           COMPUTE WRK-FRETE = WRK-VALOR * 0,20
       WHEN OTHER
           DISPLAY "NÃO ENTREGAMOS NESTE ESTADO "  WRK-ESTADO
       END-EVALUATE.

       COMPUTE WRK-VALOR = WRK-VALOR + WRK-FRETE.
       MOVE WRK-VALOR TO WRK-VALOR-ED
       MOVE WRK-FRETE TO WRK-FRETE-ED.

       0200-MOSTRA                 SECTION.
       DISPLAY "VALOR FINAL" WRK-VALOR-ED.
       IF  WRK-FRETE GREATER 0
           DISPLAY "FRETE  " WRK-FRETE-ED
       END-IF.

       0300-FINALIZAR              SECTION.
       STOP RUN.
