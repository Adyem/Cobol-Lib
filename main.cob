       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRCMP-MAIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-STR1           PIC X(20) VALUE 'APPLE'.
       01  WS-STR1-LEN       PIC 9(5) COMP-5 VALUE 5.
       01  WS-STR2           PIC X(20) VALUE 'APRICOT'.
       01  WS-STR2-LEN       PIC 9(5) COMP-5 VALUE 7.
       01  WS-CMP-RESULT     PIC S9(9) COMP-5.

       PROCEDURE DIVISION.
       MAIN-PARA.
           COMPUTE WS-CMP-RESULT
               = FUNCTION STRCMP(
                     WS-STR1, WS-STR1-LEN,
                     WS-STR2, WS-STR2-LEN
                 )

           EVALUATE TRUE
               WHEN WS-CMP-RESULT < 0
                   DISPLAY 'Result: ' WS-CMP-RESULT
                   DISPLAY WS-STR1 ' comes before ' WS-STR2
               WHEN WS-CMP-RESULT = 0
                   DISPLAY 'Result: 0 – strings are equal'
               WHEN WS-CMP-RESULT > 0
                   DISPLAY 'Result: ' WS-CMP-RESULT
                   DISPLAY WS-STR1 ' comes after ' WS-STR2
           END-EVALUATE

           STOP RUN.
