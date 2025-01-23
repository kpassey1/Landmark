/*           CRTCMD     CMD(LANDIMSO/MCOMPANYC) +                  */
/*                      PGM(*LIBL/MCOMPANYC) +                     */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(MCOMPANYC) +                        */
/*                      TEXT('  Work with Company Details') +      */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('  Work with Company Details')
             PARM       KWD(PRMXXX) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Ghost parameter')
