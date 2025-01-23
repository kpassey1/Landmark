/*           CRTCMD     CMD(LANDIPSO/MIPSTXTHC) +                  */
/*                      PGM(*LIBL/MIPSTXTHC) +                     */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(MIPSTXTHC) +                        */
/*                      TEXT('     Maintain Header Text') +        */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('     Maintain Header Text')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Parameter fld for...THPORD')
             PARM       KWD(PRM003) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('Parameter fld for...THSEQ')
