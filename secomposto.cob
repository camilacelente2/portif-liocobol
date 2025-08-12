IDENTIFICATION DIVISION.
       PROGRAM-ID. SECOMPOSTO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WRK-N1      PIC 9(02)V99.
           01 WRK-N2      PIC 9(02)V99.
           01 WRK-MEDIA   PIC 9(02)V99.

       PROCEDURE DIVISION.
           DISPLAY "NOTA 1 "
              ACCEPT WRK-N1
           DISPLAY "NOTA 2 "
              ACCEPT WRK-N2

           COMPUTE WRK-MEDIA = (WRK-N1 + WRK-N2) / 2.

           DISPLAY WRK-MEDIA

           IF WRK-MEDIA GREATER THAN OR EQUAL 7
               DISPLAY "APROVADO"

           ELSE
               DISPLAY "NOVA PROVA"
           END-IF.
