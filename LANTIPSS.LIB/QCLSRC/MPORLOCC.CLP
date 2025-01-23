/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MPORLOCC                          */
/*  APPLICATION ID      -         MPORLOC                           */
/*  APPLICATION NAME    -            P.O. Receiving Locations       */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002 &X003)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRM001 */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(10) /* PRM002 */
             DCL        VAR(&P003) TYPE(*DEC) LEN(5) /* PRM003 */
             DCL        VAR(&X003) TYPE(*DEC) LEN(15 5) /* PRM003 */


/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDBF FILE(FILE0001) +
                    TOFILE(*LIBL/WAREDETR1)

             CHGVAR     VAR(&P003) VALUE(&X003)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(END999))
/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MPORLOC) PARM(&P001 &P002 &P00+
                        3)

             CHGVAR     VAR(&X003) VALUE(&P003)

/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
