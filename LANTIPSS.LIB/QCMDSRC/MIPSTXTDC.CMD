/*           CRTCMD     CMD(LANDIPSO/MIPSTXTDC) +                  */
/*                      PGM(*LIBL/MIPSTXTDC) +                     */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(MIPSTXTDC) +                        */
/*                      TEXT('    Work with Detail Text') +        */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Work with Detail Text')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Parameter fld for...TDPORD')
             PARM       KWD(PRM003) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('Parameter fld for...TDPOSEQ')
             PARM       KWD(PRM004) +
                        TYPE(*DEC) +
                        LEN(15 5) +
                        PROMPT('Parameter fld for...TDSEQ')
