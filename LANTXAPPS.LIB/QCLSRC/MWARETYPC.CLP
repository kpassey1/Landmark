/********************************************************************/
/* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         MWARETYPC                         */
/*  APPLICATION ID      -         MWARETYP                          */
/*  APPLICATION NAME    -           Work with Warehouse Types       */
/*  DATE GENERATED      -         Jan 11, 2012                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRCOYNO */


/*********************************************************************/
/* Override the database file(s)                                     */
/*********************************************************************/
             OVRDSPF FILE(FILE0001) +
                    TOFILE(*LIBL/MWARETYPD)

/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(MWARETYP) PARM(&P001)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
             DLTOVR     FILE(*ALL)

END999: /* END OF JOB */

             ENDPGM
