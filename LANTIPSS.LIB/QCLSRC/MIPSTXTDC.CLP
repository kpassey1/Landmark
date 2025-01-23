/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MIPSTXTDC                         */
/*  APPLICATION ID      -         MIPSTXTD                          */
/*  APPLICATION NAME    -             Work with Detail Text         */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &X002 &X003)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(10) /* PRM002 */
             DCL        VAR(&P002) TYPE(*DEC) LEN(5) /* PRM003 */
             DCL        VAR(&X002) TYPE(*DEC) LEN(15 5) /* PRM003 */
             DCL        VAR(&P003) TYPE(*DEC) LEN(5) /* PRM004 */
             DCL        VAR(&X003) TYPE(*DEC) LEN(15 5) /* PRM004 */


/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             CHGVAR     VAR(&P002) VALUE(&X002)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(END999))
             CHGVAR     VAR(&P003) VALUE(&X003)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(END999))
/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MIPSTXTD) PARM(&P001 &P002 &P0+
                        03)

             CHGVAR     VAR(&X002) VALUE(&P002)
             CHGVAR     VAR(&X003) VALUE(&P003)

/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
