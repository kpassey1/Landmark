     /****************************************************************/
     /* Copyright   ** KDP Software Limited **    1996               */
     /****************************************************************/
     /*                                                              */
     /*  PROGRAM ID          -    MNU040C                            */
     /*  APPLICATION ID      -    MNU040                             */
     /*  APPLICATION NAME    -    Check user security                */
     /*  DATE GENERATED      -    Feb 1, 1996                        */
     /*                                                              */
     /****************************************************************/
             PGM        PARM(&P001 &P002 &P003 &P004 &P005+
                        )

             DCL        VAR(&P001) TYPE(*CHAR) LEN(1) /* RTPARM */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(10) /* USPARM */
             DCL        VAR(&P003) TYPE(*CHAR) LEN(10) /* PGPARM */
             DCL        VAR(&P004) TYPE(*CHAR) LEN(1) /* OPPARM */
             DCL        VAR(&P005) TYPE(*CHAR) LEN(1) /* RNPARM */
             DCL        VAR(&TYPE) TYPE(*CHAR) LEN(1) /* JOB TYPE */
             DCL        VAR(&JOBNBR) TYPE(*CHAR) LEN(6) /* JOB NMBR */

             DCL        VAR(&OUTQ) TYPE(*CHAR) LEN(10) /* OUTPUT QUEUE */
             DCL        VAR(&OUTL) TYPE(*CHAR) LEN(10) /* OUTQ LIBRARY */


/********************************************************************/
/* Get current JOB NUMBER, PROCESSING TYPE, OUTPUT QUEUE AND LIBRARY*/
/********************************************************************/
             RTVJOBA    NBR(&JOBNBR) TYPE(&TYPE) OUTQ(&OUTQ) +
                        OUTQLIB(&OUTL)

/********************************************************************/
/* Jump to TAG015 to start processing if this program is in BATCH   */
/* environment (&JOBTYPE = '0')                                     */
/********************************************************************/
             IF         COND(&TYPE *EQ '0') THEN(GOTO CMDLBL(TAG015))

/********************************************************************/
/* First parameter indicate this program should be run interactively*/
/* or in batch. ('B' = Batch else Interactive)                      */
/********************************************************************/
             IF         COND(&P001 *EQ 'B')  THEN(DO)

                        SBMJOB     CMD(CALL MNU040C  PARM(&P001 &P002 +
                         &P003 &P004 &P005)) +
                        JOBQ(QGPL/QBATCH) +
                        INLLIBL(*CURRENT) +
                        JOB(MNU040 )
             GOTO       CMDLBL(END999)
             ENDDO

TAG015: /* START PROCESSING */


/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MNU040) PARM(&P001 &P002 &P003 +
                         &P004 &P005)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
END999: /* END OF JOB */

             ENDPGM
