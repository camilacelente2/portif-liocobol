      ******************************************************************
      * Author:Camila Eggert
      * Date:19/02/2025
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULO-IMC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PESO            PIC 9(3)V9(2).
       01 WS-ALTURA          PIC 9(1)V9(2).
       01 WS-IMC             PIC 9(2)V9(2).
       01 WS-IMC-FMT         PIC Z9.99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Digite seu peso (KG): ".
           ACCEPT WS-PESO.
           DISPLAY "Digite sua altura (M): ".
           ACCEPT WS-ALTURA.

           COMPUTE WS-IMC = WS-PESO / (WS-ALTURA * WS-ALTURA).
           MOVE WS-IMC TO WS-IMC-FMT.

           DISPLAY "Seu IMC = " WS-IMC-FMT.
           STOP RUN.
