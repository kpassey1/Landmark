/*           CRTCMD     CMD(LANDIMSO/BSECIMSC) +                   */
/*                      PGM(*LIBL/BSECIMSC) +                      */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(BSECIMSC) +                         */
/*                      TEXT('Check user security') +              */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Check user security')
             PARM       KWD(RTPARM) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        RSTD(*YES) +
                        DFT(B) +
                        VALUES( +
                          'B' +
                          'I') +
                        PROMPT('Run-Time Parm. B=Batch I=Inter')
             PARM       KWD(PRCOYNO) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Company Number')
             PARM       KWD(PRUSER) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('User')
             PARM       KWD(PRACTN) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('Action to be tested')
             PARM       KWD(PRALWD) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('User allowed action')
