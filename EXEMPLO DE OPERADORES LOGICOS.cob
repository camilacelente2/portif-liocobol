       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA14.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO:
      *======= DATA: 20/02/2025
      *======= OBSERVAÇÕES:EXEMPLO DE OPERADORES LOGICOS.
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.
       WORKING-STORAGE             SECTION.
       77 WRK-NIVEL                PIC X(05)    VALUE SPACES.
       77 WRK-NOTA1                PIC 9(02)V99 VALUE ZEROS.
       77 WRK-NOTA2                PIC 9(02)V99 VALUE ZEROS.
       77 WRK-MEDIA                PIC 9(02)V99 VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE                 SECTION.
       DISPLAY "NIVEL (FUND/ MEDIO) "
       ACCEPT WRK-NIVEL
       DISPLAY "NOTA 1 "
       ACCEPT WRK-NOTA1
       DISPLAY "NOTA 2 "
       ACCEPT WRK-NOTA2 .

       0150-PROCESSA               SECTION.
       COMPUTE WRK-MEDIA = (WRK-NOTA1 + WRK-NOTA2) / 2.

       0200-MOSTRA                 SECTION.
       DISPLAY 'MEDIA... '
       DISPLAY WRK-MEDIA
       IF WRK-NIVEL (01:04) EQUAL "FUND" AND WRK-MEDIA
           GREATER THAN OR EQUAL 6
                   DISPLAY "APROVADO"
       END-IF.
       IF WRK-NIVEL (01:05) EQUAL "MEDIO" AND WRK-MEDIA
           GREATER  THAN OR EQUAL 7
                   DISPLAY "APROVADO"
       END-IF.

       0300-FINALIZAR              SECTION.
           STOP RUN.
