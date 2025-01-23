/*********************************************************************/
/*  Program     : LANDMARK                                           */
/*  Description : SIGN ON TO LANDMARK  - SHIPPING VERSION            */
/*  Date        : JULY 1999                                          */
/*********************************************************************/
             PGM
             DCL        VAR(&USRLIBL) TYPE(*CHAR) LEN(275)
             DCL        VAR(&RSTLIBLCMD) TYPE(*CHAR) LEN(289)

/* Save current user library list */
             RTVJOBA    USRLIBL(&USRLIBL)

/* SET UP LIBRARY LIST                                               */
             RMVLIBLE   LIB(QTEMP)
             MONMSG     MSGID(CPF0000)
             RMVLIBLE   LIB(LAN8XAPPO)
             MONMSG     MSGID(CPF0000)
             RMVLIBLE   LIB(LAN8MARK)
             MONMSG     MSGID(CPF0000)
             RMVLIBLE   LIB(LAN8XAPPO)
             MONMSG     MSGID(CPF0000)
             RMVLIBLE   LIB(LAN8IMSO)
             MONMSG     MSGID(CPF0000)
             RMVLIBLE   LIB(LAN8IPSO)
             MONMSG     MSGID(CPF0000)
             RMVLIBLE   LIB(LAN8HELP)
             MONMSG     MSGID(CPF0000)

             ADDLIBLE   LIB(LAN8MARK)
             MONMSG     MSGID(CPF0000)
             ADDLIBLE   LIB(LAN8XAPPO)
             MONMSG     MSGID(CPF0000)
             ADDLIBLE   LIB(LAN8IPSO)
             MONMSG     MSGID(CPF0000)
             ADDLIBLE   LIB(LAN8IMSO)
             MONMSG     MSGID(CPF0000)
             ADDLIBLE   LIB(LAN8HELP)
             MONMSG     MSGID(CPF0000)
             ADDLIBLE   LIB(QTEMP)
             MONMSG     MSGID(CPF0000)


 MENU:       CRTDUPOBJ  OBJ(COMPNUMB) FROMLIB(LAN8MARK) +
                          OBJTYPE(*DTAARA) TOLIB(QTEMP)
             MONMSG     MSGID(CPF0000 CPF9999)

/*   CALL MENU PROGRAM                                               */
             CALL       PGM(MNU060C)

/* Reset original library list. */
             CHGVAR     VAR(&RSTLIBLCMD) VALUE('CHGLIBL LIBL(' || +
                          &USRLIBL || ')')
             CALL       PGM(QCMDEXC) PARM(&RSTLIBLCMD 289)
             MONMSG     MSGID(CPF0000)

END:         ENDPGM
