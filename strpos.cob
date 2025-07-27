       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRPOS.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-OUT         PIC 9(9) COMP-5.
       01  WS-IN          PIC 9(9) COMP-5.

       LINKAGE SECTION.
       01  LS-STR         PIC X(255).
       01  LS-STR-LEN     PIC 9(9) COMP-5.
       01  LS-SUB         PIC X(255).
       01  LS-SUB-LEN     PIC 9(9) COMP-5.
       01  LS-RETURN      PIC 9(9) COMP-5.

       PROCEDURE DIVISION USING
           LS-STR        LS-STR-LEN
           LS-SUB        LS-SUB-LEN
           LS-RETURN.

           MOVE 0 TO LS-RETURN

           PERFORM VARYING WS-OUT FROM 1 BY 1
                   UNTIL WS-OUT > LS-STR-LEN

               IF LS-STR(WS-OUT:1) = LS-SUB(1:1)
                   MOVE 1 TO WS-IN
                   PERFORM UNTIL
                          WS-IN   > LS-SUB-LEN
                       OR WS-OUT + WS-IN - 1 > LS-STR-LEN

                       IF LS-STR(WS-OUT + WS-IN - 1:1)
                          NOT = LS-SUB(WS-IN:1)
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
