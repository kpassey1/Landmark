       // Converted from LANTXAPPS/QRPGLESRC(MITMTYP) to KEV/QRPGLESRC(MITMTYPF).
       // Converted with CVTRPGFREE version 1.5.11 on 2024-10-30-16.52.09.980025.
       // Go to https://sourceforge.net/projects/cvtrpgfree/ for support and updates.
       Ctl-Opt dftactgrp(*no) actgrp(*caller) expropts(*resdecpos)
               datfmt(*iso) timfmt(*iso) option(*nodebugio);
      /TITLE MITMTYP      Work with Item Types
       //*******************************************************************
       // Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
       //*******************************************************************

       //  Program ID          -    MITMTYP
       //  Application ID      -    MITMTYP
       //  Application Name    -         Work with Item Types
       //  Date Generated      -    Jan 11, 2012

       //*******************************************************************
       //  Files Usage

       //  ITMTYP      - (U/DISK   ) IMS Item Type               TP
       //  COMPANY     - (I/DISK   ) Company screen headings     CY
       //  MITMTYPD    - (C/WORKSTN) Generated display file

       //*******************************************************************
       //  Function Of Indicators

       //  SC0001     - List Screen for ITMTYP

       //  01     - SCR001S1 / FL0001 : DSPATR(RI)
       //  02     - SCR001S1 / FL0001 : DSPATR(PR)
       //  03     - SCR001S1 / FL0001 : DSPATR(UL)
       //  04     - SCR001S1 / FL0001 : DSPATR(ND)
       //  05     - SCR001 / CYDESC : DSPATR(PC)
       //  05     - SCR001 / CYDESC : DSPATR(RI)
       //  63     - SCR001C1 SFLDSPCTL
       //  64     - SCR001C1 SFLDSP
       //  65     - SCR001S1 SFLNXTCHG
       //  66     - SCR001C1 SFLINZ
       //  80     - SCR001S1 / FL0001 : DSPATR(PC)
       //  99     - SCR001 OVERLAY
       // N63     - SCR001C1 SFLCLR
       // N64     - SCR001C1 ERASE(SCR001S1)
       // N67     - SCR001C1 SFLEND
       // N79     - SCR001 PUTOVR
       // N79     - SCR001C1 PUTOVR

       //  SC0002     - Detail Screen for ITMTYP

       //  01     - SCR002 / BADESC : DSPATR(PC)
       //  01     - SCR002 / BADESC : DSPATR(RI)
       //  02     - SCR002 / BADESC : DSPATR(PR)
       //  03     - SCR002 / BADESC : DSPATR(UL)
       //  04     - SCR002 / BAITYP : DSPATR(PC)
       //  04     - SCR002 / BAITYP : DSPATR(RI)
       //  05     - SCR002 / BAITYP : DSPATR(PR)
       //  06     - SCR002 / BAITYP : DSPATR(UL)
       //  07     - SCR002 / CYDESC : DSPATR(PC)
       //  07     - SCR002 / CYDESC : DSPATR(RI)
       //  99     - SCR002 OVERLAY
       // N79     - SCR002 PUTOVR

       //*******************************************************************
       //  Function Of Subroutines

       // SMAIN - Main flow of the program.
       // SEND - END of program.
       // S001 - List Screen for ITMTYP
       // S002 - Detail Screen for ITMTYP
       // SREDSP -  Redisplay Windows within stack.
       // S01BKW - SCRN SUB
       // S01EDT - SCRN SUB
       // S01FWD - SCRN SUB
       // SMSG - calls message handling program to either clear, add, or
       // S003   - GETREC d.company,f.company,*eq,prcoyno
       // S004   - SETLL D.ITMTYP,F.ITMTYP,SVK001,SVK002
       // S005   - GETREC D.ITMTYP,F.ITMTYP,*lock,*eq,SVK001,SVK002
       // S006   - GETREC D.ITMTYP,F.ITMTYP,*eq,SVK001,SVK002
       // S007   - DELETE D.ITMTYP,F.ITMTYP
       // S008   - UPDATE D.ITMTYP,F.ITMTYP
       // S009   - WRITE D.ITMTYP,F.ITMTYP
       // S010   - GETBLK D.ITMTYP,F.ITMTYP,*PV,prcoyno
       // S011   - Process To Reset File Pointer(BOF) - ITMTYP
       // S012   - Process To Reset File Pointer(EOF) - ITMTYP
       // S013   - GETREC D.ITMTYP,F.ITMTYP,*EQ,BACOYNO,BAITYP
       // S002V - Detail Screen for ITMTYP
       // *PSSR - Program Execution Errors Handler
       // SATRIB - Display Attribute Handler
       // SLOCK - Update Lock Flag
       // SFERR - File Exception Handler
       // SMVTOF - Move Fields From Work Area To File(s)
       // SMVTOW - Move Fields From File(s) To Work Area

       //*******************************************************************
       //            F i l e     S p e c i f i c a t i o n
       //*******************************************************************
       Dcl-F MITMTYPD       WORKSTN
                                    sfile(scr001s1:rrn01)
                                    infds(dspfds);
       Dcl-F COMPANY                Keyed
                                    infds(fids02)
                                    infsr(sferr);
       Dcl-F ITMTYP                 Usage(*UPDATE:*DELETE:*OUTPUT) Keyed
                                    infds(fids01)
                                    infsr(sferr);


       // --*STAND ALONE-------------------------------------------
      /COPY QRPGLESRC,SATRIBDEF
       Dcl-S appcol              Packed(3:0);
       Dcl-S apppgm                Char(10);
       Dcl-S approw              Packed(3:0);
       Dcl-S appscr                Char(10);
       Dcl-S appset                Char(10);
       Dcl-S apptyp                Char(1);
       Dcl-S bat                   Char(1);
       Dcl-S callst              Packed(1:0);                                // CALL STSword
       Dcl-S chkvar              Packed(1:0);                                // Perform Valid.
       Dcl-S cmdkey                Char(1);                                  //  Cmd key pressed fla
       Dcl-S ct                  Packed(3:0);                                // Counter
       Dcl-S c1                  Packed(3:0);                                // Numeric wrk fld
       Dcl-S datfmt                Char(3);                                  // Date format
       Dcl-S drn01               Packed(4:0);                                // Dspl.Rrn
       Dcl-S dspws                 Char(1);                                  // -dsply- replaced
       Dcl-S ern01               Packed(4:0);                                // SFLEND +
       Dcl-S extscr              Packed(1:0);
       Dcl-S feb                 Packed(2:0);                                // NOD in feb/Leap
       Dcl-S fl0001              Packed(1:0);
       Dcl-S f12flg              Packed(1:0);
       Dcl-S hd0001                    like(rn0001);
       Dcl-S hrc02                     like(rec02);
       Dcl-S ins01                 Char(99);                                 // Savd.Ind
       Dcl-S in01                  Char(99);                                 // Save Ind
       Dcl-S ioflag                Char(1);
       Dcl-S k@                  Packed(3:0);
       Dcl-S kaco01                Char(3);                                  // BACOYNO
       Dcl-S kait02                Char(1);                                  // BAITYP
       Dcl-S kyco01                Char(3);                                  // CYCOYNO
       Dcl-S lck01               Packed(1:0);                                // File lock flag
       Dcl-S lck02               Packed(1:0);                                // File lock flag
       Dcl-S listf               Packed(1:0);                                // List of value flag
       Dcl-S loopct              Packed(3:0);
       Dcl-S lrflag                Char(1);
       Dcl-S mntflg              Packed(1:0);
       Dcl-S moddsc                Char(8);
       Dcl-S mode                Packed(1:0);
       Dcl-S msgact                Char(1);
       Dcl-S msgf                  Char(10);
       Dcl-S msgfl                 Char(10);
       Dcl-S msgflg                Char(1);                                  // Display Msg Flg
       Dcl-S narg1               Packed(30:9);                               // Numer argument1
       Dcl-S nrslt               Packed(30:9);                               // Numeric result
       Dcl-S nrslt0              Packed(30:9);
       Dcl-S nxtrrn              Packed(4:0);                                // NXT RRNC        0030
       Dcl-S posflg              Packed(1:0);
       Dcl-S pract                 Char(1);
       Dcl-S pralwd                Char(1);
       Dcl-S prm001                Char(3);
       Dcl-S prm002                Char(1);
       Dcl-S ps0102                Char(1);
       Dcl-S rn0001                Char(3);
       Dcl-S rn0007                Char(3);
       Dcl-S scrnid                Char(8);                                  // Scrn ID
       Dcl-S sp                  Packed(3:0);                                // Stk ptr
       Dcl-S srn01               Packed(4:0);                                // Savd.Rrn
       Dcl-S svcc                Packed(2:0);                                // Save century
       Dcl-S svcy                Packed(4:0);                                // Save days
       Dcl-S svdat               Packed(6:0);                                // Save date
       Dcl-S svdays              Packed(3:0);                                // Save days
       Dcl-S svdd                Packed(2:0);                                // Save days
       Dcl-S svk001                Char(3);
       Dcl-S svk002                Char(1);
       Dcl-S svleap              Packed(1:0);                                // If leap year
       Dcl-S svmm                Packed(2:0);                                // Save month
       Dcl-S svs01               Packed(5:0);                                // SV STS          0030
       Dcl-S svyy                Packed(2:0);                                // Save year
       Dcl-S swexbl              Packed(1:0);                                // @EXITBLK        0030
       Dcl-S swrd01                Char(1);                                  // RD STS          003
       Dcl-S swrd02                Char(1);                                  // RD STS
       Dcl-S swskpr              Packed(1:0);                                // @SKIPREC        0030
       Dcl-S uercnt              Packed(1:0);
       Dcl-S updflg              Packed(1:0);
       Dcl-S ursume                Char(6);
       Dcl-S validf              Packed(1:0);                                // Flag for validation
       Dcl-S wadj01              Packed(3:0);                                // WRK ADJ
       Dcl-S wcntr               Packed(3:0);                                // COUNTER
       Dcl-S wfile#              Packed(2:0);                                // FILE#
       Dcl-S wgetr               Packed(3:0);                                // COUNTER
       Dcl-S wkuser                Char(10);
       Dcl-S wk0001                    like(rn0007);                         // Company number
       Dcl-S wlcntr              Packed(5:0);                                // LOOP CT         0030
       Dcl-S wlgetr              Packed(5:0);                                // LOOP CT         0030
       Dcl-S wrrn01              Packed(3:0);                                // WRK RRN
       Dcl-S xno                 Packed(1:0);                                // *NO keyword
       Dcl-S xyes                Packed(1:0);                                // *YES keyword
       Dcl-S x0                  Packed(4:0);                                // INDEX 0
       Dcl-S x1                  Packed(3:0);                                // INDEX 1
       Dcl-S z1                  Packed(3:0);                                // Loop Counter . . . .
       Dcl-S z2                  Packed(3:0);                                // Loop Counter . . . .

       //*******************************************************************
       //   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
       //*******************************************************************
       Dcl-S a01                   Char(3) dim(12);
       Dcl-S a02                   Char(1) dim(12);
       Dcl-S sid                   Char(8) dim(99);                          // Scrn stk
       Dcl-S sty                   Char(1) dim(99);                          // Scr type
       Dcl-S a1                    Char(80) dim(9) ctdata perrcd(1);         // Alpha constants i
       Dcl-S da3                   Char(2) dim(17);                          // Fld Attr. Wrk Ary
       Dcl-S da1                   Char(24) dim(8) ctdata perrcd(1);         // Fld Attr. Indic t
       Dcl-S da2                   Char(34) dim(8) alt(da1);
       Dcl-DS fids02;
          sts02                        *STATUS;
          rec02                  BinDec(8:0) Pos(397);
       End-DS;
       Dcl-DS fids01;
          sts01                        *STATUS;
          rec01                  BinDec(8:0) Pos(397);
       End-DS;

       // INFDS for cursor location

       Dcl-DS dspfds;
          row                      Char(1) Pos(370);
          col                      Char(1) Pos(371);
          sflrrn                 BinDec(4:0) Pos(378);
       End-DS;

       // Work Data Structure for cursor

       Dcl-DS @ds001;
          halfwd                 BinDec(4:0) Pos(1);
          byte2                    Char(1) Pos(2);
       End-DS;

       // Display Attribute Structure

       Dcl-DS @ds002;
          fldscr                   Char(10) Pos(1);
          fldnam                   Char(10) Pos(11);
          fldinx                  Zoned(4:0) Pos(21);
          dsperr                   Char(1) Pos(25);
          #ds                      Char(1) Pos(26);
          #hi                      Char(1) Pos(27);
          #ri                      Char(1) Pos(28);
          #ul                      Char(1) Pos(29);
          #bl                      Char(1) Pos(30);
          #cs                      Char(1) Pos(31);
          #pc                      Char(1) Pos(32);
          #nd                      Char(1) Pos(33);
          #pr                      Char(1) Pos(34);
          #gn                      Char(1) Pos(35);
          #rd                      Char(1) Pos(36);
          #pk                      Char(1) Pos(37);
          #wt                      Char(1) Pos(38);
          #tq                      Char(1) Pos(39);
          #yw                      Char(1) Pos(40);
          #bu                      Char(1) Pos(41);
          da6                      Char(1) Pos(27) dim(15);                 /// Fld Attr. Wrk Ary
          #atrib                   Char(31) Pos(11);
          #from                   Zoned(4:0) Pos(25);
          #to                     Zoned(4:0) Pos(29);
          #clf                    Zoned(8:0) Pos(25);
          #map                     Char(24) Pos(1);
       End-DS;

       // Named constants

       Dcl-C C0001                     'Record not found for-
       Edit';

       // Named constants

       Dcl-C C0002                     'Record not found for-
       de1ete';                                                              // -delete - replaced

       // Named constants

       Dcl-C C0003                     'Record not found for-
       Display';

       // Named constants

       Dcl-C C0004                     'Invalid action choic-
       e';

       // Date Manipulation Data Struct.

       Dcl-DS *N;
          x1cdat                  Zoned(8:0) Pos(1);
          x1date                  Zoned(6:0) Pos(1);
          x12                     Zoned(2:0) Pos(1);
          x34                     Zoned(2:0) Pos(3);
          x56                     Zoned(2:0) Pos(5);
          x78                     Zoned(2:0) Pos(7);
       End-DS;

       // Message data structure

       Dcl-DS @ds003;
          msgdta                   Char(132) Pos(1);
          umesg1                   Char(51) Pos(1);
          umesg2                   Char(51) Pos(52);
          umesg3                   Char(30) Pos(103);
       End-DS;

       // Program status data structure

       Dcl-DS sds                      PSDS;
          wsid                     Char(10) Pos(244);
          user                     Char(10) Pos(254);
          pgm                          *PROC;
          ustat                   Zoned(5:0) Pos(11);
          usrcln                   Char(8) Pos(21);
          uroutn                   Char(8) Pos(29);
          msgid                    Char(7) Pos(40);
          ulib                     Char(10) Pos(81);
          umsgtx                   Char(80) Pos(91);
          ufile                    Char(8) Pos(201);
          ufstat                   Char(5) Pos(209);
          ufsrcl                   Char(8) Pos(228);
          ujobn                   Zoned(6:0) Pos(264);
          ucdat                   Zoned(6:0) Pos(288);
          uctim                   Zoned(6:0) Pos(294);
       End-DS;
       Dcl-S pindicators        Pointer inz(%addr(*in));
       Dcl-DS indicators            Len(99) based(pindicators);
       End-DS;
       // -*ENTRY-----------------------------
       Dcl-PR p_mitmtyp                extpgm('MITMTYP');
          *N                       Char(3);                                 /// prm003
       End-PR;
       //  -----------------------------------
       Dcl-PI p_mitmtyp;
          prm003                   Char(3);
       End-PI;
       //  -----------------------------------
       // ------------------------------------------------------
       Dcl-PR p_bsecims                extpgm('BSECIMS');
          *N                       Char(1);                                 /// bat
          *N                       Char(3);                                 /// prm003
          *N                       Char(10);                                /// wkuser
          *N                       Char(1);                                 /// pract
          *N                       Char(1);                                 /// pralwd
       End-PR;
       // ---ASSET GENERATED CLP TO HANDLE MSG - CLMSG----------
       Dcl-PR p_clmsg                  extpgm('CLMSG');
          *N                       Char(1);                                 /// msgact
          *N                       Char(7);                                 /// msgid
          *N                       Char(10);                                /// msgf
          *N                       Char(10);                                /// msgfl
          *N                       Char(132);                               /// msgdta
       End-PR;
       //*******************************************************************
       //            P a r a m e t e r     L i s t
       //*******************************************************************

       //    p0001         plist
       //                  parm                    bat
       //                  parm                    prm003            3
       //                  parm                    wkuser
       //                  parm                    pract
       //                  parm                    pralwd

       //    *entry        plist
       //                  parm                    prm003

       //    pmsgcl        plist
       //                  parm                    msgact            1
       //                  parm                    msgid
       //                  parm                    msgf             10
       //                  parm                    msgfl            10
       //                  parm                    msgdta

       //    phelp         plist
       //                  parm                    appset
       //                  parm                    apptyp
       //                  parm                    apppgm
       //                  parm                    appscr
       //                  parm                    approw
       //                  parm                    appcol
       //*******************************************************************
       //                   K e y      L i s t
       //*******************************************************************

       // >>>>> Automatically removed by conversion
       //C     k0001         klist
       //C                   kfld                    kyco01

       // >>>>> Automatically removed by conversion
       //C     k0002         klist
       //C                   kfld                    kaco01
       //C                   kfld                    kait02

       // >>>>> Automatically removed by conversion
       //C     k0003         klist
       //C                   kfld                    kaco01

       //*******************************************************************
       //        V a r i a b l e s     D e c l a r a t i o n
       //*******************************************************************
       If lrflag <> 'N';
          narg1 = *zeros;
          nrslt = *zeros;
          datfmt = *blanks;
          svdat = *zeros;
          svyy = *zeros;
          svmm = *zeros;
          svdd = *zeros;
          svdays = *zeros;
          svleap = *zeros;
          feb = *zeros;
          c1 = *zeros;
          svcy = *zeros;
          svcc = *zeros;
          chkvar = 1;
          bat = *blanks;
          z1 = *zeros;
          extscr = *zeros;
          fl0001 = *zeros;
          f12flg = *zeros;
          z2 = *zeros;
          loopct = *zeros;
          mntflg = *zeros;
          moddsc = *blanks;
          mode = *zeros;
          posflg = *zeros;
          pract = *blanks;
          pralwd = *blanks;
          prm001 = *blanks;
          prm002 = *blanks;
          ps0102 = *blanks;
          svk001 = *blanks;
          svk002 = *blanks;
          updflg = *zeros;
          wkuser = *blanks;
          lck02 = *zeros;
          lck01 = *zeros;
          ioflag = 'N';
          scrnid = *blanks;
          in01 = *blanks;
          dspws = *blanks;                                                   // -dsply- replaced
          ins01 = *blanks;
          swrd02 = *blanks;
          kyco01 = *blanks;
          swrd01 = *blanks;
          kaco01 = *blanks;
          kait02 = *blanks;
          cmdkey = 'N';
          validf = *zeros;
          listf = *zeros;
          x1cdat = *zeros;
          msgflg = 'N';
          appset = *blanks;
          EvalR appset = '  ';                                               // Check conversion
          apptyp = 'D';
          appscr = *blanks;
          approw = *zeros;
          appcol = *zeros;
          uercnt = *zeros;
          ursume = *blanks;
          appset = 'LANDXAPP';
          apppgm = pgm;
          xrn01 = 1;
          x0 = *zeros;
          x1 = *zeros;
          sp = *zeros;
          ct = *zeros;
          srn01 = *zeros;
          drn01 = *zeros;
          ern01 = *zeros;
          wcntr = *zeros;
          wgetr = *zeros;
          nrslt0 = *zeros;
          svs01 = *zeros;
          wrrn01 = *zeros;
          wadj01 = *zeros;
          wlcntr = *zeros;
          wlgetr = *zeros;
          swexbl = *zeros;
          swskpr = *zeros;
          nxtrrn = *zeros;
          xyes = 1;
          callst = 1;
          xno = *zeros;
          wfile# = *zeros;
       EndIf;
       lrflag = *blanks;
       *in60 = *off;

      /EJECT
       //*******************************************************************
       //        M a i n l i n e      R o u t i n e
       //*******************************************************************
       Exsr smain;

      /EJECT
       //****************************************************************
       // SMAIN - Main flow of the program.
       //****************************************************************
       BegSr smain;


          // Clear Message Subfile.
          msgact = 'C';
          Exsr smsg;
          Write msgctl;
          //      *------------------------------------------*
          //      *  Process all screens.
          //      *------------------------------------------*
          scrnid = 'SC0001';
          DoW not *inlr;
             Select;
                When scrnid = 'SC0001';
                   Exsr s001;
                When scrnid = 'SC0002';
                   Exsr s002;
                When scrnid = 'SEND';
                   Exsr send;
             EndSl;
          EndDo;
       EndSr;
      /EJECT
       //****************************************************************
       // SEND - END of program.
       //****************************************************************
       BegSr send;

          If lrflag = 'Y'  or
          lrflag = *blank;
             *inlr = *on;
          EndIf;                                                             // LRFLAG EQ 'Y'
          scrnid = *blanks;
          Return;
       EndSr;
      /EJECT
       //****************************************************************
       // S001 - List Screen for ITMTYP
       //****************************************************************
       BegSr s001;

          dspws = 'Y';                                                       // -dsply- replaced
          *in01 = *off;
          *in02 = *off;
          *in03 = *on;
          *in04 = *off;
          *in05 = *off;
          *in64 = *off;
          *in80 = *on;
          // ***  Clear list panel and start display on
          // ***  first record in file. Performed only once
          // ***  at start of program.
          // GETREC d.company,f.company,*eq,prcoyno

          Exsr s003;
          //
          // F12FLG = 0
          f12flg = *zeros;
          // BAITYP = ' '
          xaityp = *blanks;
          // BADESC = ' '
          xadesc = *blanks;
          //
          // Set Key values to parms passed
          // SVK001 = PRcoyno
          svk001 = prm003;
          // SVK002 = ' '
          svk002 = *blanks;
          //
          //
          // Set file for list to first record in file
          // SETLL D.ITMTYP,F.ITMTYP,SVK001,SVK002

          Exsr s004;
          //
          // Fill list Panel
          // EXSUBR S01FWD
          Exsr s01fwd;
          If lrflag <> *blank;
             LeaveSr;
          EndIf;

          DoW dspws = 'Y';                                                   // -dsply- replaced

             *in63 = *on;
             *in65 = *on;
             *in79 = *on;
             *in99 = *off;
             // Write sub-file messages
             If msgflg = 'Y';
                *in99 = *on;
                Write msgctl;
             EndIf;
             Write scr001;
             // Turn off SFLDSP in case of empty subfile
             If rrn01 < 1;
                *in64 = *off;
             Else;
                *in64 = *on;
             EndIf;
             If ern01 = 1;
                *in67 = *on;
             Else;
                *in67 = *off;
             EndIf;
             drn01 = rrn01;
             Exfmt scr001c1;
             If sflrrn > 0  and
             drn01 <> 0;
                rrn01 = sflrrn;
                drn01 = sflrrn;
             EndIf;
             *in01 = *off;
             *in03 = *on;
             *in05 = *off;
             *in80 = *on;
             cmdkey = 'N';

             // Clear Message Subfile.
             If msgflg = 'Y';
                msgact = 'C';
                Exsr smsg;
                Write msgctl;
             EndIf;

             // Exit

             If *inkc  and
             cmdkey = 'N';
                // *** Exit program on function key 3
                //
                // EXTPGM
                lrflag = 'Y';
                scrnid = *blanks;
                scrnid = 'SEND';
                LeaveSr;
                cmdkey = 'Y';
             EndIf;

             // Cancel

             If *inkl  and
             cmdkey = 'N';
                // *** Exit program on function key 12
                //
                // EXTPGM
                lrflag = 'Y';
                scrnid = *blanks;
                scrnid = 'SEND';
                LeaveSr;
                cmdkey = 'Y';
             EndIf;
             If cmdkey = 'N';

                // Create

                If *inkf  and
                cmdkey = 'N';
                   // *** Process ADD Request on function key 6
                   //
                   // MODE = 6
                   mode = 6;
                   // EXSCR SC0002
                   sp = sp + 1;
                   sid(sp) = 'SC0001  ';
                   sty(sp) = 'F';
                   in01 = indicators;
                   Exsr s002;
                   sid(sp) = *blanks;
                   sty(sp) = *blanks;
                   sp = sp - 1;
                   If lrflag <> *blank;
                      LeaveSr;
                   EndIf;
                   indicators = in01;
                   *in79 = *on;
                   // SETLL D.ITMTYP,F.ITMTYP,SVK001,SVK002

                   Exsr s004;
                   // EXSUBR S01FWD
                   Exsr s01fwd;
                   If lrflag <> *blank;
                      LeaveSr;
                   EndIf;
                   cmdkey = 'Y';
                EndIf;

                // Bkwd

                If *in62  and
                cmdkey = 'N';
                   // *** Scroll information backwards
                   //     1. Check for any selected records.
                   // EXSUBR S01EDT
                   Exsr s01edt;
                   If lrflag <> *blank;
                      LeaveSr;
                   EndIf;
                   //     2. Fill panel.
                   // EXSUBR S01BKW
                   Exsr s01bkw;
                   If lrflag <> *blank;
                      LeaveSr;
                   EndIf;
                   cmdkey = 'Y';
                EndIf;

                // Fwd

                If *in61  and
                cmdkey = 'N';
                   // *** Scroll information forwards
                   //     1. Check for selected records.
                   // EXSUBR S01EDT
                   Exsr s01edt;
                   If lrflag <> *blank;
                      LeaveSr;
                   EndIf;
                   //     2. Fill Panel.
                   // EXSUBR S01FWD
                   Exsr s01fwd;
                   If lrflag <> *blank;
                      LeaveSr;
                   EndIf;
                   cmdkey = 'Y';
                EndIf;
                If cmdkey = 'N';
                   // *** Check for any selected records on post-enter.
                   //
                   // Reset reposition flag and check for any
                   // selected records.
                   // POSFLG = 0
                   posflg = *zeros;
                   // EXSUBR S01EDT
                   Exsr s01edt;
                   If lrflag <> *blank;
                      LeaveSr;
                   EndIf;
                   // *** Check for reposition
                   // *** Check field only if not passed as parm.
                   //
                   // IF (PS0102<>' ')
                   If ps0102 <> *blanks;
                      // POSFLG = 1
                      posflg = 1;
                      // END
                   EndIf;
                   //
                   // If reposition values entered, set key
                   // values to reposition values.
                   // IF POSFLG=1
                   If posflg = 1;
                      // SVK002 = PS0102
                      svk002 = ps0102;
                      // Reset/clear reposition values to parms passed
                      // PS0102 = ' '
                      ps0102 = *blanks;
                      // END
                   EndIf;
                   //
                   // Refresh screen if record selected or
                   // if reposition was selected.
                   // IF POSFLG=1 | updflg=1
                   If posflg = 1  or
                   updflg = 1;
                      //
                      // Set pointer to file.
                      // SETLL D.ITMTYP,F.ITMTYP,SVK001,SVK002

                      Exsr s004;
                      //
                      // Fill Panel.
                      // EXSUBR S01FWD
                      Exsr s01fwd;
                      If lrflag <> *blank;
                         LeaveSr;
                      EndIf;
                      // END
                   EndIf;
                EndIf;
             EndIf;
          EndDo;
       EndSr;
      /EJECT
       //****************************************************************
       // S002 - Detail Screen for ITMTYP
       //****************************************************************
       BegSr s002;

          dspws = 'Y';                                                       // -dsply- replaced
          *in01 = *off;
          *in02 = *off;
          *in03 = *off;
          *in04 = *off;
          *in05 = *off;
          *in06 = *off;
          *in07 = *off;
          *in80 = *on;
          // *** Check user allowed action             ibutes,
          // BAT = 'I'
          bat = 'I';
          // WKUSER = *userid
          wkuser = *blanks;
          wkuser = user;
          // PRACT = %ctc(mode)
          //  Convert To Character
          pract = *blanks;
          pract = %char(mode);                                               // Check %char conv
          // PRALWD = ' '
          pralwd = *blanks;
          // CALL 'BSECIMS',bat,prcoyno,wkuser,pract,pralwd
          callst = 1;

          CallP(E) p_BSECIMS(
                    bat:
                    prm003:
                    wkuser:
                    pract:
                    pralwd);

          If %error;
             *in93 = *on;
          EndIf;

          //                  call      'BSECIMS'     p0001                  93
          *in79 = *on;
          If *in93;
             msgflg = 'Y';
             callst = *zeros;
          EndIf;
          // IF pralwd = 'N'
          If pralwd = 'N';
             // DSPERR *NONE,'USR0001','ERRORS'
             msgid = 'USR0001';
             msgf = 'ERRORS';
             msgact = 'A';
             Exsr smsg;
             // EXTSCR
             LeaveSr;
             // END
          EndIf;
          // *** Clear detail screens, setup field attributes,
          // *** and retrieve field values from files.
          //
          // Refresh exit flag at start of detail
          // EXTSCR = 0
          extscr = *zeros;
          //
          // Process Edit, Delete, and Display action choices
          // IF MODE=2 | MODE=4 | MODE=5
          If mode = 2  or
          mode = 4  or
          mode = 5;
             //
             // Save Key values prior to clearing screens,
             // otherwise, keys will be lost when screen is
             // cleared.
             // SVK001 = BACOYNO
             svk001 = wk0001;
             // SVK002 = BAITYP
             svk002 = xaityp;
             // BAITYP = ' '
             xaityp = *blanks;
             // BADESC = ' '
             xadesc = *blanks;
             // BACOYNO = SVK001
             wk0001 = svk001;
             // BAITYP = SVK002
             xaityp = svk002;
             //
             // Revise, Delete, and Display, protect
             // key fields from being changed.
             // FLDATR baityp,*pr
             #pr = 'X';
             fldnam = 'XAITYP  ';
             fldinx = *zeros;
             fldscr = *blanks;
             fldscr = 'SC0002  ';
             Exsr satrib;
             //
             // Get selected record for edit function.
             // IF MODE=2
             If mode = 2;
                // FLDATR badesc,*ul
                #ul = 'X';
                fldnam = 'XADESC  ';
                fldinx = *zeros;
                fldscr = *blanks;
                fldscr = 'SC0002  ';
                Exsr satrib;
                // GETREC D.ITMTYP,F.ITMTYP,*lock,*eq,SVK001,SVK002

                Exsr s005;
                //
                // If record locked, return to previous
                // screen and display lock message from OS/400.
                // IF %lock(D.ITMTYP,F.ITMTYP)=*yes
                //  Lock status on file
                Exsr slock;
                If lck01 = *zero;
                   // EXTSCR = 1
                   extscr = 1;
                   // EXTSCR
                   LeaveSr;
                   // END
                EndIf;
                //
                // If record not found, Display message
                // and return.
                // IF %sts(D.ITMTYP,F.ITMTYP)=*no
                //  Status of last file I/O
                If sts01 <> *zero;
                   // DSPERR *none,'Record not found for Edit'
                   msgdta = c0001;
                   msgid = 'CPF9898';
                   msgact = 'A';
                   Exsr smsg;
                   // EXTSCR = 1
                   extscr = 1;
                   // EXTSCR
                   LeaveSr;
                   // END
                EndIf;
                //
                // Get secondary records if any were selected.
                // MODDSC = 'CHANGE'
                moddsc = *blanks;
                moddsc = 'CHANGE';
                // ELSE
             Else;
                //
                // Protect Data fields from being changed for
                // delete and display action choices.
                // FLDATR badesc,*pr
                #pr = 'X';
                fldnam = 'XADESC  ';
                fldinx = *zeros;
                fldscr = *blanks;
                fldscr = 'SC0002  ';
                Exsr satrib;
                //
                // Get selected record for delete function.
                // IF MODE=4
                If mode = 4;
                   // GETREC D.ITMTYP,F.ITMTYP,*lock,*eq,SVK001,SVK002

                   Exsr s005;
                   //
                   // If record locked, return to previous
                   // screen and display lock message from OS/400.
                   // IF %lock(D.ITMTYP,F.ITMTYP)=*yes
                   //  Lock status on file
                   Exsr slock;
                   If lck01 = *zero;
                      // EXTSCR = 1
                      extscr = 1;
                      // EXTSCR
                      LeaveSr;
                      // END
                   EndIf;
                   //
                   // If record not found, Display message
                   // and return.
                   // IF %sts(D.ITMTYP,F.ITMTYP)=*no
                   //  Status of last file I/O
                   If sts01 <> *zero;
                      // DSPERR *none,'Record not found for Delete'
                      msgdta = c0002;
                      msgid = 'CPF9898';
                      msgact = 'A';
                      Exsr smsg;
                      // EXTSCR = 1
                      extscr = 1;
                      // EXTSCR
                      LeaveSr;
                      // END
                   EndIf;
                   //
                   // Get secondary records if any were selected.
                   // MODDSC = 'DELETE'
                   moddsc = *blanks;
                   moddsc = 'de1ete';                                        // -delete - replaced
                   // ELSE
                Else;
                   //
                   // Get selected record for display function.
                   // GETREC D.ITMTYP,F.ITMTYP,*eq,SVK001,SVK002

                   Exsr s006;
                   //
                   // If record not found, Display message
                   // and return.
                   // IF %sts(D.ITMTYP,F.ITMTYP)=*no
                   //  Status of last file I/O
                   If sts01 <> *zero;
                      // DSPERR *none,'Record not found for Display'
                      msgdta = c0003;
                      msgid = 'CPF9898';
                      msgact = 'A';
                      Exsr smsg;
                      // EXTSCR = 1
                      extscr = 1;
                      // EXTSCR
                      LeaveSr;
                      // END
                   EndIf;
                   //
                   // Get secondary records if any were selected.
                   // MODDSC = 'DISPLAY'
                   moddsc = *blanks;
                   moddsc = 'DISPLAY';
                   // END
                EndIf;
                // END
             EndIf;
             // ELSE
          Else;
             //
             //
             // Clear screens for Add function.
             // FLDATR baityp,*ul
             #ul = 'X';
             fldnam = 'XAITYP  ';
             fldinx = *zeros;
             fldscr = *blanks;
             fldscr = 'SC0002  ';
             Exsr satrib;
             // FLDATR badesc,*ul
             #ul = 'X';
             fldnam = 'XADESC  ';
             fldinx = *zeros;
             fldscr = *blanks;
             fldscr = 'SC0002  ';
             Exsr satrib;
             // BACOYNO = prcoyno
             wk0001 = prm003;
             // BAITYP = ' '
             xaityp = *blanks;
             // BADESC = ' '
             xadesc = *blanks;
             // MODDSC = 'ADD'
             moddsc = *blanks;
             moddsc = 'ADD';
             // END
          EndIf;
          // F12FLG = 0
          f12flg = *zeros;

          DoW dspws = 'Y';                                                   // -dsply- replaced

             *in79 = *on;
             *in99 = *off;
             // Write sub-file messages
             If msgflg = 'Y';
                *in99 = *on;
                Write msgctl;
             EndIf;
             Exfmt scr002;
             *in01 = *off;
             *in04 = *off;
             *in07 = *off;
             *in80 = *on;
             cmdkey = 'N';

             // Clear Message Subfile.
             If msgflg = 'Y';
                msgact = 'C';
                Exsr smsg;
                Write msgctl;
             EndIf;

             // Cancel

             If *inkl  and
             cmdkey = 'N';
                // *** Return to list panel on function key 12
                // Set exit flag to signal previous screen
                // EXTSCR = 1
                extscr = 1;
                //
                // Release record if edit or delete functions
                // IF mode=2 | mode=4
                If mode = 2  or
                mode = 4;
                   // RLSREC D.ITMTYP,F.ITMTYP

                   wfile# = 1;
                   Unlock ITMTYP;                                            // Lo91 Repl 4 bif
                   // END
                EndIf;
                //
                // EXTSCR
                LeaveSr;
                cmdkey = 'Y';
             EndIf;

             // Delete

             If *inkn  and
             cmdkey = 'N';
                // *** Perform updates to file on function key 14
                // ** Delete
                // IF MODE=4
                If mode = 4;
                   // DELETE D.ITMTYP,F.ITMTYP

                   Exsr s007;
                   // IF %STS(D.ITMTYP,F.ITMTYP)=*YES
                   //  Status of last file I/O
                   If sts01 = *zero;
                      // EXTSCR
                      LeaveSr;
                      // END
                   EndIf;
                   // END
                EndIf;
                cmdkey = 'Y';
             EndIf;
             If cmdkey = 'N';
                // Process Screen Validation.
                If chkvar = 1;
                   Exsr s002v;
                EndIf;
                If validf = 1  or
                chkvar = 0;
                   // *** Perform updates to file on function key 14
                   //
                   // IF MODE<>4
                   If mode <> 4;
                      // ** Revise
                      // IF MODE=2
                      If mode = 2;
                         // UPDATE D.ITMTYP,F.ITMTYP

                         Exsr s008;
                         // ELSE
                      Else;
                         //
                         // ** Create
                         // IF MODE=6
                         If mode = 6;
                            // WRITE D.ITMTYP,F.ITMTYP

                            Exsr s009;
                            // ** Set keys for first record to display.
                            // SVK001 = BACOYNO
                            svk001 = wk0001;
                            // SVK002 = BAITYP
                            svk002 = xaityp;
                            // END
                         EndIf;
                         // END
                      EndIf;
                      //
                      // IF %STS(D.ITMTYP,F.ITMTYP)=*YES
                      //  Status of last file I/O
                      If sts01 = *zero;
                         // EXTSCR
                         LeaveSr;
                         // END
                      EndIf;
                      //
                      // END
                   EndIf;
                EndIf;
             EndIf;
          EndDo;
       EndSr;
      /EJECT
       //****************************************************************
       // SREDSP -  Redisplay Windows within stack.
       //****************************************************************
       BegSr sredsp;

          ct = sp;
          DoW ct > 1  and
          sty(ct) <> 'F';
             ct = ct - 1;
          EndDo;

          //  Redisplay Windows within stack.

          DoW ct <= sp  and
          ct > 0;

             If sid(ct) = 'SC0001';
                indicators = in01;
                *in79 = *on;
                *in99 = *on;
                Write scr001;
                Write scr001c1;
             Else;
                If sid(ct) = 'SC0002';
                   *in79 = *on;
                   *in99 = *on;
                   Write scr002;
                EndIf;
             EndIf;

             ct = ct + 1;
          EndDo;

       EndSr;
      /EJECT
       //****************************************************************
       // S01BKW - SCRN SUB
       //****************************************************************
       BegSr s01bkw;

          // ***  Scroll information backward
          //
          // C01 = 0
          z1 = *zeros;
          // ** Clear hidden key arrays used for record
          // ** retrieval.
          // A001 = ' '
          Clear a01;
          Clear a02;
          #pr = 'X';
          #nd = 'X';
          fldnam = 'FL0001  ';
          fldinx = *zeros;
          fldscr = *blanks;
          fldscr = 'SC0001  ';
          Exsr satrib;
          // GETBLK D.ITMTYP,F.ITMTYP,*PV,prcoyno

          Exsr s010;

          kaco01 = *blanks;
          kaco01 = prm003;

          //          ---------------------------------------------------------------
          //          | Initialize Loop
          //          ---------------------------------------------------------------
          wcntr = *zeros;
          wlcntr = 12;
          //          ---------------------------------------------------------------
          //          | Initialize subfile    SCR001S1
          //          ---------------------------------------------------------------
          *in63 = *off;
          *in64 = *off;
          *in65 = *off;
          *in66 = *off;
          Write scr001c1;                                                    // CLEAR SUBFILE
          rrn01 = 0;

          xrn01 = 1;
          srn01 = xrn01;
          *in63 = *on;
          *in64 = *on;
          *in65 = *on;
          *in66 = *off;
          ins01 = indicators;
          //          ---------------------------------------------------------------
          //          | Setup Loop To Retrieve Record
          //          ---------------------------------------------------------------
          DoU swrd01 <> 'Y'  or                                              // RD.SW.ITMTYP
          wcntr >= wlcntr  or
          swexbl <> *zero;
             swskpr = *zeros;
             fl0001 = *zeros;
             xaityp = *blanks;
             xadesc = *blanks;
             wfile# = 1;
             ReadE(EN) (KACO01) ITMTYP;                                      // Lo91Eq90 Repl 4 bif
             If %eof OR                                                      // Chg Ind 90 to bif
             %ERROR;                                                         // Chg Ind 91 to bif
                swrd01 = 'N';
                hrc01 = *zeros;
                hd0002 = *blanks;
                haityp = *blanks;
             Else;
                swrd01 = 'Y';
             EndIf;

             If swrd01 = 'Y';                                                // RD.SW.ITMTYP
                Exsr smvtow;                                                 // MOVE FLD TO WORK

                // FLDATR fl0001,*ds
                #ds = 'X';
                fldnam = 'FL0001  ';
                fldinx = *zeros;
                fldscr = *blanks;
                fldscr = 'SC0001  ';
                Exsr satrib;
                // C01 = C01+1
                nrslt0 = z1 + 1;
                z1=%dec(%subst(%char(nrslt0):1:3):3:0);                      // Check fld overflow
                // ** Save key values in key arrays.
                // A001(C01) = BACOYNO
                a01(z1) = *blanks;
                a01(z1) = wk0001;
                // A002(C01) = BAITYP
                a02(z1) = *blanks;
                a02(z1) = xaityp;
                // ENDBLK
                If swexbl = *zero  and
                swskpr = *zero;
                   wcntr = wcntr + 1;
                   wrrn01 = wcntr;
                   insav1 = indicators;
                   rrn01 = rrn01 + 1;
                   Write SCR001S1;                                           // Lo90Eq   Repl 4 bif
                   xrn01 = xrn01 + 1;
                EndIf;
             EndIf;
          EndDo;
          swexbl = *zeros;
          nxtrrn = rrn01;
          fl0001 = *zeros;
          xaityp = *blanks;
          xadesc = *blanks;
          indicators = ins01;
          *in65 = *off;
          insav1 = indicators;
          wgetr = wcntr;
          DoW wgetr < wlcntr;
             rrn01 = rrn01 + 1;
             Write SCR001S1;                                                 // Lo90Eq   Repl 4 bif
             xrn01 = xrn01 + 1;
             wgetr = wgetr + 1;
          EndDo;
          If nxtrrn > 0;
             Chain(E) NXTRRN SCR001S1;                                       // Hi90Lo   Repl 4 bif
             indicators = insav1;
             *in65 = *on;
             Update SCR001S1;                                                // Lo90 Repl 4 bif
             indicators = ins01;
          EndIf;
          If rrn01 > srn01;
             rrn01 = srn01;
          EndIf;
          Exsr s012;                                                         // CHK EOF

       EndSr;
      /EJECT
       //****************************************************************
       // S01EDT - SCRN SUB
       //****************************************************************
       BegSr s01edt;

          // ** Process Maintenance on Detail Panel (MB)
          // **   1. Check for any selected records, If record
          // **      selected, display detail panel.
          // UPDFLG = 0
          updflg = *zeros;
          // I01 = 0
          z2 = *zeros;
          // DOBLK D.ITMTYP

          srn01 = rrn01;
          rrn01 = 1;
          *in90 = *off;
          *in91 = *off;
          ins01 = indicators;
          If srn01 >= 1;
             DoU *in90  or
             *in91  or
             swexbl <> *zero;
                ReadC(E) SCR001S1;                                           // Lo91Eq90 Repl 4 bif
                If %eof;
                   *in90 = *on;
                EndIf;
                If %error;
                   *in91 = *on;
                EndIf;
                If Not %eof AND                                              // Chg Ind 90 to bif
                Not %ERROR;                                                  // Chg Ind 91 to bif
                   indicators = insav1;
                   *in65 = *on;
                   *in01 = *off;
                   *in03 = *on;
                   *in05 = *off;
                   // I01 = I01+1
                   nrslt0 = z2 + 1;
                   z2=%dec(%subst(%char(nrslt0):1:3):3:0);                   // Check fld overflow
                   //
                   // ** display detail screen
                   // IF (FL0001=2)|(FL0001=4)|(FL0001=5)
                   If fl0001 = 2  or
                   fl0001 = 4  or
                   fl0001 = 5;
                      // MODE = FL0001
                      mode = fl0001;
                      // ** set keys from hidden key arrays.
                      // BACOYNO = A001(I01)
                      wk0001 = a01(z2);
                      // BAITYP = A002(I01)
                      xaityp = a02(z2);
                      // ** Get record and any secondary records.
                      // GETREC D.ITMTYP,F.ITMTYP,*EQ,BACOYNO,BAITYP

                      Exsr s013;
                      // ** Display Screen.
                      // EXSCR SC0002
                      sp = sp + 1;
                      sid(sp) = 'SC0001  ';
                      sty(sp) = 'F';
                      in01 = indicators;
                      Update SCR001S1;                                       // Lo90 Repl 4 bif
                      Exsr s002;
                      sid(sp) = *blanks;
                      sty(sp) = *blanks;
                      sp = sp - 1;
                      If lrflag <> *blank;
                         LeaveSr;
                      EndIf;
                      Chain(E) RRN01 SCR001S1;                               // Hi90Lo91 Repl 4 bif
                      indicators = in01;
                      *in79 = *on;
                      // FL0001 = 0
                      fl0001 = *zeros;
                      // UPDFLG = 1
                      updflg = 1;
                      // END
                   EndIf;
                   // ** If the action choice is not
                   // ** one of the allowed values,
                   // ** display error message.
                   // IF (FL0001<>0)&(UPDFLG=0)
                   If fl0001 <> *zero  and
                   updflg = *zero;
                      // DSPERR FL0001,'Invalid action choice'
                      msgdta = c0004;
                      msgid = 'CPF9898';
                      msgact = 'A';
                      Exsr smsg;
                      dsperr = 'X';
                      fldnam = 'FL0001  ';
                      fldinx = *zeros;
                      fldscr = *blanks;
                      fldscr = 'SC0001  ';
                      Exsr satrib;
                      // END
                   EndIf;
                   // END
                   *in90 = *off;
                   *in91 = *off;
                   insav1 = indicators;
                   Update SCR001S1;                                          // Lo90 Repl 4 bif
                   *in01 = *off;
                   *in03 = *on;
                   *in05 = *off;
                EndIf;
             EndDo;
             swexbl = *zeros;
          EndIf;

          rrn01 = srn01;
          indicators = ins01;



       EndSr;
      /EJECT
       //****************************************************************
       // S01FWD - SCRN SUB
       //****************************************************************
       BegSr s01fwd;

          // *** Scroll information forward
          //
          // C01 = 0
          z1 = *zeros;
          // ** Clear Hidden key arrays used for later
          // ** record retrieval.
          // A001 = ' '
          Clear a01;
          Clear a02;
          #pr = 'X';
          #nd = 'X';
          fldnam = 'FL0001  ';
          fldinx = *zeros;
          fldscr = *blanks;
          fldscr = 'SC0001  ';
          Exsr satrib;
          // GETBLK D.ITMTYP,F.ITMTYP,*Ne,Prcoyno


          kaco01 = *blanks;
          kaco01 = prm003;

          //          ---------------------------------------------------------------
          //          | Initialize Loop
          //          ---------------------------------------------------------------
          wcntr = *zeros;
          wlcntr = 12;
          //          ---------------------------------------------------------------
          //          | Initialize subfile    SCR001S1
          //          ---------------------------------------------------------------
          *in63 = *off;
          *in64 = *off;
          *in65 = *off;
          *in66 = *off;
          Write scr001c1;                                                    // CLEAR SUBFILE
          rrn01 = 0;

          xrn01 = 1;
          srn01 = xrn01;
          *in63 = *on;
          *in64 = *on;
          *in65 = *on;
          *in66 = *off;
          ins01 = indicators;
          //          ---------------------------------------------------------------
          //          | Setup Loop To Retrieve Record
          //          ---------------------------------------------------------------
          DoU swrd01 <> 'Y'  or                                              // RD.SW.ITMTYP
          wcntr >= wlcntr  or
          swexbl <> *zero;
             swskpr = *zeros;
             fl0001 = *zeros;
             xaityp = *blanks;
             xadesc = *blanks;
             wfile# = 1;
             ReadE(EN) (KACO01) ITMTYP;                                      // Lo91Eq90 Repl 4 bif
             If %eof OR                                                      // Chg Ind 90 to bif
             %ERROR;                                                         // Chg Ind 91 to bif
                swrd01 = 'N';
                hrc01 = *zeros;
                hd0002 = *blanks;
                haityp = *blanks;
             Else;
                swrd01 = 'Y';
             EndIf;

             If swrd01 = 'Y';                                                // RD.SW.ITMTYP
                Exsr smvtow;                                                 // MOVE FLD TO WORK
                // FLDATR fl0001,*ds
                #ds = 'X';
                fldnam = 'FL0001  ';
                fldinx = *zeros;
                fldscr = *blanks;
                fldscr = 'SC0001  ';
                Exsr satrib;
                // C01 = C01+1
                nrslt0 = z1 + 1;
                z1=%dec(%subst(%char(nrslt0):1:3):3:0);                      // Check fld overflow
                // ** Save key information in key arrays.
                // A001(C01) = BACOYNO
                a01(z1) = *blanks;
                a01(z1) = wk0001;
                // A002(C01) = BAITYP
                a02(z1) = *blanks;
                a02(z1) = xaityp;
                // ENDBLK
                If swexbl = *zero  and
                swskpr = *zero;
                   wcntr = wcntr + 1;
                   wrrn01 = wcntr;
                   insav1 = indicators;
                   rrn01 = rrn01 + 1;
                   Write SCR001S1;                                           // Lo90Eq   Repl 4 bif
                   xrn01 = xrn01 + 1;
                EndIf;
             EndIf;
          EndDo;
          swexbl = *zeros;
          nxtrrn = rrn01;
          fl0001 = *zeros;
          xaityp = *blanks;
          xadesc = *blanks;
          indicators = ins01;
          *in65 = *off;
          insav1 = indicators;
          wgetr = wcntr;
          DoW wgetr < wlcntr;
             rrn01 = rrn01 + 1;
             Write SCR001S1;                                                 // Lo90Eq   Repl 4 bif
             xrn01 = xrn01 + 1;
             wgetr = wgetr + 1;
          EndDo;
          If nxtrrn > 0;
             Chain(E) NXTRRN SCR001S1;                                       // Hi90Lo   Repl 4 bif
             indicators = insav1;
             *in65 = *on;
             Update SCR001S1;                                                // Lo90 Repl 4 bif
             indicators = ins01;
          EndIf;
          If rrn01 > srn01;
             rrn01 = srn01;
          EndIf;
          Exsr s012;                                                         // RESET FP
          // IF c01 = 0
          If z1 = *zero;
             // EXSUBR s01bkw
             Exsr s01bkw;
             If lrflag <> *blank;
                LeaveSr;
             EndIf;
             // END
          EndIf;

       EndSr;
      /EJECT
       //****************************************************************
       // SMSG - calls message handling program to either clear, add, or
       //        remove messages from message subfile or extracts
       //        messages from message files.
       //****************************************************************
       BegSr smsg;

          // Add message to message subfile

          If msgact = 'A'  or
          msgact = 'R';
             msgflg = 'Y';
          Else;
             // Clear message subfile or extract message from message file.

             If msgact = 'C';
                msgflg = 'N';
             EndIf;
          EndIf;

          If msgact = 'C'  or
          msgact = 'A'  or
          msgact = 'E';

             CallP p_CLMSG(
                    msgact:
                    msgid:
                    msgf:
                    msgfl:
                    msgdta);

             //                  call      'CLMSG'       pmsgcl
             msgid = *blanks;
             msgf = *blanks;
             msgfl = *blanks;
             // Do not clear the message data field if message is extracted
             // from message file
             If msgact <> 'E';
                msgdta = *blanks;
             EndIf;
          EndIf;

       EndSr;
      /EJECT
       //*************************************************************************
       // S003   - GETREC d.company,f.company,*eq,prcoyno
       //*************************************************************************
       BegSr s003;
          wfile# = 2;
          kyco01 = *blanks;
          kyco01 = prm003;
          Chain(E) (KYCO01) COMPANY;                                         // Hi90Lo91 Repl 4 bif
          If Not %FOUND OR                                                   // Chg Ind 90 to bif
          %ERROR;                                                            // Chg Ind 91 to bif
             swrd02 = 'N';
             hrc02 = *zeros;
          Else;
             swrd02 = 'Y';
             Exsr smvtow;                                                    // MOVE FLD TO WORK
          EndIf;


       EndSr;

      /EJECT
       //*************************************************************************
       // S004   - SETLL D.ITMTYP,F.ITMTYP,SVK001,SVK002
       //*************************************************************************
       BegSr s004;
          wfile# = 1;
          swrd01 = 'Y';
          hd0002 = *loval;
          haityp = *loval;

          kaco01 = svk001;
          hd0002 = svk001;
          rn0007 = svk001;
          kait02 = svk002;
          haityp = svk002;
          baityp = svk002;

          SetLL(E) (KACO01:KAIT02) ITMTYP;                                   // Hi  Lo  Eq90 Repl bi
          If Not %EQUAL;                                                     // Chg Ind 90 to bif
             sts01 = 12;
          EndIf;                                                             // *IN90=0
       EndSr;

      /EJECT
       //*************************************************************************
       // S005   - GETREC D.ITMTYP,F.ITMTYP,*lock,*eq,SVK001,SVK002
       //*************************************************************************
       BegSr s005;
          wfile# = 1;
          kaco01 = *blanks;
          kaco01 = svk001;
          kait02 = *blanks;
          kait02 = svk002;
          Chain(E) (KACO01:KAIT02) ITMTYP;                                   // Hi90Lo91 Repl 4 bif
          If Not %FOUND OR                                                   // Chg Ind 90 to bif
          %ERROR;                                                            // Chg Ind 91 to bif

             If %ERROR;                                                      // Chg Ind 91 to bif
                msgflg = 'Y';
             EndIf;

             swrd01 = 'N';
             hrc01 = *zeros;
          Else;
             swrd01 = 'Y';
             Exsr smvtow;                                                    // MOVE FLD TO WORK
          EndIf;


       EndSr;

      /EJECT
       //*************************************************************************
       // S006   - GETREC D.ITMTYP,F.ITMTYP,*eq,SVK001,SVK002
       //*************************************************************************
       BegSr s006;
          wfile# = 1;
          kaco01 = *blanks;
          kaco01 = svk001;
          kait02 = *blanks;
          kait02 = svk002;
          Chain(EN) (KACO01:KAIT02) ITMTYP;                                  // Lo91Eq   Repl 4 bif
          If Not %FOUND OR                                                   // Chg Ind 90 to bif
          %ERROR;                                                            // Chg Ind 91 to bif
             swrd01 = 'N';
             hrc01 = *zeros;
          Else;
             swrd01 = 'Y';
             Exsr smvtow;                                                    // MOVE FLD TO WORK
          EndIf;


       EndSr;

      /EJECT
       //*************************************************************************
       // S007   - DELETE D.ITMTYP,F.ITMTYP
       //*************************************************************************
       BegSr s007;
          *in90 = *off;
          *in91 = *off;
          svs01 = *hival;
          kaco01 = *blanks;
          kaco01 = wk0001;
          kait02 = *blanks;
          kait02 = xaityp;
          SetLL (KACO01:KAIT02) itmtyp;                                      // SETLL  ITMTYP
          //          ---------------------------------------------------------------
          //          | Setup Loop To Delete Record - ITMTYP
          //          ---------------------------------------------------------------
          DoU *in90  or
          *in91;

             wfile# = 1;
             ReadE(E) (KACO01:KAIT02) ITMTYP;                                // Lo91Eq90 Repl 4 bif
             If %eof;                                                        // Set Ind for dou loop
                *in90 = *on;                                                 // Set Ind for dou loop
             EndIf;                                                          // Set Ind for dou loop
             If %error;                                                      // Set Ind for dou loop
                *in91 = *on;                                                 // Set Ind for dou loop
             EndIf;                                                          // Set Ind for dou loop

             If Not %eof AND                                                 // Chg Ind 90 to bif
             Not %ERROR;                                                     // Chg Ind 91 to bif

                Delete ITMTYP;                                               // Lo91 Repl 4 bif
                svs01 = sts01;
                //          ---------------------------------------------------------------
                //          | Send Message To Indicate Delete Status
                //          ---------------------------------------------------------------
                If Not %ERROR;                                               // Chg Ind 91 to bif
                   msgdta = a1(2);
                   msgact = 'A';
                   Exsr smsg;                                                // GET THE MESSAGE
                EndIf;                                                       // END-DEL STATUS

             Else;                                                           // ELSE-READ-FILE
                If *in90;                                                    // NO RCD FOUND
                   msgdta = a1(3);
                   msgact = 'A';
                   Exsr smsg;                                                // GET THE MESSAGE
                Else;
                   msgflg = 'Y';
                EndIf;                                                       // READ KEY FILE FAIL

             EndIf;                                                          // END-READ KEY FILE
          EndDo;                                                             // EMD-DOUNE LOOP
          *in90 = *off;
          *in91 = *off;

          SetLL (KACO01:KAIT02) itmtyp;                                      // RESUME FILE POINTER
          sts01 = svs01;
       EndSr;

      /EJECT
       //*************************************************************************
       // S008   - UPDATE D.ITMTYP,F.ITMTYP
       //*************************************************************************
       BegSr s008;
          wfile# = 1;
          kaco01 = *blanks;
          kaco01 = hd0002;
          kait02 = *blanks;
          kait02 = haityp;
          Chain(E) (KACO01:KAIT02) ITMTYP;                                   // Hi90Lo91 Repl 4 bif

          If %ERROR;                                                         // Chg Ind 91 to bif
             msgflg = 'Y';
          EndIf;

          If %FOUND AND                                                      // Chg Ind 90 to bif
          Not %ERROR;                                                        // Chg Ind 91 to bif

             If rn0007 = wk0001  and
             badesc = xadesc  and
             baityp = xaityp;
                Unlock ITMTYP;                                               // Lo91 Repl 4 bif
             Else;
                Exsr smvtof;                                                 // MOVE FLD TO FILE
                Update ITMTYPF;                                              // Lo90 Repl 4 bif
                If Not %ERROR;                                               // Chg Ind 90 to bif
                   Exsr smvtow;                                              // MOVE FLD TO WORK
                   msgdta = a1(4);
                   msgact = 'A';
                   Exsr smsg;                                                // GET THE MESSAGE
                EndIf;                                                       // END-UPDATE STATUS
             EndIf;                                                          // END-FLD COMPARE


          Else;
             msgdta = a1(5);
             msgact = 'A';
             Exsr smsg;                                                      // GET THE MESSAGE
          EndIf;                                                             // END-STATUS
       EndSr;

      /EJECT
       //*************************************************************************
       // S009   - WRITE D.ITMTYP,F.ITMTYP
       //*************************************************************************
       BegSr s009;
          wfile# = 1;
          Exsr smvtof;                                                       // MOVE FLD TO FILE
          Write ITMTYPF;                                                     // Lo90Eq   Repl 4 bif

          If Not %error;                                                     // Chg Ind 90 to bif
             Exsr smvtow;                                                    // MOVE FLD TO WORK
             msgdta = a1(6);
             msgact = 'A';
             Exsr smsg;                                                      // GET THE MESSAGE
          Else;
             msgdta = a1(7);
             msgact = 'A';
             Exsr smsg;                                                      // GET THE MESSAGE
          EndIf;                                                             // END-STATUS
       EndSr;

      /EJECT
       //*************************************************************************
       // S010   - GETBLK D.ITMTYP,F.ITMTYP,*PV,prcoyno
       //*************************************************************************
       BegSr s010;

          kaco01 = *blanks;
          kaco01 = prm003;

          //          ---------------------------------------------------------------
          //          | Initialize Loop
          //          ---------------------------------------------------------------
          wcntr = *zeros;
          wlcntr = wrrn01;
          wlcntr = wlcntr + wadj01;
          //          ---------------------------------------------------------------
          //          | Setup Loop To Retrieve Record
          //          ---------------------------------------------------------------
          DoU swrd01 <> 'Y'  or                                              // RD.SW.ITMTYP
          wcntr >= wlcntr  or
          swexbl <> *zero;
             swskpr = *zeros;
             wfile# = 1;
             ReadPE(EN) (KACO01) ITMTYP;                                     // Lo91Eq90 Repl 4 bif
             If %eof OR                                                      // Chg Ind 90 to bif
             %ERROR;                                                         // Chg Ind 91 to bif
                swrd01 = 'N';
                hrc01 = *zeros;
                hd0002 = *blanks;
                haityp = *blanks;
             Else;
                swrd01 = 'Y';
             EndIf;

             If swrd01 = 'Y';                                                // RD.SW.ITMTYP
                Exsr smvtow;                                                 // MOVE FLD TO WORK
                wcntr = wcntr + 1;
             EndIf;
          EndDo;
          swexbl = *zeros;
          Exsr s011;                                                         // CHK BOF
       EndSr;

      /EJECT
       //*************************************************************************
       // S011   - Process To Reset File Pointer(BOF) - ITMTYP
       //*************************************************************************
       BegSr s011;

          If swrd01 <> 'Y'  and                                              // RD.SW.ITMTYP
          sts01 <> 1122  and                                                 // RCD LOCK
          sts01 <> 1218;                                                     // RCD LOCK

             swrd01 = 'Y';
             svs01 = sts01;
             kaco01 = *blanks;
             kaco01 = rn0007;
             SetLL (KACO01) itmtyp;
             sts01 = svs01;

             msgdta = a1(8);
             msgact = 'A';
             Exsr smsg;                                                      // GET THE MESSAGE
          EndIf;
       EndSr;

      /EJECT
       //*************************************************************************
       // S012   - Process To Reset File Pointer(EOF) - ITMTYP
       //*************************************************************************
       BegSr s012;

          If swrd01 <> 'Y'  and                                              // RD.SW.ITMTYP
          sts01 <> 1122  and                                                 // RCD LOCK
          sts01 <> 1218;                                                     // RCD LOCK

             swrd01 = 'Y';
             svs01 = sts01;
             kaco01 = *blanks;
             kaco01 = rn0007;
             SetGT (KACO01) itmtyp;
             sts01 = svs01;

             wadj01 = 1;
             If wcntr <> *zero;
                wadj01 = wadj01 + 12;
             EndIf;
             msgdta = a1(9);
             msgact = 'A';
             Exsr smsg;                                                      // GET THE MESSAGE
          Else;
             wadj01 = wrrn01;
          EndIf;
       EndSr;

      /EJECT
       //*************************************************************************
       // S013   - GETREC D.ITMTYP,F.ITMTYP,*EQ,BACOYNO,BAITYP
       //*************************************************************************
       BegSr s013;
          wfile# = 1;
          kaco01 = *blanks;
          kaco01 = wk0001;
          kait02 = *blanks;
          kait02 = xaityp;
          Chain(EN) (KACO01:KAIT02) ITMTYP;                                  // Lo91Eq   Repl 4 bif
          If Not %FOUND OR                                                   // Chg Ind 90 to bif
          %ERROR;                                                            // Chg Ind 91 to bif
             swrd01 = 'N';
             hrc01 = *zeros;
          Else;
             swrd01 = 'Y';
             Exsr smvtow;                                                    // MOVE FLD TO WORK
          EndIf;


       EndSr;

      /EJECT
       //*************************************************************************
       // S002V - Detail Screen for ITMTYP
       // Validation subroutine for -- SC0002
       //*************************************************************************
       BegSr s002v;

          validf = 1;

          If xaityp = a1(1);                                                 // LST VALID/INVALID VA
             listf = 0;
          Else;
             listf = 1;
          EndIf;

          fldinx = 0;
          fldnam = 'XAITYP';
          fldscr = 'SC0002';
          If listf = 1;                                                      // LST VALID/INVALID VA
             dsperr = 'R';
             Exsr satrib;
          Else;
             validf = 0;
             msgid = *blanks;
             msgf = *blanks;
             msgfl = *blanks;
             msgdta = *blanks;
             msgact = 'A';
             msgid = 'FLD0020';
             msgf = 'ERRORS';
             Exsr smsg;                                                      // Exsr error handler
             dsperr = 'X';
             Exsr satrib;
          EndIf;

          If xadesc = a1(1);                                                 // LST VALID/INVALID VA
             listf = 0;
          Else;
             listf = 1;
          EndIf;

          fldinx = 0;
          fldnam = 'XADESC';
          fldscr = 'SC0002';
          If listf = 1;                                                      // LST VALID/INVALID VA
             dsperr = 'R';
             Exsr satrib;
          Else;
             validf = 0;
             msgid = *blanks;
             msgf = *blanks;
             msgfl = *blanks;
             msgdta = *blanks;
             msgact = 'A';
             msgid = 'FLD0010';
             msgf = 'ERRORS';
             Exsr smsg;                                                      // Exsr error handler
             dsperr = 'X';
             Exsr satrib;
          EndIf;
       EndSr;
       //*************************************************************************
      /EJECT
       //****************************************************************
       // *PSSR - Program Execution Errors Handler
       //****************************************************************
       BegSr *pssr;
          If uercnt <> *zero;
             ursume = '*CANCL';
          Else;
             uercnt = 1;
             msgact = 'R';
             msgf = *blanks;
             msgf = 'QCPFMSG';
             msgfl = *blanks;
             msgfl = 'QSYS';
             msgdta = *blanks;
             If umsgtx <> *blanks;
                msgdta = umsgtx;
             Else;
                msgdta = uroutn;
             EndIf;

             If ustat = *zeros;
                ustat = %dec(ufstat:5:0);                                    // Check conversion
                usrcln = ufsrcl;
             EndIf;
             ustat4 = %char(ustat);                                          // << Conv to Alpha

             If msgid = *blanks;
                EvalR msgid = ustat4;                                        // Check conversion
                msgid = 'RPG';
                msgf = 'QRPGMSGE';
             EndIf;


             CallP p_CLMSG(
                    msgact:
                    msgid:
                    msgf:
                    msgfl:
                    msgdta);

             //                  call      'CLMSG'       pmsgcl                   93

             ueropt = '1';
             Exfmt pssr0001;

             If ueropt = '1';
                ursume = '*GETIN  ';
             Else;
                If ueropt = '2';
                   ursume = '*CANCL  ';
                Else;
                   If ueropt = '3';
                      EvalR ursume = '        ';                             // Check conversion
                   EndIf;
                EndIf;
             EndIf;
          EndIf;

          msgid = *blanks;
          uercnt = *zeros;

       EndSr;
       ///EJECT
       //****************************************************************
       // SATRIB - Display Attribute Handler
       //****************************************************************
      /COPY QRPGLESRC,SATRIB
      /EJECT
       //****************************************************************
       // SLOCK - Update Lock Flag
       //****************************************************************
       BegSr slock;
          If sts01 = 1218  or                                                // LOCK(SYS)-ITMTYP
          sts01 = 1122;                                                      // LOCK(ASSET)
             lck01 = *zeros;
          Else;
             lck01 = 1;
          EndIf;
       EndSr;
      /EJECT
       //****************************************************************
       // SFERR - File Exception Handler
       //****************************************************************
       BegSr sferr;
          msgflg = 'Y';
          If wfile# = 1;                                                     // ITMTYP
             If sts01 = 1218;                                                // LOCK(SYS)
                sts01 = 1122;
             Else;
                If sts01 = 1211;                                             // CLOSED FILE
                   Exsr *pssr;
                Else;
                   sts01 = 1121;
                EndIf;
             EndIf;
          EndIf;
          If wfile# = 2;                                                     // COMPANY
             If sts02 = 1218;                                                // LOCK(SYS)
                sts02 = 1122;
             Else;
                If sts02 = 1211;                                             // CLOSED FILE
                   Exsr *pssr;
                Else;
                   sts02 = 1121;
                EndIf;
             EndIf;
          EndIf;
       EndSr;
      /EJECT
       //****************************************************************
       // SMVTOF - Move Fields From Work Area To File(s)
       //****************************************************************
       BegSr smvtof;
          //          ------------------------------------------------------
          //          | Move Fields From Work Area To File - ITMTYP
          //          ------------------------------------------------------
          If wfile# = 01;
             rn0007 = wk0001;
             bacoyno = rn0007;
             badesc = xadesc;
             baityp = xaityp;
          EndIf;
       EndSr;
      /EJECT
       //****************************************************************
       // SMVTOW - Move Fields From File(s) To Work Area
       //****************************************************************
       BegSr smvtow;
          //          ------------------------------------------------------
          //          | Move Fields From File To Work Area - ITMTYP
          //          ------------------------------------------------------
          If wfile# = 01;
             rn0007 = bacoyno;
             wk0001 = rn0007;
             xadesc = badesc;
             xaityp = baityp;
             hrc01 = rec01;
             hd0002 = rn0007;
             haityp = baityp;
          Else;
             //          ------------------------------------------------------
             //          | Move Fields From File To Work Area - COMPANY
             //          ------------------------------------------------------
             If wfile# = 02;
                rn0001 = cycoyno;
                xydesc = cydesc;
                hrc02 = rec02;
                hd0001 = rn0001;
             EndIf;
          EndIf;
       EndSr;
      /EJECT
       //*******************************************************************
       //            C o m p i l e   T i m e   A r r a y
       //               I n i t i a l i z a t i o n
       //*******************************************************************
**   Alpha Constant Array - A1

Record deleted from file IMS Item Type               TP
NO RECORD FOUND TO de1ete FROM FILE IMS ITEM TYPE               TP              -delete - replaced
Record update for file IMS Item Type               TP
Unable to update record for file IMS Item Type               TP
Record added to file IMS Item Type               TP
Unable to add record to file IMS Item Type               TP
The beginning of the file was reached
The end of the file was reached
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XYDESC    0000  05      05
SC0002    XYDESC    0000  07      07
SC0002    XADESC    0000  0103    01  02
SC0002    XAITYP    0000  0406    04  05
SC0001    FL0001    0000  0103    010402               Y
