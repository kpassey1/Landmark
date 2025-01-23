/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         PRIMSC                            */
/*  APPLICATION ID      -         PRIMS                             */
/*  APPLICATION NAME    -         Prompts for Batch/Report Jobs     */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001 &P002)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(20) /* PRPRGRM */
             DCL        VAR(&P002) TYPE(*CHAR) LEN(3) /* PRCOYNO */
             DCL        VAR(&DATE) TYPE(*CHAR) LEN(6)
             DCL        VAR(&DMY) TYPE(*CHAR) LEN(6)
             DCL        VAR(&NDMY) TYPE(*DEC) LEN(6 0)
             DCL        VAR(&YMD) TYPE(*CHAR) LEN(6)
             DCL        VAR(&NYMD) TYPE(*DEC) LEN(6 0)



/*********************************************************************/
/* Get System Date And Convert It To Required Format                 */
/*********************************************************************/
             RTVSYSVAL  SYSVAL(QDATE) RTNVAR(&DATE)
             CVTDAT     DATE(&DATE) TOVAR(&DMY) FROMFMT(*SYSVAL) +
                          TOFMT(*DMY) TOSEP(*NONE)
             CHGVAR     VAR(&NDMY) VALUE(&DMY)
             CVTDAT     DATE(&DATE) TOVAR(&YMD) FROMFMT(*SYSVAL) +
                          TOFMT(*YMD) TOSEP(*NONE)
             CHGVAR     VAR(&NYMD) VALUE(&YMD)

/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(PRIMS) PARM(&P001 &P002 &NDMY +
                        &NYMD)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
END999: /* END OF JOB */

             ENDPGM
