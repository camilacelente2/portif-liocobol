      ******************************************************************
      * Author: Camila Eggert
      * Date: 19/02/2025.
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
        IDENTIFICATION DIVISION.
       PROGRAM-ID. CONVERSAO-DOLAR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-VALOR-DOLAR      PIC 9(3)V9(2).
       01 WS-QUANTIDADE-DOLAR PIC 9(3)V9(2).
       01 WS-VALOR-REAL       PIC 9(5)V9(2).
       01 WS-VALOR-REAL-FMT   PIC ZZZ9.99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Digite o valor do dolar atual: ".
           ACCEPT WS-VALOR-DOLAR.
           DISPLAY "Digite a quantidade de dolares: ".
           ACCEPT WS-QUANTIDADE-DOLAR.

           COMPUTE WS-VALOR-REAL = WS-VALOR-DOLAR * WS-QUANTIDADE-DOLAR.
           MOVE WS-VALOR-REAL TO WS-VALOR-REAL-FMT.

           DISPLAY "Conversao de " WS-QUANTIDADE-DOLAR " dolares = "
               WS-VALOR-REAL-FMT " reais".

           STOP RUN.
