/*           CRTCMD     CMD(LANDIMSO/MSTOKMOVC) +                  */
/*                      PGM(*LIBL/MSTOKMOVC) +                     */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(MSTOKMOVC) +                        */
/*                      TEXT('    Enter Stock Movements') +        */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Enter Stock Movements')
             PARM       KWD(PRCOYNO) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Company Number')
