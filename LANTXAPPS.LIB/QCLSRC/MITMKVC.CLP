/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MITMKVC                           */
/*  APPLICATION ID      -         MITMKV                            */
/*  APPLICATION NAME    -         Validate Module                   */
/*  DATE GENERATED      -         Jan 12, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRGO */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(27) /* KDPKEY3 */
             DCL        VAR(&OUTQ) TYPE(*CHAR) LEN(10) /* OUTPUT QUEUE */
             DCL        VAR(&OUTL) TYPE(*CHAR) LEN(10) /* OUTQ LIBRARY */

             DCL        VAR(&DATE) TYPE(*CHAR) LEN(6)
             DCL        VAR(&YMD) TYPE(*CHAR) LEN(6)
             DCL        VAR(&NYMD) TYPE(*DEC) LEN(6 0)

/********************************************************************/
/* Get current OUTPUT QUEUE AND OUTPUT QUEUE LIBRARY                */
/********************************************************************/
             RTVJOBA    OUTQ(&OUTQ) OUTQLIB(&OUTL)
             CHGJOB     OUTQ(ASSETO/ASSETOUTQ)
             MONMSG     MSGID(CPF0000)


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
             CALL       PGM(MITMKV) PARM(&P001 &P002 &NYMD+
                        )


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
END999: /* END OF JOB */

             IF (&OUTL *EQ ' ') THEN(DO)
             CHGJOB     OUTQ(&OUTQ)
             MONMSG     MSGID(CPF0000)
             ENDDO
             ELSE (DO)
             CHGJOB     OUTQ(&OUTL/&OUTQ)
             MONMSG     MSGID(CPF0000)
             ENDDO

             ENDPGM
