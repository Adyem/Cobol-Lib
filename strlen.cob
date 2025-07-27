       IDENTIFICATION DIVISION.
       PROGRAM-ID. GetStringLength.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-INDEX            PIC 9(04) COMP VALUE 0.
       01  WS-CHAR             PIC X.

       LINKAGE SECTION.
       01  LS-STRING         PIC X(100).
       01  LS-STRING-LENGTH  PIC 9(04) COMP.

       PROCEDURE DIVISION USING LS-STRING LS-STRING-LENGTH.
           MOVE 100 TO WS-INDEX
           PERFORM UNTIL WS-INDEX = 0
               MOVE LS-STRING(WS-INDEX:1) TO WS-CHAR
               IF WS-CHAR NOT = SPACE
                   MOVE WS-INDEX TO LS-STRING-LENGTH
                   EXIT PERFORM
               END-IF
               SUBTRACT 1 FROM WS-INDEX
           END-PERFORM

           GOBACK.
