/*           CRTCMD     CMD(LANDIPSO/EPORDIC) +                    */
/*                      PGM(*LIBL/EPORDIC) +                       */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(EPORDIC) +                          */
/*                      TEXT('    Display PO for Item') +          */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Display PO for Item')
             PARM       KWD(PRITEM) +
                        TYPE(*CHAR) +
                        LEN(15) +
                        PROMPT('Item number')
             PARM       KWD(PRMEND) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('End requested')
