/********************************************************************/
/* END OF CYCLE PROCESSING                                          */
/********************************************************************/
     PGM PARM(&P001)
     DCL VAR(&P001) TYPE(*CHAR) LEN(3)
     DCL VAR(&INT) TYPE(*CHAR) LEN(1) VALUE('I')
     DCL VAR(&TYPE) TYPE(*CHAR) LEN(1)
     DCL VAR(&JOBNBR) TYPE(*CHAR) LEN(6)
     RTVJOBA NBR(&JOBNBR) TYPE(&TYPE)
     IF COND(&TYPE *EQ '0') THEN(GOTO CMDLBL(TAG015))
     SBMJOB CMD(CALL PGM(EOCIPSC) PARM(&P001)) JOB(EOCIPS) -
JOBQ(QGPL/QBATCH) INLLIBL(*CURRENT)
     GOTO CMDLBL(END999)
TAG015:
     CALL PGM(PGRNC) PARM(&INT &P001)
     CALL PGM(PRECVRC) PARM(&INT &P001)
     CALL PGM(PSTOKORDC) PARM(&INT &P001)
     CALL PGM(PPODTALTC) PARM(&INT &P001)
     CALL PGM(IPSEODC) PARM(&INT &P001)
     CLRPFM FILE(WRKPORD)
     CLRPFM FILE(PODTALT)
END999:
     ENDPGM
