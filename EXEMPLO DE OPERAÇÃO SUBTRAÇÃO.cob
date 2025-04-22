       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA09.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO:
      *======= DATA: 20/02/2025
      *======= OBSERVAÇÕES:EXEMPLO DE OPERAÇÃO SUBTRAÇÃO
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.
       WORKING-STORAGE             SECTION.
       77 WRK-NUM1                 PIC 9(04) VALUE ZEROS.
       77 WRK-NUM2                 PIC 9(04) VALUE ZEROS.
       77 WRK-RESULTADO            PIC S9(05) VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE                 SECTION.
       DISPLAY "DIGITE NUMERO 1 ".
       ACCEPT WRK-NUM1.
       DISPLAY "DIGITE NUMERO 2 ".
       ACCEPT WRK-NUM2.

       0150-PROCESSA               SECTION.
      *---------------------------ADD
      * ADD WRK-NUM1 WRK-NUM2 TO WRK-RESULTADO WRK-RESULTADO2.

      *-------------------------SUBTRACT
       SUBTRACT WRK-NUM1 FROM WRK-NUM2 GIVING WRK-RESULTADO.
      *-------------------------MULTIPLY

      *-------------------------DIVIDE

       0200-MOSTRA                 SECTION.
       DISPLAY "RESULTADO... " WRK-RESULTADO.

       0300-FINALIZAR              SECTION.
       STOP RUN.
