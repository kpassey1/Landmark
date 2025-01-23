/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MSTOKSELC                         */
/*  APPLICATION ID      -         MSTOKSEL                          */
/*  APPLICATION NAME    -           Stock Take Request Options      */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRCOYNO */


/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDBF FILE(STOKREQX) +
                    TOFILE(*LIBL/STOKREQ) SHARE(*NO)
             OVRDSPF FILE(FILE0001) +
                    TOFILE(*LIBL/MSTOKSELD)

/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MSTOKSEL) PARM(&P001)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
