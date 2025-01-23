/*           CRTCMD     CMD(LANDIPSO/IPSPRCC) +                    */
/*                      PGM(*LIBL/IPSPRCC) +                       */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(IPSPRCC) +                          */
/*                      TEXT('Find Price for item') +              */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Find Price for item')
             PARM       KWD(RTPARM) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        RSTD(*YES) +
                        DFT(B) +
                        VALUES( +
                          'B' +
                          'I') +
                        PROMPT('Run-Time Parm. B=Batch I=Inter')
             PARM       KWD(PRMCOYNO) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Company number')
             PARM       KWD(PRMSUPP) +
                        TYPE(*CHAR) +
                        LEN(6) +
                        PROMPT('Supplier No')
             PARM       KWD(PRMBRNBR) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Branch number')
             PARM       KWD(PRMWHSE) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Wharehouse')
             PARM       KWD(PRMITEM) +
                        TYPE(*CHAR) +
                        LEN(15) +
                        PROMPT('item number')
             PARM       KWD(PRMQTY) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('Quantity ordered')
             PARM       KWD(PRMUCST) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('Cost price required')
