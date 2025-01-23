/********************************************************************/
/*                                                                  */
/* 5722SS1 V5R4M0 060210     RTVCLSRC Output     15/11/13 12:21:27  */
/*                                                                  */
/* Program name . . . . . . . . . . . . . . :   CLMSG             PN*/
/* Library name . . . . . . . . . . . . . . :   KDPADMINO         PL*/
/* Original source file . . . . . . . . . . :   QCLSRC            SN*/
/* Library name . . . . . . . . . . . . . . :   SOPINVS           SL*/
/* Original source member . . . . . . . . . :   CLMSG             SM*/
/* Source file change                                               */
/*   date/time  . . . . . . . . . . . . . . :   25/10/91 12:57:59 SC*/
/* Patch option . . . . . . . . . . . . . . :   *NOPATCH          PO*/
/* User profile . . . . . . . . . . . . . . :   *USER             UP*/
/* Text . . . : ASSET GENERATED CLP TO HANDLE MSG - CLMSG         TX*/
/* Owner  . . . . . . . . . . . . . . . . . :   QDFTOWN           OW*/
/* Patch change ID  . . . . . . . . . . . . :                     PC*/
/* Patch APAR ID  . . . . . . . . . . . . . :                     PA*/
/* User mod flag  . . . . . . . . . . . . . :   *YES              UM*/
/*                                                                ED*/
/********************************************************************/
     PGM PARM(&ACTION &MSGID &MSGF &MSGFLIB &MSGDTA)
     DCL VAR(&ACTION) TYPE(*CHAR) LEN(1)
     DCL VAR(&MSGID) TYPE(*CHAR) LEN(7)
     DCL VAR(&MSGF) TYPE(*CHAR) LEN(10)
     DCL VAR(&MSGFLIB) TYPE(*CHAR) LEN(10)
     DCL VAR(&MSGDTA) TYPE(*CHAR) LEN(132)
     IF COND((&ACTION *EQ 'A') *OR (&ACTION *EQ 'R')) THEN(DO)
     IF COND(&MSGID *EQ ' ') THEN(DO)
     CHGVAR VAR(&MSGID) VALUE('CPF9898')
     CHGVAR VAR(&MSGF) VALUE('QCPFMSG')
     CHGVAR VAR(&MSGFLIB) VALUE('*LIBL')
     ENDDO
     IF COND(&MSGFLIB *EQ ' ') THEN(DO)
     CHGVAR VAR(&MSGFLIB) VALUE('*LIBL')
     ENDDO
     IF COND(&MSGF *EQ ' ') THEN(DO)
     CHGVAR VAR(&MSGF) VALUE('QCPFMSG')
     ENDDO
     IF COND(&ACTION *EQ 'A') THEN(DO)
     SNDPGMMSG MSGID(&MSGID) MSGF(&MSGFLIB/&MSGF) MSGDTA(&MSGDTA)
     MONMSG MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))
     ENDDO
     ELSE CMD(DO)
     RTVMSG MSGID(&MSGID) MSGF(&MSGFLIB/&MSGF) MSGDTA(&MSGDTA) -
MSG(&MSGDTA)
     MONMSG MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))
     ENDDO
     ENDDO
     IF COND(&ACTION *EQ 'C') THEN(DO)
     RMVMSG PGMQ(*PRV) CLEAR(*ALL)
     GOTO CMDLBL(ENDCLPGM)
     ENDDO
     GOTO CMDLBL(ENDCLPGM)
ERROR:
     RCVMSG MSGDTA(&MSGDTA) MSGID(&MSGID) MSGF(&MSGF) -
MSGFLIB(&MSGFLIB)
     MONMSG MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))
     SNDPGMMSG MSGID(&MSGID) MSGF(&MSGFLIB/&MSGF) MSGDTA(&MSGDTA)
     MONMSG MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))
ENDCLPGM:
     IF COND(&ACTION *NE 'Q') THEN(DO)
     RETURN
     ENDDO
     ENDPGM
