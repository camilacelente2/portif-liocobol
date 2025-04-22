       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA17.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO: ADAPTAR AS BOAS PRATICAS COM PERFORM.
      *======= DATA: 16/03/2025
      *======= OBSERVAÇÕES:
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.
       WORKING-STORAGE             SECTION.
       77  WRK-NOTA1   PIC 9(02)V99 VALUE ZEROS.
       77  WRK-NOTA2   PIC 9(02)V99 VALUE ZEROS.
       77  WRK-MEDIA   PIC 9(02)V99 VALUE ZEROS.
       PROCEDURE DIVISION.
       0001-PRINCIPAL             SECTION.
           PERFORM 0100-INICIALIZAR
           PERFORM 0200-PROCESSAR
           PERFORM 0300-FINALIZAR
           STOP RUN.

       0100-INICIALIZAR                 SECTION.
           DISPLAY "NOTA 1 "
              ACCEPT WRK-NOTA1
              DISPLAY "NOTA 2 "
                 ACCEPT WRK-NOTA2.

       0200-PROCESSAR                  SECTION.
           COMPUTE WRK-MEDIA  = (WRK-NOTA1 + WRK-NOTA2) / 2.
                DISPLAY 'MEDIA... '
                DISPLAY WRK-MEDIA.

           EVALUATE TRUE
           WHEN WRK-MEDIA GREATER 10
           DISPLAY "ENTRE COM NOTAS CORRETAS"
           WHEN WRK-MEDIA GREATER 6

           DISPLAY "APROVADO"
           WHEN OTHER
           DISPLAY "REPROVADO"
           END-EVALUATE.

       0300-FINALIZAR                SECTION.
              DISPLAY "FIM DE PROGRAMA".
