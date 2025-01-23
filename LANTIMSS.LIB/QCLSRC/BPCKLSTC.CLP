/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         BPCKLSTC                          */
/*  APPLICATION ID      -         BPCKLST                           */
/*  APPLICATION NAME    -            Create picking list file       */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(1) /* RTPARM */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(3) /* PRCOYNO */
             DCL        VAR(&TYPE) TYPE(*CHAR) LEN(1) /* JOB TYPE */
             DCL        VAR(&JOBNBR) TYPE(*CHAR) LEN(6) /* JOB NMBR */

             DCL        VAR(&OUTQ) TYPE(*CHAR) LEN(10) /* OUTPUT QUEUE */
             DCL        VAR(&OUTL) TYPE(*CHAR) LEN(10) /* OUTQ LIBRARY */

             DCL        VAR(&DATE) TYPE(*CHAR) LEN(6)
             DCL        VAR(&YMD) TYPE(*CHAR) LEN(6)
             DCL        VAR(&NYMD) TYPE(*DEC) LEN(6 0)

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

                        SBMJOB     CMD(CALL BPCKLSTC  PARM(&P001 &P00+
                        2)) +
                        INLLIBL(*CURRENT) +
                        JOB(BPCKLST )
             GOTO       CMDLBL(END999)
             ENDDO

TAG015: /* START PROCESSING */

/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDBF FILE(PCKLSDX) +
                    TOFILE(*LIBL/PCKLSD) SHARE(*NO)
             OVRDBF FILE(STOKMOVX) +
                    TOFILE(*LIBL/STOKMOV) SHARE(*NO)

/*********************************************************************/
/* Get System Date And Convert It To Required Format                 */
/*********************************************************************/
             RTVSYSVAL  SYSVAL(QDATE) RTNVAR(&DATE)
             CVTDAT     DATE(&DATE) TOVAR(&YMD) FROMFMT(*SYSVAL) +
                          TOFMT(*YMD) TOSEP(*NONE)
             CHGVAR     VAR(&NYMD) VALUE(&YMD)

/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(BPCKLST) PARM(&P001 &P002 &NYM+
                        D)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
