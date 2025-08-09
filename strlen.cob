       IDENTIFICATION DIVISION.
       PROGRAM-ID. GetStringLength.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-INDEX            PIC 9(04) COMP VALUE 0.
       01  WS-CHAR             PIC X.

       LINKAGE SECTION.
       01  LS-STRING.
           05  LS-STRING-LEN PIC 9(4) COMP.
           05  LS-STRING-BUF PIC X(256).

       PROCEDURE DIVISION USING LS-STRING.
           MOVE 0 TO LS-STRING-LEN
           MOVE LENGTH OF LS-STRING-BUF TO WS-INDEX
           PERFORM UNTIL WS-INDEX = 0
               MOVE LS-STRING-BUF(WS-INDEX:1) TO WS-CHAR
               IF WS-CHAR NOT = SPACE
                   MOVE WS-INDEX TO LS-STRING-LEN
                   EXIT PERFORM
               END-IF
               SUBTRACT 1 FROM WS-INDEX
           END-PERFORM

           GOBACK.
