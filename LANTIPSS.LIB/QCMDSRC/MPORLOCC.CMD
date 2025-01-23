/*           CRTCMD     CMD(LANDIPSO/MPORLOCC) +                   */
/*                      PGM(*LIBL/MPORLOCC) +                      */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(MPORLOCC) +                         */
/*                      TEXT('   P.O. Receiving Locations') +      */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('   P.O. Receiving Locations')
             PARM       KWD(PRM001) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter fld for...POCOYNO')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Parameter fld for...POPORD')
             PARM       KWD(PRM003) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('Parameter fld for...POSEQ')
