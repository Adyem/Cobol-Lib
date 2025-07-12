       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01  WS-STR       PIC X(255).
        01  WS-LEN       PIC 9(9) COMP-5.
        01  WS-CMP-RET   PIC 9(9) COMP-5.

       PROCEDURE DIVISION.
           DISPLAY "Running Cobol-Lib tests".

           MOVE "   Hello COBOL   " TO WS-STR
           DISPLAY "Before trim: '" WS-STR "'"
            CALL 'STRTRIM' USING WS-STR
            DISPLAY "After trim:  '" WS-STR "'"

            CALL 'STRLEN' USING WS-STR WS-LEN
            DISPLAY "Length of trimmed string is " WS-LEN

            CALL 'STRCMP' USING WS-CMP-RET WS-STR WS-STR WS-LEN WS-LEN
            DISPLAY "STRCMP result: " WS-CMP-RET

           STOP RUN.
       END PROGRAM MAIN.
