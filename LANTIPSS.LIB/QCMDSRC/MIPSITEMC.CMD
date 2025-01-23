/*           CRTCMD     CMD(LANDIPSO/MIPSITEMC) +                  */
/*                      PGM(*LIBL/MIPSITEMC) +                     */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(MIPSITEMC) +                        */
/*                      TEXT('   Work with Supplier Items') +      */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('   Work with Supplier Items')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(6) +
                        PROMPT('Parameter fld for...PISUPPN')
             PARM       KWD(PRM003) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter fld for...PIBRNBR')
             PARM       KWD(PRM004) +
                        TYPE(*CHAR) +
                        LEN(15) +
                        PROMPT('Parameter fld for...PIITEM')
