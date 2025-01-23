/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         EIPSCPYDC                         */
/*  APPLICATION ID      -         EIPSCPYD                          */
/*  APPLICATION NAME    -             Display Company Details       */
/*  DATE GENERATED      -         Jan 12, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM

             DCL        VAR(&DATE) TYPE(*CHAR) LEN(6)
             DCL        VAR(&YMD) TYPE(*CHAR) LEN(6)
             DCL        VAR(&NYMD) TYPE(*DEC) LEN(6 0)


/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDSPF FILE(FILE0001) +
                    TOFILE(*LIBL/EIPSCPYDD)

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
             CALL       PGM(EIPSCPYD) PARM(&NYMD)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
