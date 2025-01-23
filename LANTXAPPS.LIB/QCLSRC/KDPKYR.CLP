/*********************************************************************/
/*                                                                   */
/* Programme   : KDPKYR                                              */
/* Description : Retrieve the machine serial number.                 */
/* Programmer  : Jim Goodger                                         */
/* Date        : 24 October 1990                                     */
/*                                                                   */
/*********************************************************************/
             PGM        PARM(&SNUM)

             DCL        VAR(&SNUM) TYPE(*CHAR) LEN(8)

             RTVSYSVAL  SYSVAL(QSRLNBR) RTNVAR(&SNUM)
             ENDPGM
