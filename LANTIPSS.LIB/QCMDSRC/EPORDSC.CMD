/*           CRTCMD     CMD(LANDIPSO/EPORDSC) +                    */
/*                      PGM(*LIBL/EPORDSC) +                       */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(EPORDSC) +                          */
/*                      TEXT('   Display PO for Supplier') +       */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('   Display PO for Supplier')
             PARM       KWD(PRSUPP) +
                        TYPE(*CHAR) +
                        LEN(6) +
                        PROMPT('Parameter for supplier')
             PARM       KWD(PRSUPB) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter for branch')
             PARM       KWD(PRMEND) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('End requested')
