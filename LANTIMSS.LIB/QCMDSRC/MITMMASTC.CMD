/*           CRTCMD     CMD(LANDIMSO/MITMMASTC) +                  */
/*                      PGM(*LIBL/MITMMASTC) +                     */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(MITMMASTC) +                        */
/*                      TEXT('    Work with Item Master') +        */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Work with Item Master')
             PARM       KWD(PRCOYNO) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Company Number')
