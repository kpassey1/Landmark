/*           CRTCMD     CMD(LANDIMSO/MITMCLASC) +                  */
/*                      PGM(*LIBL/MITMCLASC) +                     */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(MITMCLASC) +                        */
/*                      TEXT('    Work with Item Classes') +       */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Work with Item Classes')
             PARM       KWD(PRM001) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter fld for...ICCOYNO')
