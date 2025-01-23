/*           CRTCMD     CMD(LANDIMSO/MWARETYPC) +                  */
/*                      PGM(*LIBL/MWARETYPC) +                     */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(MWARETYPC) +                        */
/*                      TEXT('  Work with Warehouse Types') +      */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('  Work with Warehouse Types')
             PARM       KWD(PRCOYNO) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Company Number')
