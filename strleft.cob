       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRLEFT.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01   WS-INDEX                PIC 9(9) COMP-5.

       LINKAGE SECTION.
       COPY "STRING.cpy" REPLACING
                     ==MY-STRING== BY ==LS-STRLEFT-STR1==
                     ==MY-LEN== BY ==LS-STRLEFT-STR1-LEN==
                     ==MY-BUF== BY ==LS-STRLEFT-STR1-BUF==.
       COPY "STRING.cpy" REPLACING
                     ==MY-STRING== BY ==LS-STRLEFT-RETURN==
                     ==MY-LEN== BY ==LS-STRLEFT-RETURN-LEN==
                     ==MY-BUF== BY ==LS-STRLEFT-RETURN-BUF==.
       01   LS-STRLEFT-AMOUNT       PIC 9(9) COMP-5.

       PROCEDURE DIVISION USING LS-STRLEFT-STR1 LS-STRLEFT-AMOUNT
           LS-STRLEFT-RETURN.

           MOVE 1 TO WS-INDEX
           MOVE ALL SPACES TO LS-STRLEFT-RETURN-BUF.

           PERFORM UNTIL WS-INDEX > LS-STRLEFT-AMOUNT OR
           -    WS-INDEX > LS-STRLEFT-STR1-LEN
               MOVE LS-STRLEFT-STR1-BUF(WS-INDEX:1) TO
                   LS-STRLEFT-RETURN-BUF(WS-INDEX:1)
               ADD 1 TO WS-INDEX
           END-PERFORM
           MOVE WS-INDEX TO LS-STRLEFT-RETURN-LEN
           SUBTRACT 1 FROM LS-STRLEFT-RETURN-LEN
           GOBACK.
