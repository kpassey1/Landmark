/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         PORDDRC                           */
/*  APPLICATION ID      -         PORDDR                            */
/*  APPLICATION NAME    -         Open Orders Report                */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002 &P003 &P004 &P005 +
                         &P006 &P007 &P008 &P009 &P010)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(1) /* RTPARM */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(3) /* PRM001 */
             DCL        VAR(&P003) TYPE(*CHAR) LEN(3) /* PRM002 */
             DCL        VAR(&P004) TYPE(*CHAR) LEN(3) /* PRM003 */
             DCL        VAR(&P005) TYPE(*CHAR) LEN(6) /* PRM004 */
             DCL        VAR(&P006) TYPE(*CHAR) LEN(6) /* PRM005 */
             DCL        VAR(&P007) TYPE(*CHAR) LEN(20) /* PRM006 */
             DCL        VAR(&P008) TYPE(*CHAR) LEN(20) /* PRM007 */
             DCL        VAR(&P009) TYPE(*CHAR) LEN(8) /* PRM008 */
             DCL        VAR(&P010) TYPE(*CHAR) LEN(8) /* PRM009 */
             DCL        VAR(&TYPE) TYPE(*CHAR) LEN(1) /* JOB TYPE */
             DCL        VAR(&JOBNBR) TYPE(*CHAR) LEN(6) /* JOB NMBR */

             DCL        VAR(&OUTQ) TYPE(*CHAR) LEN(10) /* OUTPUT QUEUE */
             DCL        VAR(&OUTL) TYPE(*CHAR) LEN(10) /* OUTQ LIBRARY */

             DCL        VAR(&DATE) TYPE(*CHAR) LEN(6)
             DCL        VAR(&DMY) TYPE(*CHAR) LEN(6)
             DCL        VAR(&NDMY) TYPE(*DEC) LEN(6 0)

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

                        SBMJOB     CMD(CALL PORDDRC  PARM(&P001 &P002 +
                         &P003 &P004 &P005 &P006 &P007 &P008 &P009 &P+
                        010)) +
                        INLLIBL(*CURRENT) +
                        JOB(PORDDR )
             GOTO       CMDLBL(END999)
             ENDDO

TAG015: /* START PROCESSING */


/*********************************************************************/
/* Get System Date And Convert It To Required Format                 */
/*********************************************************************/
             RTVSYSVAL  SYSVAL(QDATE) RTNVAR(&DATE)
             CVTDAT     DATE(&DATE) TOVAR(&DMY) FROMFMT(*SYSVAL) +
                          TOFMT(*DMY) TOSEP(*NONE)
             CHGVAR     VAR(&NDMY) VALUE(&DMY)

/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(PORDDR) PARM(&P001 &P002 &P003 +
              &P004 &P005 &P006 &P007 &P008 &P009 &P010 &N+
                        DMY)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
END999: /* END OF JOB */

             ENDPGM
