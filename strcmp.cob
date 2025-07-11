       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRTRIM.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-INDEX           PIC 9(9) COMP-5.

       LINKAGE SECTION.
       01  LS-STRCMP-RETURN   PIC 9(9) COMP-5.
       01  LS-STRCMP-SRC1     PIC X(255).
       01  LS-STRCMP-SRC2     PIC X(255).

       PROCEDURE DIVISION USING LS-STRCMP-SRC1 LS-STRCMP-SRC2.
           MOVE 1 TO WS-INDEX

           PERFORM UNTIL WS-INDEX > FUNCTION LENGTH(LS-STRCMP-SRC1) OR
           -    WS-INDEX > FUNCTION LENGTH(LS-STRCMP-SRC2)
               IF LS-STRCMP-SRC1(WS-INDEX:1) IS NOT EQUAL TO
               -    LS-STRCMP-SRC2(WS-INDEX:1)
                  IF LS-STRCMP-SRC1(WS-INDEX:1) <
                  -   LS-STRCMP-SRC2(WS-INDEX:1)
                       MOVE -1 TO LS-STRCMP-RETURN
                  ELSE
                       MOVE 1 TO LS-STRCMP-RETURN
                  END-IF
                  GOBACK
               END-IF
               ADD 1 TO WS-INDEX
           END-PERFORM
           MOVE 0 TO LS-STRCMP-RETURN
           GOBACK.
