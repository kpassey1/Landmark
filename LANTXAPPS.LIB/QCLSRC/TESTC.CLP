/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         TESTC                             */
/*  APPLICATION ID      -         TEST                              */
/*  APPLICATION NAME    -         Test the date stuff               */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM

             DCL        VAR(&OUTQ) TYPE(*CHAR) LEN(10) /* OUTPUT QUEUE */
             DCL        VAR(&OUTL) TYPE(*CHAR) LEN(10) /* OUTQ LIBRARY */


/********************************************************************/
/* Get current OUTPUT QUEUE AND OUTPUT QUEUE LIBRARY                */
/********************************************************************/
             RTVJOBA    OUTQ(&OUTQ) OUTQLIB(&OUTL)
             CHGJOB     OUTQ(ASSET8O/ASSETOUTQ)
             MONMSG     MSGID(CPF0000)


/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(TEST)

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
