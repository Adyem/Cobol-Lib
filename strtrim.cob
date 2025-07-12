       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRTRIM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01    WS-INDEX            PIC 9(9) COMP-5.
       01    WS-START            PIC 9(9) COMP-5.
       01    WS-END              PIC 9(9) COMP-5.
       01    WS-DEST-INDEX       PIC 9(9) COMP-5.
       01    WS-SPACE            PIC X VALUE ' '.
       01    WS-TAB              PIC X VALUE X'09'.
       01    WS-LF               PIC X VALUE X'0A'.
       01    WS-CR               PIC X VALUE X'0D'.
       01    WS-CHAR             PIC X.

       LINKAGE SECTION.
       01   LS-STRTRIM-SRC       PIC X(255).

       PROCEDURE DIVISION USING LS-STRTRIM-SRC.
           MOVE 1       TO WS-START
           MOVE LENGTH OF LS-STRTRIM-SRC TO WS-END

           PERFORM UNTIL WS-START > WS-END
               MOVE LS-STRTRIM-SRC(WS-START:1) TO WS-CHAR
               IF WS-CHAR = WS-SPACE OR
                  WS-CHAR = WS-TAB OR
                  WS-CHAR = WS-LF OR
                  WS-CHAR = WS-CR
                   ADD 1 TO WS-START
               ELSE
                   EXIT PERFORM
               END-IF
           END-PERFORM

           PERFORM UNTIL WS-END < WS-START
               MOVE LS-STRTRIM-SRC(WS-END:1) TO WS-CHAR
               IF WS-CHAR = WS-SPACE OR
                  WS-CHAR = WS-TAB OR
                  WS-CHAR = WS-LF OR
                  WS-CHAR = WS-CR
                   SUBTRACT 1 FROM WS-END
               ELSE
                   EXIT PERFORM
               END-IF
           END-PERFORM

           MOVE 1 TO WS-DEST-INDEX
           MOVE WS-START TO WS-INDEX
           PERFORM UNTIL WS-INDEX > WS-END
               MOVE LS-STRTRIM-SRC(WS-INDEX:1)
                   TO LS-STRTRIM-SRC(WS-DEST-INDEX:1)
               ADD 1 TO WS-INDEX
               ADD 1 TO WS-DEST-INDEX
           END-PERFORM

           PERFORM UNTIL WS-DEST-INDEX > LENGTH OF LS-STRTRIM-SRC
               MOVE WS-SPACE TO LS-STRTRIM-SRC(WS-DEST-INDEX:1)
               ADD 1 TO WS-DEST-INDEX
           END-PERFORM
           GOBACK.
