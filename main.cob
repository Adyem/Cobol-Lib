       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-STR-01        PIC X(25).
       01  WS-LEN-01        PIC 9(9) COMP-5.
       01  WS-CMP-RET       PIC S9(1) COMP-5.
       01  WS-STRLEFT-RET   PIC X(10).
       01  WS-STRLEFT-RET-L PIC 9(9) COMP-5.
       01  WS-STRLEFT-LEN   PIC 9(9) COMP-5.
       01  WS-STR-02        PIC X(25).
       01  WS-LEN-02        PIC 9(9) COMP-5.

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

           DISPLAY " "
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

           DISPLAY " "
           MOVE "Hello world" TO WS-STR-01
           MOVE LENGTH OF WS-STR-01 TO WS-LEN-01
           MOVE LENGTH OF WS-STRLEFT-RET TO WS-STRLEFT-RET-L
           MOVE 5 TO WS-STRLEFT-LEN
           CALL 'STRLEFT' USING
               WS-STR-01
               WS-LEN-01
               WS-STRLEFT-LEN
               WS-STRLEFT-RET
               WS-STRLEFT-RET-L
           DISPLAY "strleft string " WS-STR-01
           DISPLAY WS-STRLEFT-RET

           DISPLAY " "
           MOVE "Hello world" TO WS-STR-01
           MOVE LENGTH OF WS-STR-01 TO WS-LEN-01
           MOVE LENGTH OF WS-STR-01 TO WS-STRLEFT-RET-L
           MOVE 5 TO WS-STRLEFT-LEN
           CALL 'STRRIGHT' USING
               WS-STR-01
               WS-LEN-01
               WS-STRLEFT-LEN
               WS-STRLEFT-RET
               WS-STRLEFT-RET-L
           DISPLAY "strright string " WS-STR-01
           DISPLAY WS-STRLEFT-RET

           MOVE "Hello world" TO WS-STR-01
           MOVE LENGTH OF WS-STR-01 TO WS-LEN-01
           DISPLAY "to upper before: " WS-STR-01 WS-LEN-01
           CALL 'TOUPPER' USING WS-STR-01 WS-LEN-01
           DISPLAY "to upper: " WS-STR-01

           MOVE "HELLO WORLD" TO WS-STR-01
           MOVE LENGTH OF WS-STR-01 TO WS-LEN-01
           DISPLAY " "
           DISPLAY "to lower before: " WS-STR-01 WS-LEN-01
           CALL 'TOLOWER' USING WS-STR-01 WS-LEN-01
           DISPLAY "to lower: " WS-STR-01
           STOP RUN.
       END PROGRAM MAIN.
