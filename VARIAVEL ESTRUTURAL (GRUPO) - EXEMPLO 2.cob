       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA06.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO: VARIAVEL ESTRUTURAL (GRUPO) - EXEMPLO 2
      *======= DATA: 15/02/2025
      *======= OBSERVAÇÕES:
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.
       WORKING-STORAGE             SECTION.
       COPY "#bookdat".

       PROCEDURE DIVISION.
       0100-RECEBE                 SECTION.
           DISPLAY "ENTRE COM A LINHA DE DADOS".
           ACCEPT WRK-ENTRADA.
       0200-MOSTRA                 SECTION.
           DISPLAY "CODIGO..."  WRK-CODIGO.
           DISPLAY "NOME....."  WRK-NOME.
           DISPLAY "SALARIO.."  WRK-SALARIO.
       0300-FINALIZAR              SECTION.
       STOP RUN.
