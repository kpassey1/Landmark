/*           CRTCMD     CMD(LANDIMSO/PPCKLSTC) +                   */
/*                      PGM(*LIBL/PPCKLSTC) +                      */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(PPCKLSTC) +                         */
/*                      TEXT('     Print Picking List') +          */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('     Print Picking List')
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
             PARM       KWD(PRSEQ) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('Picking list number')
