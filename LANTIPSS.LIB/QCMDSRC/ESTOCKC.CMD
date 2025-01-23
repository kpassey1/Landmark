/*           CRTCMD     CMD(LANDIPSO/ESTOCKC) +                    */
/*                      PGM(*LIBL/ESTOCKC) +                       */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(ESTOCKC) +                          */
/*                      TEXT('    Open Orders Selection') +        */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('    Open Orders Selection')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(10) +
                        PROMPT('Parameter field for program')
