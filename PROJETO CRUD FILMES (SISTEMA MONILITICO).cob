       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILMES.
      *==============================
      *======= AUTOR: CAMILA C. EGGERT   EMPRESA: XPTO
      *======= OBJETIVO: PROJETO CRUD FILMES
      *======= DATA: 23/03/2025
      *======= OBSERVAÇÕES: SISTEMA MONILITICO.
      *==============================

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ARQ-FILMES ASSIGN TO "filmes.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS CODIGO-FILME
           FILE STATUS IS WS-STATUS-FILMES.

       DATA DIVISION.
       FILE SECTION.
       FD  ARQ-FILMES.
       01  FILME-REGISTRO.
       05  CODIGO-FILME        PIC 9(4).
       05  NOME-FILME          PIC X(30).
       05  GENERO-FILME        PIC X(15).
       05  ANO-FILME           PIC 9(4).

       WORKING-STORAGE SECTION.
       01  WS-OPCAO                PIC X.
       01  WS-CONTINUA-CONSULTA    PIC X VALUE 'S'.
       01  WS-CONTADOR             PIC 9(4) VALUE ZERO.
       01  WS-PAGINA               PIC 9(4) VALUE ZERO.
       01  WS-TOTAL-FILMES         PIC 9(4) VALUE ZERO.
       01  WS-CONFIRMA             PIC X.
       01  WS-LINHA                PIC X(80).
       01  WS-EOF-ARQ              PIC X VALUE 'N'.
       01  WS-STATUS               PIC 99 VALUE ZERO.
       01  WS-CONTADOR_REL         PIC 99 VALUE 8.
       01  WS-DUMMY                PIC 9 VALUE 0.
       01 RELATORIO-LINHA.
       05 R-CODIGO-FILME        PIC 9(4).
       05 FILLER                PIC X VALUE SPACE.
       05 R-NOME-FILME          PIC X(30).
       05 FILLER                PIC X VALUE SPACE.
       05 R-GENERO-FILME        PIC X(15).
       05 FILLER                PIC X VALUE SPACE.
       05 R-ANO-FILME           PIC 9(4).
       77 WS-STATUS-FILMES PIC XX VALUE SPACES.


       SCREEN SECTION.
       01  TELA-MENU.
           05 BLANK SCREEN.
           05 LINE 3 COLUMN 10 VALUE 'MENU CRUD FILMES'.
           05 LINE 5 COLUMN 10 VALUE '1 - Incluir Filme'.
           05 LINE 6 COLUMN 10 VALUE '2 - Consultar Filme'.
           05 LINE 7 COLUMN 10 VALUE '3 - Alterar Filme'.
           05 LINE 8 COLUMN 10 VALUE '4 - Excluir Filme'.
           05 LINE 9 COLUMN 10 VALUE '5 - Relatorio de Filmes'.
           05 LINE 10 COLUMN 10 VALUE 'X - Sair'.
           05 LINE 12 COLUMN 10 VALUE 'Opcao: '.
           05 LINE 12 COLUMN 18 PIC X USING WS-OPCAO.

       01  TELA-INCLUIR.
           05 BLANK SCREEN.
           05 LINE 3 COLUMN 10 VALUE '--- INCLUIR FILME ---'.
           05 LINE 5 COLUMN 10 VALUE 'Digite 0 para cancelar.'.
           05 LINE 7 COLUMN 10 VALUE 'Codigo do filme: '.
           05 LINE 7 COLUMN 30 PIC 9(4) USING CODIGO-FILME.
           05 LINE 8 COLUMN 10 VALUE 'Nome do filme: '.
           05 LINE 8 COLUMN 30 PIC X(30) USING NOME-FILME.
           05 LINE 9 COLUMN 10 VALUE 'Genero do filme: '.
           05 LINE 9 COLUMN 30 PIC X(15) USING GENERO-FILME.
           05 LINE 10 COLUMN 10 VALUE 'Ano do filme: '.
           05 LINE 10 COLUMN 30 PIC 9(4) USING ANO-FILME.
           05 LINE 12 COLUMN 10 VALUE 'Confirmar inclusao (S/N)'.
           05 LINE 12 COLUMN 40 PIC X USING WS-CONFIRMA.

       01  TELA-CONSULTAR.
           05 BLANK SCREEN.
           05 LINE 3 COLUMN 10 VALUE '--- CONSULTAR FILME ---'.
           05 LINE 7 COLUMN 10 VALUE 'Digite o codigo do filme: '.
           05 LINE 7 COLUMN 30 PIC 9(4) USING CODIGO-FILME.
           05 LINE 9 COLUMN 10 VALUE 'Nome:   '.
           05 LINE 9 COLUMN 20 PIC X(30) FROM NOME-FILME.
           05 LINE 10 COLUMN 10 VALUE 'Genero: '.
           05 LINE 10 COLUMN 20 PIC X(15) FROM GENERO-FILME.
           05 LINE 11 COLUMN 10 VALUE 'Ano:    '.
           05 LINE 11 COLUMN 20 PIC 9(4) FROM ANO-FILME.
           05 LINE 13 COLUMN 10 VALUE 'Consultar outro (S/N)? '.
           05 LINE 13 COLUMN 35 PIC X USING WS-CONTINUA-CONSULTA.

       01  TELA-ALTERAR.
           05 BLANK SCREEN.
           05 LINE 3 COLUMN 10 VALUE '--- ALTERAR FILME ---'.
           05 LINE 5 COLUMN 10 VALUE 'Digite 0 para cancelar.'.
           05 LINE 7 COLUMN 10 VALUE 'Codigo do filme: '.
           05 LINE 7 COLUMN 30 PIC 9(4) USING CODIGO-FILME.
           05 LINE 8 COLUMN 10 VALUE 'Novo nome: '.
           05 LINE 8 COLUMN 30 PIC X(30) USING NOME-FILME.
           05 LINE 9 COLUMN 10 VALUE 'Novo genero: '.
           05 LINE 9 COLUMN 30 PIC X(15) USING GENERO-FILME.
           05 LINE 10 COLUMN 10 VALUE 'Novo ano: '.
           05 LINE 10 COLUMN 30 PIC 9(4) USING ANO-FILME.
           05 LINE 12 COLUMN 10 VALUE 'Confirmar alteracao (S/N)'.
           05 LINE 12 COLUMN 40 PIC X USING WS-CONFIRMA.

       01  TELA-EXCLUIR.
           05 BLANK SCREEN.
           05 LINE 3 COLUMN 10 VALUE '--- EXCLUIR FILME ---'.
           05 LINE 5 COLUMN 10 VALUE 'Digite 0 para cancelar.'.
           05 LINE 7 COLUMN 10 VALUE 'Codigo do filme: '.
           05 LINE 7 COLUMN 30 PIC 9(4) USING CODIGO-FILME.
           05 LINE 9 COLUMN 10 VALUE 'Confirmar exclusao (S/N)'.
           05 LINE 9 COLUMN 40 PIC X USING WS-CONFIRMA.

       01  TELA-RELATORIO.
       05 BLANK SCREEN.
       05 LINE 3 COLUMN 10 VALUE '--- RELATORIO DE FILMES ---'.
       05 LINE 5 COLUMN 10 VALUE 'Codigo Nome do Filme  Genero Ano'.
       05 LINE 6 COLUMN 10 VALUE '------ -------------------------' .
       05 LINE 7 COLUMN 12 VALUE ' --------------- ----'.
       05 LINE WS-CONTADOR_REL COLUMN 10 PIC 9(4) FROM CODIGO-FILME.
       05 LINE WS-CONTADOR_REL COLUMN 17 PIC X(30) FROM NOME-FILME.
       05 LINE WS-CONTADOR_REL COLUMN 49 PIC X(15) FROM GENERO-FILME.
       05 LINE WS-CONTADOR_REL COLUMN 66 PIC 9(4) FROM ANO-FILME.

       01  RELATORIO-FOOTER.
       05 LINE 22 COLUMN 10 VALUE 'Pressione ENTER para continuar...'.
       05 LINE 23 COLUMN 10 VALUE 'Total de filmes: '.
       05 LINE 23 COLUMN 28 PIC 9(4) FROM WS-TOTAL-FILMES.

       PROCEDURE DIVISION.
       INICIO.
           PERFORM 9000-ABRIR-ARQUIVO.
           MOVE 'S' TO WS-CONTINUA-CONSULTA.
           PERFORM UNTIL WS-OPCAO = 'X' OR WS-OPCAO = 'x'
               PERFORM 9999-EXIBIR-MENU
               EVALUATE WS-OPCAO
                   WHEN '1' PERFORM 1000-INCLUIR-FILME
                   WHEN '2' PERFORM 2000-CONSULTAR-FILME
                   WHEN '3' PERFORM 3000-ALTERAR-FILME
                   WHEN '4' PERFORM 4000-EXCLUIR-FILME
                   WHEN '5' PERFORM 5000-RELATORIO-FILMES
                   WHEN 'X' WHEN 'x' PERFORM 9100-FECHAR-ARQUIVO
                   WHEN OTHER DISPLAY 'Opcao invalida. Tente novamente.'
               END-EVALUATE
           END-PERFORM
           STOP RUN.

       1000-INCLUIR-FILME.
       MOVE ZERO TO CODIGO-FILME
       MOVE SPACES TO NOME-FILME
       MOVE SPACES TO GENERO-FILME
       MOVE ZERO TO ANO-FILME
       MOVE SPACES TO WS-CONFIRMA.

       ACCEPT TELA-INCLUIR

       IF CODIGO-FILME = 0
        DISPLAY 'Inclusao cancelada.' LINE 22
        PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
       ELSE
        IF WS-CONFIRMA = 'S' OR WS-CONFIRMA = 's'
            WRITE FILME-REGISTRO
                INVALID KEY
                    DISPLAY 'Erro ao incluir: Codigo ja existe.' LINE 22
                    PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
                NOT INVALID KEY
                    DISPLAY 'Filme incluido com sucesso.' LINE 22
                    PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
            END-WRITE
        ELSE
            DISPLAY 'Inclusao cancelada.' LINE 22
            PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
        END-IF
       END-IF.

       2000-CONSULTAR-FILME.
           MOVE 'S' TO WS-CONTINUA-CONSULTA.
           PERFORM UNTIL NOT (WS-CONTINUA-CONSULTA = 'S'
                            OR WS-CONTINUA-CONSULTA = 's')
               MOVE SPACES TO FILME-REGISTRO
               ACCEPT TELA-CONSULTAR
               IF CODIGO-FILME = 0
                   DISPLAY 'Consulta cancelada.' LINE 22
                   MOVE 'N' TO WS-CONTINUA-CONSULTA
               ELSE
                   READ ARQ-FILMES
                       INVALID KEY
                           DISPLAY 'Filme nao encontrado.' LINE 22
                       NOT INVALID KEY
                           DISPLAY TELA-CONSULTAR
                   END-READ
                   IF WS-STATUS = 00
                       ACCEPT TELA-CONSULTAR
                   END-IF
               END-IF
           END-PERFORM.
           DISPLAY 'Consulta finalizada.' LINE 22
           DISPLAY 'Retornando ao menu...' LINE 23.


       3000-ALTERAR-FILME.
       MOVE ZERO TO CODIGO-FILME.
       MOVE SPACES TO NOME-FILME.
       MOVE SPACES TO GENERO-FILME.
       MOVE ZERO TO ANO-FILME.
       MOVE SPACE TO WS-CONFIRMA.

       ACCEPT TELA-ALTERAR.
       IF CODIGO-FILME = 0
       DISPLAY 'Alteracao cancelada.' LINE 22
       PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
       MOVE SPACE TO WS-OPCAO
       EXIT PARAGRAPH.

       READ ARQ-FILMES
        INVALID KEY
            DISPLAY 'Filme nao encontrado para alteracao.' LINE 22
            PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
            MOVE SPACE TO WS-OPCAO
            EXIT PARAGRAPH
       END-READ

        ACCEPT TELA-ALTERAR.
       IF NOT (WS-CONFIRMA = 'S' OR WS-CONFIRMA = 's')
        DISPLAY 'Alteracao cancelada.' LINE 22
        PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
        MOVE SPACE TO WS-OPCAO
        EXIT PARAGRAPH.

       REWRITE FILME-REGISTRO
        INVALID KEY
            DISPLAY 'Erro ao alterar o filme.' LINE 22
            PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
            MOVE SPACE TO WS-OPCAO
            EXIT PARAGRAPH.

       DISPLAY 'Filme alterado com sucesso.' LINE 22
       PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
       MOVE SPACE TO WS-OPCAO
       EXIT PARAGRAPH.


       4000-EXCLUIR-FILME.
       MOVE ZERO TO CODIGO-FILME.
       MOVE SPACES TO NOME-FILME.
       MOVE SPACES TO GENERO-FILME.
       MOVE ZERO TO ANO-FILME.
       MOVE SPACE TO WS-CONFIRMA.


       ACCEPT TELA-EXCLUIR.

       IF CODIGO-FILME NOT = 0
        READ ARQ-FILMES
            INVALID KEY
                DISPLAY 'Filme nao encontrado para exclusao.' LINE 22
            NOT INVALID KEY
                IF WS-CONFIRMA = 'S' OR WS-CONFIRMA = 's'
                    DELETE ARQ-FILMES
                        INVALID KEY
                            DISPLAY 'Erro ao excluir o filme.' LINE 22
                        NOT INVALID KEY
                        DISPLAY 'Filme excluido com sucesso.' LINE 22
                    END-DELETE
                ELSE
                    DISPLAY 'Exclusao cancelada.' LINE 22
                END-IF
        END-READ
       ELSE
        DISPLAY 'Exclusao cancelada.' LINE 22
       END-IF.

       PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA.


                  5000-RELATORIO-FILMES.
           MOVE 0 TO WS-TOTAL-FILMES
           MOVE 8 TO WS-CONTADOR_REL
           MOVE 0 TO CODIGO-FILME
           MOVE SPACES TO WS-STATUS-FILMES

           PERFORM 0040-LIMPA-TELA
           DISPLAY TELA-RELATORIO

           START ARQ-FILMES KEY IS >= CODIGO-FILME
               INVALID KEY
                   DISPLAY 'Nenhum filme encontrado.' LINE 22
                   PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
                   EXIT PARAGRAPH
           END-START

           PERFORM UNTIL WS-STATUS-FILMES = "10"
               READ ARQ-FILMES NEXT RECORD
                   AT END
                       MOVE "10" TO WS-STATUS-FILMES
                   NOT AT END
                       ADD 1 TO WS-TOTAL-FILMES

           DISPLAY CODIGO-FILME   LINE WS-CONTADOR_REL COLUMN 10
           DISPLAY NOME-FILME     LINE WS-CONTADOR_REL COLUMN 17
           DISPLAY GENERO-FILME   LINE WS-CONTADOR_REL COLUMN 49
           DISPLAY ANO-FILME      LINE WS-CONTADOR_REL COLUMN 66

                       ADD 1 TO WS-CONTADOR_REL

                       IF WS-CONTADOR_REL > 20
                           PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA
                           PERFORM 0040-LIMPA-TELA
                           DISPLAY TELA-RELATORIO
                           MOVE 8 TO WS-CONTADOR_REL
                       END-IF
               END-READ
           END-PERFORM

           DISPLAY RELATORIO-FOOTER
           PERFORM 0010-PAUSA THRU 0010-FIM-PAUSA.


       9000-ABRIR-ARQUIVO.
           OPEN I-O ARQ-FILMES.
           IF WS-STATUS = 35
               OPEN OUTPUT ARQ-FILMES
               CLOSE ARQ-FILMES
               OPEN I-O ARQ-FILMES
           END-IF.

       9100-FECHAR-ARQUIVO.
           CLOSE ARQ-FILMES.

       0010-PAUSA.
       DISPLAY 'Pressione ENTER para voltar ao menu...' LINE 23
           ACCEPT WS-DUMMY.
       0010-FIM-PAUSA.
           CONTINUE.


       9999-EXIBIR-MENU.
           ACCEPT TELA-MENU.

       0040-LIMPA-TELA.
           DISPLAY SPACE ERASE EOS.
       0040-FIM-LIMPA-TELA.
           EXIT.

       END PROGRAM FILMES.
