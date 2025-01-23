/*           CRTCMD     CMD(LANDIPSO/MIPSWADDC) +                  */
/*                      PGM(*LIBL/MIPSWADDC) +                     */
/*                      SRCFILE(LANDIPSS/QCMDSRC) +                */
/*                      SRCMBR(MIPSWADDC) +                        */
/*                      TEXT('Work with Warehouse Addresses') +    */
/*                      MODE( +                                    */
/*                        *ALL) +                                  */
/*                      ALLOW( +                                   */
/*                        *ALL) +                                  */
/*                      MAXPOS(*NOMAX) +                           */
/*                      PMTFILE(*NONE) +                           */
/*                      HLPSCHIDX(*NONE) +                         */
/*                      HLPPNLGRP(*NONE) +                         */
/*                      HLPID(*NONE)                               */

             CMD        PROMPT('Work with Warehouse Addresses')
             PARM       KWD(PRM002) +
                        TYPE(*CHAR) +
                        LEN(3) +
                        PROMPT('Parameter fld for...PDWHSE')
