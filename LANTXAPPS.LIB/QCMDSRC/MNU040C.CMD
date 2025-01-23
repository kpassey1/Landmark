/*           CRTCMD     CMD(LANDXAPPO/MNU040C) +                   */
/*                      PGM(*LIBL/MNU040C) +                       */
/*                      SRCFILE(LANDXAPPS/QCMDSRC) +               */
/*                      SRCMBR(MNU040C) +                          */
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
             PARM       KWD(USPARM) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('User')
             PARM       KWD(PGPARM) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Program Name')
             PARM       KWD(OPPARM) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('Option Requested')
             PARM       KWD(RNPARM) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('Error Return Code')
