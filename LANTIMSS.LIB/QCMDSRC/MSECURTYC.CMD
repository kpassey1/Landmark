/*           CRTCMD     CMD(LANDIMSO/MSECURTYC) +                  */
/*                      PGM(*LIBL/MSECURTYC) +                     */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(MSECURTYC) +                        */
/*                      TEXT('  Work with Security Details') +     */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('  Work with Security Details')
             PARM       KWD(PRM001) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter fld for...USCOYNO')
