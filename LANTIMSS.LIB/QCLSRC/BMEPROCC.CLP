/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         BMEPROCC                          */
/*  APPLICATION ID      -         BMEPROC                           */
/*  APPLICATION NAME    -         Reset Op.Bal. & Mvts at M/E       */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002 &X003)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(1) /* RTPARM */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(3) /* PRCOYN */
             DCL        VAR(&P003) TYPE(*DEC) LEN(8) /* PRDATE */
             DCL        VAR(&X003) TYPE(*DEC) LEN(15 5) /* PRDATE */
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

                        SBMJOB     CMD(CALL BMEPROCC  PARM(&P001 &P00+
                        2 &X003)) +
                        INLLIBL(*CURRENT) +
                        JOB(BMEPROC )
             GOTO       CMDLBL(END999)
             ENDDO

TAG015: /* START PROCESSING */

/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDBF FILE(FILE0001) +
                    TOFILE(*LIBL/STOKMOV7) SHARE(*NO)

             CHGVAR     VAR(&P003) VALUE(&X003)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(END999))
/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(BMEPROC) PARM(&P001 &P002 &P00+
                        3)

             CHGVAR     VAR(&X003) VALUE(&P003)

/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
