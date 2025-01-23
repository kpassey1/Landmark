/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MFSSTORC                          */
/*  APPLICATION ID      -         MFSSTOR                           */
/*  APPLICATION NAME    -            Work with Store CrossRef       */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRM001 */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(5) /* PRM002 */
             DCL        VAR(&OUTQ) TYPE(*CHAR) LEN(10) /* OUTPUT QUEUE */
             DCL        VAR(&OUTL) TYPE(*CHAR) LEN(10) /* OUTQ LIBRARY */


/********************************************************************/
/* Get current OUTPUT QUEUE AND OUTPUT QUEUE LIBRARY                */
/********************************************************************/
             RTVJOBA    OUTQ(&OUTQ) OUTQLIB(&OUTL)
             CHGJOB     OUTQ(ASSETO/ASSETOUTQ)
             MONMSG     MSGID(CPF0000)


/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MFSSTOR) PARM(&P001 &P002)


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
