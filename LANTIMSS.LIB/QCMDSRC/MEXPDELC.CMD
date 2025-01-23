/*           CRTCMD     CMD(LANDIMSO/MEXPDELC) +                   */
/*                      PGM(*LIBL/MEXPDELC) +                      */
/*                      SRCFILE(LANDIMSS/QCMDSRC) +                */
/*                      SRCMBR(MEXPDELC) +                         */
/*                      TEXT('Work With Expected Deliveries') +    */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Work With Expected Deliveries')
             PARM       KWD(PRCOYNO) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Company Number')
