       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRCMP.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-INDEX           PIC 9(9) COMP-5.

       LINKAGE SECTION.
       01  LS-STRCMP-RETURN        PIC 9(9) COMP-5.
       01  LS-STRCMP-SRC1          PIC X(255).
       01  LS-STRCMP-SRC1-LENGTH   PIC 9(5) COMP-5.
       01  LS-STRCMP-SRC2          PIC X(255).
       01  LS-STRCMP-SRC2-LENGTH   PIC 9(5) COMP-5.

       PROCEDURE DIVISION USING LS-STRCMP-RETURN
       LS-STRCMP-SRC1 LS-STRCMP-SRC2
       LS-STRCMP-SRC1-LENGTH LS-STRCMP-SRC2-LENGTH.
           MOVE 1 TO WS-INDEX
           MOVE 0 TO LS-STRCMP-RETURN

           PERFORM UNTIL WS-INDEX > LS-STRCMP-SRC1-LENGTH OR
               -    WS-INDEX > LS-STRCMP-SRC2-LENGTH 
               IF LS-STRCMP-SRC1(WS-INDEX:1) IS NOT EQUAL TO
                   LS-STRCMP-SRC2(WS-INDEX:1)
                  IF LS-STRCMP-SRC1(WS-INDEX:1) IS LESS THAN
                     LS-STRCMP-SRC2(WS-INDEX:1)
                       MOVE -1 TO LS-STRCMP-RETURN
                  ELSE
                       MOVE 1 TO LS-STRCMP-RETURN
                  END-IF
                  GOBACK
               END-IF
               ADD 1 TO WS-INDEX
           END-PERFORM
            IF LS-STRCMP-SRC1-LENGTH IS GREATER THAN
                LS-STRCMP-SRC2-LENGTH
                MOVE 1 TO LS-STRCMP-RETURN
            ELSE
                IF LS-STRCMP-SRC1-LENGTH IS LESS THAN
                    LS-STRCMP-SRC2-LENGTH
                    MOVE -1 TO LS-STRCMP-RETURN
                ELSE
                    MOVE 0 TO LS-STRCMP-RETURN
                END-IF
            END-IF
            GOBACK.
