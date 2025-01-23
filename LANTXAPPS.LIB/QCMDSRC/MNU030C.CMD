/*           CRTCMD     CMD(LANDXAPPO/MNU030C) +                   */
/*                      PGM(*LIBL/MNU030C) +                       */
/*                      SRCFILE(LANDXAPPS/QCMDSRC) +               */
/*                      SRCMBR(MNU030C) +                          */
/*                      TEXT('Copy User Details') +                */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Copy User Details')
             PARM       KWD(RTPARM) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        RSTD(*YES) +
                        DFT(B) +
                        VALUES( +
                          'B' +
                          'I') +
                        PROMPT('Run-Time Parm. B=Batch I=Inter')
             PARM       KWD(PRFUSR) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('From  User')
             PARM       KWD(PRCMNU) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('Copy Menus Y/N')
             PARM       KWD(PRCOPT) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('Copy Options Y/N')
             PARM       KWD(PRTUSR) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('To User')
             PARM       KWD(PRREC) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('Records to Copy')
