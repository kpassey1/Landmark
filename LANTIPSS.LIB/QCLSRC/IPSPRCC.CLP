/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         IPSPRCC                           */
/*  APPLICATION ID      -         IPSPRC                            */
/*  APPLICATION NAME    -         Find Price for item               */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002 &P003 &P004 &P005 +
                         &P006 &X007 &X008)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(1) /* RTPARM */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(3) /* PRMCOYNO */
             DCL        VAR(&P003) TYPE(*CHAR) LEN(6) /* PRMSUPP */
             DCL        VAR(&P004) TYPE(*CHAR) LEN(3) /* PRMBRNBR */
             DCL        VAR(&P005) TYPE(*CHAR) LEN(3) /* PRMWHSE */
             DCL        VAR(&P006) TYPE(*CHAR) LEN(20) /* PRMITEM */
             DCL        VAR(&P007) TYPE(*DEC) LEN(9) /* PRMQTY */
             DCL        VAR(&X007) TYPE(*DEC) LEN(15 5) /* PRMQTY */
             DCL        VAR(&P008) TYPE(*DEC) LEN(12 5) /* PRMUCST */
             DCL        VAR(&X008) TYPE(*DEC) LEN(15 5) /* PRMUCST */
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

                        SBMJOB     CMD(CALL IPSPRCC  PARM(&P001 &P002 +
                         &P003 &P004 &P005 &P006 &X007 &X008)) +
                        INLLIBL(*CURRENT) +
                        JOB(IPSPRC )
             GOTO       CMDLBL(END999)
             ENDDO

TAG015: /* START PROCESSING */


             CHGVAR     VAR(&P007) VALUE(&X007)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(END999))
             CHGVAR     VAR(&P008) VALUE(&X008)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(END999))
/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(IPSPRC) PARM(&P001 &P002 &P003 +
                         &P004 &P005 &P006 &P007 &P008)

             CHGVAR     VAR(&X007) VALUE(&P007)
             CHGVAR     VAR(&X008) VALUE(&P008)

/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
END999: /* END OF JOB */

             ENDPGM
