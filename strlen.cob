       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRLEN.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-LEN     PIC 9(9) COMP-5.
       01  WS-INDEX   PIC 9(9) COMP-5.

       LINKAGE SECTION.
       01  LS-SRC     PIC X(255).
       01  LS-RET     PIC 9(9) COMP-5.

       PROCEDURE DIVISION USING LS-SRC LS-RET.
           MOVE 0          TO WS-LEN
           MOVE 1          TO WS-INDEX

           PERFORM UNTIL WS-INDEX > LENGTH OF LS-SRC
                         OR
                         LS-SRC(WS-INDEX:1) = LOW-VALUES
               ADD 1      TO WS-LEN
               ADD 1      TO WS-INDEX
           END-PERFORM
           MOVE WS-LEN      TO LS-RET
           GOBACK
