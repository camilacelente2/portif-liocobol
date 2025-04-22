       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA21.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO:
      *======= DATA: 03/04/2025
      *======= OBSERVAÇÕES: TESTAR CONSUMO DO MODULO DATAMES.
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.
       WORKING-STORAGE             SECTION.
       77 WRK-DATA PIC X(40).
       PROCEDURE DIVISION .
       0001-PRINCIPAL                  SECTION.
           CALL "DATAMES"     USING   WRK-DATA.
           DISPLAY WRK-DATA.
           STOP RUN.
