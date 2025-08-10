       IDENTIFICATION DIVISION.
       PROGRAM-ID. FT-NAME.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WS-INPUT-FILE ASSIGN TO 'raw_names.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO 'clean_names.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  WS-INPUT-FILE.
       01  WS-INPUT-RECORD  PIC X(256).

       FD  OUTPUT-FILE.
       01  OUTPUT-RECORD PIC X(256).

       77  IDX           PIC 9(4) COMP.
       77  EOF-SWITCH    PIC X VALUE 'N'.
       77  LEN           PIC 9(4) COMP.
    
       WORKING-STORAGE SECTION.

       LINKAGE SECTION.

       PROCEDURE DIVISION.

           OPEN INPUT  WS-INPUT-FILE
               OUTPUT OUTPUT-FILE

           PERFORM UNTIL EOF-SWITCH = 'Y'
               READ WS-INPUT-FILE
                   AT END MOVE 'Y' TO EOF-SWITCH
                   NOT AT END
                       MOVE WS-INPUT-RECORD TO OUTPUT-RECORD
                       PERFORM PROCESS-NAME
                       WRITE OUTPUT-RECORD
               END-READ
           END-PERFORM
           CLOSE WS-INPUT-FILE OUTPUT-FILE
           GOBACK.

       PROCESS-NAME.
           MOVE FUNCTION LENGTH(OUTPUT-RECORD) TO LEN
           MOVE 1 TO IDX

           PERFORM UNTIL IDX > LEN
               PERFORM UNTIL IDX > LEN OR OUTPUT-RECORD(IDX:1) NOT = ' '
                   ADD 1 TO IDX
               END-PERFORM

               IF IDX <= LEN
                   MOVE FUNCTION UPPER-CASE(OUTPUT-RECORD(IDX:1))
                        TO OUTPUT-RECORD(IDX:1)
                   ADD 1 TO IDX
               END-IF

               PERFORM UNTIL IDX > LEN OR OUTPUT-RECORD(IDX:1) = ' '
                   MOVE FUNCTION LOWER-CASE(OUTPUT-RECORD(IDX:1))
                        TO OUTPUT-RECORD(IDX:1)
                   ADD 1 TO IDX
               END-PERFORM
           END-PERFORM.
