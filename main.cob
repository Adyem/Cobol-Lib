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
            END-DISPLAY

            MOVE "   Hello COBOL   " TO WS-STR
            DISPLAY "Before trim: '" WS-STR "'"
            END-DISPLAY
            CALL 'STRTRIM' USING WS-STR
            END-CALL
            DISPLAY "After trim:  '" WS-STR "'"
            END-DISPLAY

            MOVE WS-STR TO WS-STR2

            CALL 'STRLEN' USING WS-STR WS-LEN
            END-CALL
            DISPLAY "Length of trimmed string is " WS-LEN
            END-DISPLAY

            MOVE WS-LEN TO WS-LEN2

            CALL 'STRCMP' USING WS-CMP-RET WS-STR WS-STR2 WS-LEN WS-LEN2
            END-CALL
            DISPLAY "STRCMP result: " WS-CMP-RET
            END-DISPLAY

           STOP RUN.
       END PROGRAM MAIN.
