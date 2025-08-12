IDENTIFICATION DIVISION.
       PROGRAM-ID. SECOMPOSTO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WRK-N1      PIC 9(02)V99.
           01 WRK-N2      PIC 9(02)V99.
           01 WRK-MEDIA   PIC 9(02)V99.
           01 WRK-ANO      PIC 9(01).
       PROCEDURE DIVISION.
           DISPLAY "NOTA 1 "
              ACCEPT WRK-N1
           DISPLAY "NOTA 2 "
              ACCEPT WRK-N2

           COMPUTE WRK-MEDIA = (WRK-N1 + WRK-N2) / 2.

           DISPLAY WRK-MEDIA

           IF WRK-MEDIA GREATER THAN OR EQUAL 7
               DISPLAY "ANO EM QUE ESTUDA (1/2/3)"
                  ACCEPT WRK-ANO
                    IF WRK-ANO EQUAL 3
                      DISPLAY "DIPLOMADO"
                    ELSE
                      DISPLAY "APROVADO"
                    END-IF
           ELSE
               DISPLAY "NOVA PROVA"
           END-IF.
