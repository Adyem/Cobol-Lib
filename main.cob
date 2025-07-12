       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-STR       PIC X(255).
       01  WS-LEN       PIC 9(9) COMP-5.

       PROCEDURE DIVISION.
           DISPLAY "Running Cobol-Lib tests".

           MOVE "   Hello COBOL   " TO WS-STR
           DISPLAY "Before trim: '" WS-STR "'"
           CALL 'STRTRIM' USING WS-STR
           DISPLAY "After trim:  '" WS-STR "'"

           MOVE "Hello" TO WS-STR
           CALL 'STRLEN' USING WS-STR WS-LEN
           DISPLAY "Length of 'Hello' is " WS-LEN

           CALL 'STRCMP' USING WS-STR WS-STR
           DISPLAY "STRCMP called (result unused)"

           STOP RUN.
       END PROGRAM MAIN.
