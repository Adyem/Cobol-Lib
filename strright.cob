       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRRIGHT.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01   WS-INDEX                PIC 9(9) COMP-5.
       01   WS-CHAR-COPIED          PIC 9(9) COMP-5.
       01   WS-RETURN-INDEX         PIC 9(9) COMP-5.

       LINKAGE SECTION.
       01   LS-STRRIGHT-STR1         PIC X(255).
       01   LS-STRRIGHT-STR1-LEN     PIC 9(9) COMP-5.
       01   LS-STRRIGHT-RETURN       PIC X(255).
       01   LS-STRRIGHT-RETURN-LEN   PIC 9(9) COMP-5.
       01   LS-STRRIGHT-AMOUNT       PIC 9(9) COMP-5.

       PROCEDURE DIVISION USING LS-STRRIGHT-STR1 LS-STRRIGHT-STR1-LEN
           LS-STRRIGHT-AMOUNT LS-STRRIGHT-RETURN LS-STRRIGHT-RETURN-LEN.
           MOVE LS-STRRIGHT-RETURN-LEN TO WS-RETURN-INDEX
           MOVE 0 TO WS-CHAR-COPIED
           MOVE LS-STRRIGHT-STR1-LEN TO WS-INDEX
           MOVE ALL SPACES TO
               LS-STRRIGHT-RETURN(1:LS-STRRIGHT-RETURN-LEN)

           PERFORM UNTIL WS-INDEX = 0 OR
                      WS-CHAR-COPIED = LS-STRRIGHT-AMOUNT
               MOVE LS-STRRIGHT-STR1(WS-INDEX:1)
                   TO LS-STRRIGHT-RETURN(WS-RETURN-INDEX:1)
               SUBTRACT 1 FROM WS-INDEX
               SUBTRACT 1 FROM WS-RETURN-INDEX
               ADD 1 TO WS-CHAR-COPIED
           END-PERFORM

           MOVE WS-CHAR-COPIED TO LS-STRRIGHT-RETURN-LEN
           GOBACK.

