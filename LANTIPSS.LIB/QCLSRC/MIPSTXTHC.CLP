/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MIPSTXTHC                         */
/*  APPLICATION ID      -         MIPSTXTH                          */
/*  APPLICATION NAME    -             Work with Header Text         */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &X002)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(10) /* PRM002 */
             DCL        VAR(&P002) TYPE(*DEC) LEN(5) /* PRM003 */
             DCL        VAR(&X002) TYPE(*DEC) LEN(15 5) /* PRM003 */


/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDSPF FILE(FILE0001) +
                    TOFILE(*LIBL/MIPSTXTHD)

             CHGVAR     VAR(&P002) VALUE(&X002)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(END999))
/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MIPSTXTH) PARM(&P001 &P002)

             CHGVAR     VAR(&X002) VALUE(&P002)

/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
