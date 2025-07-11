       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRTRIM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01    WS-INDEX    PIC 9(9) COMP-5.
       01    WS-DEST-INDEX       PIC 9(9) COMP-5.
       01    WS-SPACE            PIC X VALUE ' '.
       01    WS-TAB              PIC X VALUE X'09'.
       01    WS-LF               PIC X VALUE X'0A'.
       01    WS-CR               PIC X VALUE X'0D'.
       01    WS-CHAR                PIC X.

       LINKAGE SECTION.
       01   LS-STRTRIM-SRC       PIC X(255).
       01   LS-STRTRIM-DST       PIC X(255).

       PROCEDURE DIVISION USING LS-STRTRIM-SRC LS-STRTRIM-DST.
           MOVE 1       TO WS-INDEX.
           MOVE 1       TO WS-DEST-INDEX.

           PERFORM UNTIL WS-INDEX > LENGTH OF LS-STRTRIM-SRC
               MOVE LS-STRTRIM-SRC(WS-INDEX:1) TO WS-CHAR
               IF WS-CHAR = WS-SPACE OR WS-CHAR = WS-TAB OR WS-CHAR = WS-LF OR
            -  WS-CHAR = WS-CR

           END-IF
           END-PERFORM
           GOBACK.
