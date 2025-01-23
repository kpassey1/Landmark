/*           CRTCMD     CMD(LANDXAPPO/MNU080C) +                   */
/*                      PGM(*LIBL/MNU080C) +                       */
/*                      SRCFILE(LANDXAPPS/QCMDSRC) +               */
/*                      SRCMBR(MNU080C) +                          */
/*                      TEXT('        Select Company') +           */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('        Select Company')
             PARM       KWD(PRCOYN) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter fld for...CYCOYNO')
             PARM       KWD(PRLEV2) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Dummy Parameter')
             PARM       KWD(PRLEV3) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Dummy Parameter')
