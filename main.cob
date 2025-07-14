       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-STR-01    PIC X(25).
       01  WS-LEN-01    PIC 9(3) COMP-5.
       01  WS-CMP-RET   PIC S9(1) COMP-5.
       01  WS-STR-02    PIC X(25).
       01  WS-LEN-02    PIC 9(3) COMP-5.

       PROCEDURE DIVISION.
            DISPLAY "Running Cobol-Lib tests"

            MOVE "   Hello COBOL   " TO WS-STR-01
            DISPLAY "Before trim: '" WS-STR-01 "'"
            CALL 'STRTRIM' USING
               WS-STR-01
            DISPLAY "After trim:  '" WS-STR-01 "'"

            MOVE LENGTH OF WS-STR-01 TO WS-LEN-01
            DISPLAY "Length is " WS-LEN-01
            MOVE LENGTH OF WS-STR-02 TO WS-LEN-02
            DISPLAY "Length is " WS-LEN-02
            MOVE "hello world" TO WS-STR-02
            DISPLAY "str-02 is: " WS-STR-02
            CALL 'STRCMP' USING
               WS-CMP-RET 
               WS-STR-01 
               WS-STR-02 
               WS-LEN-01
               WS-LEN-02
            DISPLAY "STRCMP result: " WS-CMP-RET

            DISPLAY ""
            MOVE "Test 2 " TO WS-STR-01
            MOVE "Hello another world" TO WS-STR-02
            DISPLAY "New test"
            DISPLAY "string 01 " WS-STR-01
            DISPLAY "string 02 " WS-STR-02
            CALL 'STRCMP' USING
               WS-CMP-RET
               WS-STR-01
               WS-STR-02
               WS-LEN-01
               WS-LEN-02
            DISPLAY "STRCMP result 02: " WS-CMP-RET

           STOP RUN.
       END PROGRAM MAIN.
