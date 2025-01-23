/*           CRTCMD     CMD(LANDIMSO/MIMSTRNC) +                   */
/*                      PGM(*LIBL/MIMSTRNC) +                      */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(MIMSTRNC) +                         */
/*                      TEXT(' Work with Transaction Codes') +     */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT(' Work with Transaction Codes')
             PARM       KWD(PRM001) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter fld for...TTCOYNO')
