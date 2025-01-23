/*           CRTCMD     CMD(LANDIPSO/MUSERDEFC) +                  */
/*                      PGM(*LIBL/MUSERDEFC) +                     */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(MUSERDEFC) +                        */
/*                      TEXT('    Maintain User Defaults') +       */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Maintain User Defaults')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Parameter fld for...UDUSER')
