/********************************************************************/
/* Copyright 2004    ** KDP Software Ltd **      All Rights Reserved*/
/********************************************************************/
/*                                                                  */
/*  PROGRAM ID          -         OBJ192C                           */
/*  APPLICATION ID      -         MCOMPANY                          */
/*  APPLICATION NAME    -           Work with Company Details       */
/*  DATE GENERATED      -         Mar 16, 2004                      */
/*                                                                  */
/********************************************************************/
             PGM        PARM(&P001)

             DCL        VAR(&P001) TYPE(*CHAR) LEN(3) /* PRMXXX */



/*********************************************************************/
/* Call processing program                                           */
/*********************************************************************/
             CALL       PGM(OBJ192) PARM(&P001)


/*********************************************************************/
/* Close/Delete Overridden File(s)                                   */
/*********************************************************************/
END999: /* END OF JOB */

             ENDPGM
