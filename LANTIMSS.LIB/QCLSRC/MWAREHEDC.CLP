/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MWAREHEDC                         */
/*  APPLICATION ID      -         MWAREHED                          */
/*  APPLICATION NAME    -           Work with Warehouse Details     */
/*  DATE GENERATED      -         Jan 11, 2012                      */
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
             OVRDBF FILE(FILE0001) +
                    TOFILE(*LIBL/WLOCITM1) SHARE(*NO)
             OVRDSPF FILE(FILE0002) +
                    TOFILE(*LIBL/MWAREHEDD)

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
             CALL       PGM(MWAREHED) PARM(&P001 &NYMD)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
