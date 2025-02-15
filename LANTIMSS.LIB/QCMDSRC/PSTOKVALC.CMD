/*           CRTCMD     CMD(LANDIMSO/PSTOKVALC) +                  */
/*                      PGM(*LIBL/PSTOKVALC) +                     */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(PSTOKVALC) +                        */
/*                      TEXT(' Theoretical Stock Valuation') +     */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT(' Theoretical Stock Valuation')
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
             PARM       KWD(PRFWHS) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('From Warehouse')
             PARM       KWD(PRTWHS) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('To Warehouse')
             PARM       KWD(PRFITM) +
                        TYPE(*CHAR) +
                        LEN(15) +
                        PROMPT('From Item')
             PARM       KWD(PRTITM) +
                        TYPE(*CHAR) +
                        LEN(15) +
                        PROMPT('To Item')
