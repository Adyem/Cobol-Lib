       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-STR-01    PIC X(255).
       01  WS-LEN       PIC 9(9) COMP-5.
       01  WS-CMP-RET   PIC S9(9) COMP-5.
       01  WS-STR-02    PIC X(255).
       01  WS-LEN2      PIC 9(9) COMP-5.

       PROCEDURE DIVISION.
            DISPLAY "Running Cobol-Lib tests"

            MOVE "   Hello COBOL   " TO WS-STR-01
            DISPLAY "Before trim: '" WS-STR-01 "'"
            CALL 'STRTRIM' USING WS-STR-01
            END-CALL
            DISPLAY "After trim:  '" WS-STR-01 "'"

            MOVE WS-STR-01 TO WS-STR-02
            CALL 'STRCMP' USING WS-CMP-RET WS-STR-01 WS-STR-02 WS-LEN
               WS-LEN2
            END-CALL
            DISPLAY "STRCMP result: " WS-CMP-RET

           STOP RUN.
       END PROGRAM MAIN.
