       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY STRING REPLACING ==MY-STRING== BY ==WS-STR-01==
                     ==MY-LEN== BY ==WS-STR-01-LEN==
                     ==MY-BUF== BY ==WS-STR-01-BUF==.
       COPY STRING REPLACING ==MY-STRING== BY ==WS-STRLEFT-RET==
                     ==MY-LEN== BY ==WS-STRLEFT-RET-LEN==
                     ==MY-BUF== BY ==WS-STRLEFT-RET-BUF==.
       COPY STRING REPLACING ==MY-STRING== BY ==WS-STR-02==
                     ==MY-LEN== BY ==WS-STR-02-LEN==
                     ==MY-BUF== BY ==WS-STR-02-BUF==.
       01  WS-CMP-RET       PIC S9(1) COMP-5.
       01  WS-STRLEFT-LEN   PIC 9(9) COMP-5.

       PROCEDURE DIVISION.
           DISPLAY "Running Cobol-Lib tests"
           
           MOVE "   Hello COBOL   " TO WS-STR-01-BUF
           MOVE FUNCTION LENGTH("   Hello COBOL   ") TO WS-STR-01-LEN
           DISPLAY "Before trim: '" WS-STR-01-BUF(1:WS-STR-01-LEN) "'"
           CALL 'STRTRIM' USING
               WS-STR-01
           CALL 'GetStringLength' USING WS-STR-01
           DISPLAY "After trim:  '" WS-STR-01-BUF(1:WS-STR-01-LEN) "'"

           MOVE "hello world" TO WS-STR-02-BUF
           MOVE FUNCTION LENGTH("hello world") TO WS-STR-02-LEN
           CALL 'STRCMP' USING
               WS-CMP-RET
               WS-STR-01
               WS-STR-02
           DISPLAY "STRCMP result: " WS-CMP-RET

           DISPLAY " "
           MOVE "Test 2 " TO WS-STR-01-BUF
           MOVE FUNCTION LENGTH("Test 2 ") TO WS-STR-01-LEN
           MOVE "Hello another world" TO WS-STR-02-BUF
           MOVE FUNCTION LENGTH("Hello another world") TO WS-STR-02-LEN
           DISPLAY "New test"
           DISPLAY "string 01 " WS-STR-01-BUF(1:WS-STR-01-LEN)
           DISPLAY "string 02 " WS-STR-02-BUF(1:WS-STR-02-LEN)
           CALL 'STRCMP' USING
               WS-CMP-RET
               WS-STR-01
               WS-STR-02
           DISPLAY "STRCMP result 02: " WS-CMP-RET

           DISPLAY " "
           MOVE "Hello world" TO WS-STR-01-BUF
           MOVE FUNCTION LENGTH("Hello world") TO WS-STR-01-LEN
           MOVE 5 TO WS-STRLEFT-LEN
           CALL 'STRLEFT' USING
               WS-STR-01
               WS-STRLEFT-LEN
               WS-STRLEFT-RET
           DISPLAY "strleft string " WS-STR-01-BUF(1:WS-STR-01-LEN)
           DISPLAY WS-STRLEFT-RET-BUF(1:WS-STRLEFT-RET-LEN)

           DISPLAY " "
           MOVE "Hello world" TO WS-STR-01-BUF
           MOVE FUNCTION LENGTH("Hello world") TO WS-STR-01-LEN
           MOVE 5 TO WS-STRLEFT-LEN
           CALL 'STRRIGHT' USING
               WS-STR-01
               WS-STRLEFT-LEN
               WS-STRLEFT-RET
           DISPLAY "strright string " WS-STR-01-BUF(1:WS-STR-01-LEN)
           DISPLAY WS-STRLEFT-RET-BUF(1:WS-STRLEFT-RET-LEN)

           MOVE "Hello world" TO WS-STR-01-BUF
           MOVE FUNCTION LENGTH("Hello world") TO WS-STR-01-LEN
           DISPLAY "to upper before: " WS-STR-01-BUF(1:WS-STR-01-LEN)
      -       WS-STR-01-LEN
           CALL 'TOUPPER' USING WS-STR-01
           DISPLAY "to upper: " WS-STR-01-BUF(1:WS-STR-01-LEN)

           MOVE "HELLO WORLD" TO WS-STR-01-BUF
           MOVE FUNCTION LENGTH("HELLO WORLD") TO WS-STR-01-LEN
           DISPLAY " "
           DISPLAY "to lower before: " WS-STR-01-BUF(1:WS-STR-01-LEN)
      -       WS-STR-01-LEN
           CALL 'TOLOWER' USING WS-STR-01
           DISPLAY "to lower: " WS-STR-01-BUF(1:WS-STR-01-LEN)
           STOP RUN.
       END PROGRAM MAIN.
