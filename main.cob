       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-STR       PIC X(255).
       01  WS-LEN       PIC 9(9) COMP-5.
       01  WS-CMP-RET   PIC S9(9) COMP-5.
       01  WS-STR2      PIC X(255).
       01  WS-LEN2      PIC 9(9) COMP-5.

       PROCEDURE DIVISION.
            DISPLAY "Running Cobol-Lib tests"

            MOVE "   Hello COBOL   " TO WS-STR
            DISPLAY "Before trim: '" WS-STR "'"
            CALL 'STRTRIM' USING WS-STR
            END-CALL
            DISPLAY "After trim:  '" WS-STR "'"

            MOVE WS-STR TO WS-STR2
            CALL 'STRCMP' USING WS-CMP-RET WS-STR WS-STR2 WS-LEN WS-LEN2
            END-CALL
            DISPLAY "STRCMP result: " WS-CMP-RET

           STOP RUN.
       END PROGRAM MAIN.
