/*           CRTCMD     CMD(LANDIMSO/IMSMENDC) +                   */
/*                      PGM(*LIBL/IMSMENDC) +                      */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(IMSMENDC) +                         */
/*                      TEXT('Month-end control procedure') +      */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Month-end control procedure')
             PARM       KWD(RTPARM) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        RSTD(*YES) +
                        DFT(B) +
                        VALUES( +
                          'B' +
                          'I') +
                        PROMPT('Run-Time Parm. B=Batch I=Inter')
             PARM       KWD(PRCOYN) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Company Number')
             PARM       KWD(PRDATE) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('Cut-off Date')
