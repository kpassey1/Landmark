/*           CRTCMD     CMD(LANDIMSO/PRIMSC) +                     */
/*                      PGM(*LIBL/PRIMSC) +                        */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(PRIMSC) +                           */
/*                      TEXT('Prompts for Batch/Report Jobs') +    */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Prompts for Batch/Report Jobs')
             PARM       KWD(PRPRGRM) +
                        TYPE(*CHAR) +
                        LEN(20) +
                        PROMPT('Program Name from menu')
             PARM       KWD(PRCOYNO) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Company Number')
