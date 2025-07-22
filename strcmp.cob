       IDENTIFICATION DIVISION.
       FUNCTION‑ID. STRCMP.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       LINKAGE SECTION.
       01  LS‑SRC1‑STR        PIC X(255).
       01  LS‑SRC1‑LEN        PIC 9(5) COMP-5.
       01  LS‑SRC2‑STR        PIC X(255).
       01  LS‑SRC2‑LEN        PIC 9(5) COMP-5.

       PROCEDURE DIVISION
         USING LS‑SRC1‑STR      LS‑SRC1‑LEN
               LS‑SRC2‑STR      LS‑SRC2‑LEN
         RETURNING RETURN-CODE
       LOCAL-STORAGE SECTION.
       01  WS-INDEX            PIC 9(9) COMP-5.

           MOVE 1 TO WS-INDEX
           MOVE 0 TO RETURN-CODE

           PERFORM UNTIL WS-INDEX > LS‑SRC1‑LEN
                            OR WS-INDEX > LS‑SRC2‑LEN
               IF LS‑SRC1‑STR(WS‑INDEX:1)
                    IS NOT EQUAL TO
                  LS‑SRC2‑STR(WS‑INDEX:1)
                  IF LS‑SRC1‑STR(WS‑INDEX:1)
                       IS LESS THAN
                     LS‑SRC2‑STR(WS‑INDEX:1)
                     MOVE -1 TO RETURN-CODE
                  ELSE
                     MOVE 1 TO RETURN-CODE
                  END‑IF
                  GOBACK
               END‑IF
               ADD 1 TO WS-INDEX
           END‑PERFORM

           IF LS‑SRC1‑LEN > LS‑SRC2‑LEN
              MOVE 1 TO RETURN-CODE
           ELSE
             IF LS‑SRC1‑LEN < LS‑SRC2‑LEN
               MOVE -1 TO RETURN-CODE
             ELSE
               MOVE 0 TO RETURN-CODE
             END‑IF
           END‑IF

           GOBACK.
       END FUNCTION STRCMP.
