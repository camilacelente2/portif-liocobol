IDENTIFICATION DIVISION.
       PROGRAM-ID. SEMULTIESCOLHAS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WRK-PRODUTO      PIC X(30) VALUE SPACES.
           01 WRK-VALOR        PIC 9(05)V99 VALUE ZEROS.
           01 WRK-ESTADO       PIC X(02) VALUE SPACES.
           01 WRK-FRETE        PIC 9(05)V99 VALUE ZEROS.
       PROCEDURE DIVISION.
           DISPLAY "PRODUTO "
              ACCEPT WRK-PRODUTO
           DISPLAY "VALOR "
              ACCEPT WRK-VALOR
           DISPLAY "(ESTADO (RJ/SP/MG)"
              ACCEPT WRK-ESTADO

              MOVE 0 TO WRK-FRETE.

           EVALUATE WRK-ESTADO
              WHEN "SP"
                   COMPUTE WRK-FRETE = WRK-VALOR * 0.10
              WHEN "RJ"
                   COMPUTE WRK-FRETE = WRK-VALOR * 0.15
              WHEN "MG"
                   COMPUTE WRK-FRETE = WRK-VALOR * 0.17


           END-EVALUATE.

           IF WRK-FRETE EQUAL 0
              DISPLAY "NAO ENTREGA"
           ELSE
              DISPLAY "FRETE" WRK-FRETE.

           STOP RUN.
