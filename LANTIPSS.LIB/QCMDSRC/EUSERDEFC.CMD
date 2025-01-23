/*           CRTCMD     CMD(LANDIPSO/EUSERDEFC) +                  */
/*                      PGM(*LIBL/EUSERDEFC) +                     */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(EUSERDEFC) +                        */
/*                      TEXT('    Display User Defaults') +        */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Display User Defaults')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Parameter fld for...UDUSER')
