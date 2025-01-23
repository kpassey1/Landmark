     /****************************************************************/
     /* Copyright   ** KDP Software Limited **    1996               */
     /****************************************************************/
     /*                                                              */
     /*  PROGRAM ID          -    MNU050C                            */
     /*  APPLICATION ID      -    MNU050                             */
     /*  APPLICATION NAME    -        Maintain Program Names         */
     /*  DATE GENERATED      -    Feb 2, 1996                        */
     /*                                                              */
     /****************************************************************/
             PGM

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
             CALL       PGM(MNU050)

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
