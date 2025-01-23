/*           CRTCMD     CMD(LANDIMSO/BCMMVSMC) +                   */
/*                      PGM(*LIBL/BCMMVSMC) +                      */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(BCMMVSMC) +                         */
/*                      TEXT('M/E Reset Movement Summary') +       */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('M/E Reset Movement Summary')
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
