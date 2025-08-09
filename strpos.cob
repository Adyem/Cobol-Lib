       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRPOS.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-OUT         PIC 9(9) COMP-5.
       01  WS-IN          PIC 9(9) COMP-5.

       LINKAGE SECTION.
       COPY STRING REPLACING ==MY-STRING== BY ==LS-STR==
                     ==MY-LEN== BY ==LS-STR-LEN==
                     ==MY-BUF== BY ==LS-STR-BUF==.
       COPY STRING REPLACING ==MY-STRING== BY ==LS-SUB==
                     ==MY-LEN== BY ==LS-SUB-LEN==
                     ==MY-BUF== BY ==LS-SUB-BUF==.
       01  LS-RETURN      PIC 9(9) COMP-5.

       PROCEDURE DIVISION USING
           LS-STR        LS-SUB
           LS-RETURN.

           MOVE 0 TO LS-RETURN

           PERFORM VARYING WS-OUT FROM 1 BY 1
                   UNTIL WS-OUT > LS-STR-LEN

               IF LS-STR-BUF(WS-OUT:1) = LS-SUB-BUF(1:1)
                   MOVE 1 TO WS-IN
                   PERFORM UNTIL
                          WS-IN   > LS-SUB-LEN
                       OR WS-OUT + WS-IN - 1 > LS-STR-LEN

                       IF LS-STR-BUF(WS-OUT + WS-IN - 1:1)
                          NOT = LS-SUB-BUF(WS-IN:1)
                           EXIT PERFORM
                       END-IF

                       ADD 1 TO WS-IN
                   END-PERFORM

                   IF WS-IN > LS-SUB-LEN
                       MOVE WS-OUT TO LS-RETURN
                       GOBACK
                   END-IF
               END-IF
           END-PERFORM

           GOBACK.
