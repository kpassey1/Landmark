/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MEXPDELC                          */
/*  APPLICATION ID      -         MEXPDEL                           */
/*  APPLICATION NAME    -         Work With Expected Deliveries     */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRCOYNO */


/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDBF FILE(EXPDELX) +
                    TOFILE(*LIBL/EXPDEL) SHARE(*NO)

/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MEXPDEL) PARM(&P001)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
