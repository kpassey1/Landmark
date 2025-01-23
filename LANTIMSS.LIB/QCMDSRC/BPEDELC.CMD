/*           CRTCMD     CMD(LANDIMSO/BPEDELC) +                    */
/*                      PGM(*LIBL/BPEDELC) +                       */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(BPEDELC) +                          */
/*                      TEXT('     Expected Deliveries') +         */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('     Expected Deliveries')
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
                        PROMPT('Date for Report')
