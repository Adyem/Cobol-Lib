       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRCMP.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-INDEX                PIC 9(9) COMP-5.

       LINKAGE SECTION.
       01  LS-STRCMP-RETURN        PIC S9(9) COMP-5.
       COPY "STRING.cpy" REPLACING
                     ==MY-STRING== BY ==LS-STRCMP-SRC1==
                     ==MY-LEN== BY ==LS-STRCMP-SRC1-LEN==
                     ==MY-BUF== BY ==LS-STRCMP-SRC1-BUF==.
       COPY "STRING.cpy" REPLACING
                     ==MY-STRING== BY ==LS-STRCMP-SRC2==
                     ==MY-LEN== BY ==LS-STRCMP-SRC2-LEN==
                     ==MY-BUF== BY ==LS-STRCMP-SRC2-BUF==.

       PROCEDURE DIVISION USING LS-STRCMP-RETURN
           LS-STRCMP-SRC1 LS-STRCMP-SRC2.
           MOVE 1 TO WS-INDEX
           MOVE 0 TO LS-STRCMP-RETURN

       PERFORM UNTIL WS-INDEX > LS-STRCMP-SRC1-LEN OR
                -    WS-INDEX > LS-STRCMP-SRC2-LEN
               IF LS-STRCMP-SRC1-BUF(WS-INDEX:1) IS NOT EQUAL TO
                   LS-STRCMP-SRC2-BUF(WS-INDEX:1)
                  IF LS-STRCMP-SRC1-BUF(WS-INDEX:1) IS LESS THAN
                     LS-STRCMP-SRC2-BUF(WS-INDEX:1)
                       MOVE -1 TO LS-STRCMP-RETURN
                  ELSE
                       MOVE 1 TO LS-STRCMP-RETURN
                  END-IF
                  GOBACK
               END-IF
               ADD 1 TO WS-INDEX
               END-ADD
           END-PERFORM
       IF LS-STRCMP-SRC1-LEN IS GREATER THAN
                LS-STRCMP-SRC2-LEN
                MOVE 1 TO LS-STRCMP-RETURN
       ELSE
                IF LS-STRCMP-SRC1-LEN IS LESS THAN
                    LS-STRCMP-SRC2-LEN
                    MOVE -1 TO LS-STRCMP-RETURN
                ELSE
                    MOVE 0 TO LS-STRCMP-RETURN
                END-IF
       END-IF
           GOBACK.
