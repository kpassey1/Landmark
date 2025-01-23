/*           CRTCMD     CMD(LANDIPSO/PSTOKORDC) +                  */
/*                      PGM(*LIBL/PSTOKORDC) +                     */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(PSTOKORDC) +                        */
/*                      TEXT('Stock Ordered Register') +           */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Stock Ordered Register')
             PARM       KWD(RTPARM) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        RSTD(*YES) +
                        DFT(B) +
                        VALUES( +
                          'B' +
                          'I') +
                        PROMPT('Run-Time Parm. B=Batch I=Inter')
             PARM       KWD(PRM001) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter Field for Company')
