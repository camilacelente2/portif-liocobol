       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA04.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO: MOVE (EXEMPLOS)
      *======= DATA: 15/02/2025
      *======= OBSERVAÇÕES:
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.
       WORKING-STORAGE             SECTION.
       77 WRK-VALOR0               PIC X(05)        VALUE ZEROS.
       77 WRK-VALOR1               PIC 9(05)        VALUE ZEROS.
       77 WRK-VALOR2               PIC 9(05)        VALUE ZEROS.
       77 WRK-RESULTADO            PIC S9(05)V99    VALUE ZEROS.
       PROCEDURE DIVISION.
       0100-RECEBE                 SECTION.
       DISPLAY "DIGITE O VALOR 1 "
          ACCEPT WRK-VALOR1.
            MOVE WRK-VALOR1 TO WRK-VALOR0.
       DISPLAY "DIGITE VALOR 2 "
          ACCEPT WRK-VALOR2.
        COMPUTE WRK-RESULTADO = WRK-VALOR1 - WRK-VALOR2.
       0200-MOSTRA                 SECTION.
       DISPLAY "RESULTADO"      WRK-RESULTADO.
       DISPLAY "VALOR 0 - TEXTO" WRK-VALOR0.
       0300-FINALIZAR              SECTION.
       STOP RUN.
