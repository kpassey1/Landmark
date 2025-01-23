     /****************************************************************/
     /* Copyright *** K.D.P Software Limited ***  2002               */
     /****************************************************************/
     /*  PROGRAM ID          -    NAMCHKN                            */
     /*  APPLICATION ID      -    LANDMARK IMS                       */
     /*  APPLICATION NAME    -    Existence check.                   */
     /*  DATE GENERATED      -    May, 2002                          */
     /****************************************************************/
             PGM        PARM(&OBJ &FND)
             DCL        VAR(&OBJ) TYPE(*CHAR) LEN(10) /* OBJECT*/
             DCL        VAR(&FND) TYPE(*CHAR) LEN(1) /* OBJECT FOUND */

             CHKOBJ     OBJ(&OBJ) OBJTYPE(*PGM)
             MONMSG     MSGID(CPF0000) EXEC(DO)
             CHGVAR     VAR(&FND) VALUE('N')
             GOTO       CMDLBL(OK)
             ENDDO
             CHGVAR     VAR(&FND) VALUE('Y')
OK: /* END OF JOB */
             ENDPGM
