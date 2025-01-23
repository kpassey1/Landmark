/*           CRTCMD     CMD(LANDIPSO/PORDDRC) +                    */
/*                      PGM(*LIBL/PORDDRC) +                       */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(PORDDRC) +                          */
/*                      TEXT('Open Orders Report') +               */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Open Orders Report')
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
                        PROMPT('Company Number')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('From WareHouse')
             PARM       KWD(PRM003) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('To Warehouse')
             PARM       KWD(PRM004) +
                        TYPE(*CHAR) +
                        LEN(6) +
                        PROMPT('From Supplier')
             PARM       KWD(PRM005) +
                        TYPE(*CHAR) +
                        LEN(6) +
                        PROMPT('To Supplier')
             PARM       KWD(PRM006) +
                        TYPE(*CHAR) +
                        LEN(15) +
                        PROMPT('From Item')
             PARM       KWD(PRM007) +
                        TYPE(*CHAR) +
                        LEN(15) +
                        PROMPT('To Item')
             PARM       KWD(PRM008) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('From Date')
             PARM       KWD(PRM009) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('To Date')
