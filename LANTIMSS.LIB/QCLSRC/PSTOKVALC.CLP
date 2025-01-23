/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         PSTOKVALC                         */
/*  APPLICATION ID      -         PSTOKVAL                          */
/*  APPLICATION NAME    -          Theoretical Stock Valuation      */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002 &P003 &P004 &P005 +
                         &P006)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(1) /* RTPARM */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(3) /* PRCOYN */
             DCL        VAR(&P003) TYPE(*CHAR) LEN(3) /* PRFWHS */
             DCL        VAR(&P004) TYPE(*CHAR) LEN(3) /* PRTWHS */
             DCL        VAR(&P005) TYPE(*CHAR) LEN(20) /* PRFITM */
             DCL        VAR(&P006) TYPE(*CHAR) LEN(20) /* PRTITM */
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

                        SBMJOB     CMD(CALL PSTOKVALC  PARM(&P001 &P0+
                        02 &P003 &P004 &P005 &P006)) +
                        INLLIBL(*CURRENT) +
                        JOB(PSTOKVAL )
             GOTO       CMDLBL(END999)
             ENDDO

TAG015: /* START PROCESSING */

/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRPRTF FILE(FILE0001) +
                    TOFILE(*LIBL/PSTOKVALO)

/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(PSTOKVAL) PARM(&P001 &P002 &P0+
                        03 &P004 &P005 &P006)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
