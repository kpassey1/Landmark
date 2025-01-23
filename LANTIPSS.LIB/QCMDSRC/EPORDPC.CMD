/*           CRTCMD     CMD(LANDIPSO/EPORDPC) +                    */
/*                      PGM(*LIBL/EPORDPC) +                       */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(EPORDPC) +                          */
/*                      TEXT('    Display PO for Number') +        */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Display PO for Number')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Parameter fld for...POPORD')
             PARM       KWD(PRMEND) +
                        TYPE(*CHAR) +
                        LEN(1) +
                        PROMPT('End requested')
