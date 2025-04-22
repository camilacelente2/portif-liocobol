       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA02.
      *==============================
      *======= AUTOR: CAMILA     EMPRESA: XPTO
      *======= OBJETIVO: VARIAVEL COM CASA DECIMAL
      *======= DATA: 15/02/2025
      *======= OBSERVAÇÕES:
      *==============================
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA    DIVISION.
       WORKING-STORAGE             SECTION.
       77 WRK-NOME                 PIC X(30)        VALUE SPACES.
       77 WRK-IDADE                PIC 9(03)        VALUE ZEROS.
       77 WRK-SALARIO              PIC 9(08)V99    VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE                 SECTION.
       DISPLAY "DIGITE O SEU NOME"
       ACCEPT WRK-NOME.
       DISPLAY "DIGITE A SUA IDADE"
       ACCEPT WRK-IDADE.
       DISPLAY "DIGITE O SEU SALARIO"
       ACCEPT WRK-SALARIO.
       0200-MOSTRA                 SECTION.
       DISPLAY "NOME DIGITADO " WRK-NOME "IDADE DIGITADA" WRK-IDADE.
       DISPLAY "SALARIO DIGITADO " WRK-SALARIO.
       0300-FINALIZAR              SECTION.
       STOP RUN.
