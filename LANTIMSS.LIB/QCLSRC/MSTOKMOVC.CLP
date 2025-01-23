/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MSTOKMOVC                         */
/*  APPLICATION ID      -         MSTOKMOV                          */
/*  APPLICATION NAME    -             Enter Stock Movements         */
/*  DATE GENERATED      -         Jan 12, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRCOYNO */
             DCL        VAR(&DATE) TYPE(*CHAR) LEN(6)
             DCL        VAR(&YMD) TYPE(*CHAR) LEN(6)
             DCL        VAR(&NYMD) TYPE(*DEC) LEN(6 0)


/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDBF FILE(EXPDELX) +
                    TOFILE(*LIBL/EXPDEL) SHARE(*NO)
             OVRDBF FILE(STOKMOVX) +
                    TOFILE(*LIBL/STOKMOV) SHARE(*NO)
             OVRDSPF FILE(FILE0001) +
                    TOFILE(*LIBL/MSTOKMOVD)

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
             CALL       PGM(MSTOKMOV) PARM(&P001 &NYMD)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
