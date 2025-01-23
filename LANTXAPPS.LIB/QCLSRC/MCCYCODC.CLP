/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MCCYCODC                          */
/*  APPLICATION ID      -         MCCYCOD                           */
/*  APPLICATION NAME    -            Work with Currency Codes       */
/*  DATE GENERATED      -         Jan 12, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRCOYNO */
             DCL        VAR(&OUTQ) TYPE(*CHAR) LEN(10) /* OUTPUT QUEUE */
             DCL        VAR(&OUTL) TYPE(*CHAR) LEN(10) /* OUTQ LIBRARY */


/********************************************************************/
/* Get current OUTPUT QUEUE AND OUTPUT QUEUE LIBRARY                */
/********************************************************************/
             RTVJOBA    OUTQ(&OUTQ) OUTQLIB(&OUTL)
             CHGJOB     OUTQ(QGPL/QPRINT)
             MONMSG     MSGID(CPF0000)


/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MCCYCOD) PARM(&P001)


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
