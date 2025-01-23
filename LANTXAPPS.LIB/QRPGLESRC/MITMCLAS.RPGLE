     H dftactgrp(*no) actgrp(*caller) expropts(*resdecpos)
     H datfmt(*iso) timfmt(*iso) option(*nodebugio)
     F/TITLE MITMCLAS     Work with Item Classes
     ¹********************************************************************
     ¹* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     ¹********************************************************************
     ¹*
     ¹*  Program ID          -    MITMCLAS
     ¹*  Application ID      -    MITMCLAS
     ¹*  Application Name    -        Work with Item Classes
     ¹*  Date Generated      -    Jan 11, 2012
     ¹*
     ¹********************************************************************
     ¹*  Files Usage
     ¹*
     ¹*  ITMCLAS     - (U/DISK   ) IMS Item class parameters   IC
     ¹*  COMPANY     - (I/DISK   ) Company screen headings     CY
     ¹*  MITMCLASD   - (C/WORKSTN) Generated display file
     ¹*
     ¹********************************************************************
     ¹*  Function Of Indicators
     ¹*
     ¹*  SC0001     - List Screen for ITMCLAS
     ¹*
     ¹*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     ¹*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     ¹*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     ¹*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     ¹*  04     - SCR001S1 / FL0001 : DSPATR(ND)
     ¹*  05     - SCR001 / CYDESC : DSPATR(PC)
     ¹*  05     - SCR001 / CYDESC : DSPATR(RI)
     ¹*  63     - SCR001C1 SFLDSPCTL
     ¹*  64     - SCR001C1 SFLDSP
     ¹*  65     - SCR001S1 SFLNXTCHG
     ¹*  66     - SCR001C1 SFLINZ
     ¹*  99     - SCR001 OVERLAY
     ¹* N63     - SCR001C1 SFLCLR
     ¹* N64     - SCR001C1 ERASE(SCR001S1)
     ¹* N67     - SCR001C1 SFLEND
     ¹* N79     - SCR001 PUTOVR
     ¹* N79     - SCR001C1 PUTOVR
     ¹*
     ¹*  SC0002     - Detail Screen for ITMCLAS
     ¹*
     ¹*  01     - SCR002 / ICCLAS : DSPATR(PC)
     ¹*  01     - SCR002 / ICCLAS : DSPATR(RI)
     ¹*  02     - SCR002 / ICCLAS : DSPATR(PR)
     ¹*  03     - SCR002 / ICCLAS : DSPATR(UL)
     ¹*  04     - SCR002 / ICDESC : DSPATR(PC)
     ¹*  04     - SCR002 / ICDESC : DSPATR(RI)
     ¹*  05     - SCR002 / ICDESC : DSPATR(PR)
     ¹*  06     - SCR002 / ICDESC : DSPATR(UL)
     ¹*  07     - SCR002 / CYDESC : DSPATR(PC)
     ¹*  07     - SCR002 / CYDESC : DSPATR(RI)
     ¹*  99     - SCR002 OVERLAY
     ¹* N79     - SCR002 PUTOVR
     ¹*
     ¹********************************************************************
     ¹*  Function Of Subroutines
     ¹*
     ¹* SMAIN - Main flow of the program.
     ¹* SEND - END of program.
     ¹* S001 - List Screen for ITMCLAS
     ¹* S002 - Detail Screen for ITMCLAS
     ¹* SPBACT - Performs all the program begin actions.
     ¹* SREDSP -  Redisplay Windows within stack.
     ¹* S01BKW - SCRN SUB
     ¹* S01EDT - SCRN SUB
     ¹* S01FWD - SCRN SUB
     ¹* SMSG - calls message handling program to either clear, add, or
     ¹* S003   - SETLL D.ITMCLAS,F.ITMCLAS,SVK001,SVK002
     ¹* S004   - GETREC D.ITMCLAS,F.ITMCLAS,*lock,*eq,SVK001,SVK002
     ¹* S005   - GETREC D.ITMCLAS,F.ITMCLAS,*eq,SVK001,SVK002
     ¹* S006   - DELETE D.ITMCLAS,F.ITMCLAS
     ¹* S007   - UPDATE D.ITMCLAS,F.ITMCLAS
     ¹* S008   - WRITE D.ITMCLAS,F.ITMCLAS
     ¹* S009   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     ¹* S010   - GETBLK D.ITMCLAS,F.ITMCLAS,*PV,SVK001
     ¹* S011   - Process To Reset File Pointer(BOF) - ITMCLAS
     ¹* S012   - Process To Reset File Pointer(EOF) - ITMCLAS
     ¹* S013   - GETREC D.ITMCLAS,F.ITMCLAS,*EQ,ICCOYNO,ICCLAS
     ¹* S002V - Detail Screen for ITMCLAS
     ¹* *PSSR - Program Execution Errors Handler
     ¹* SATRIB - Display Attribute Handler
     ¹* SLOCK - Update Lock Flag
     ¹* SFERR - File Exception Handler
     ¹* SMVTOF - Move Fields From Work Area To File(s)
     ¹* SMVTOW - Move Fields From File(s) To Work Area
     ¹*
     ¹********************************************************************
     ¹*            F i l e     S p e c i f i c a t i o n
     ¹********************************************************************
     Fmitmclasd cf   e             workstn
     F                                     sfile(scr001s1:rrn01)
     F                                     infds(dspfds)
     Fcompany   if   e           k disk
     F                                     infds(fids02)
     F                                     infsr(sferr)
     Fitmclas   uf a e           k disk
     F                                     infds(fids01)
     F                                     infsr(sferr)
     ¹*
      //--*STAND ALONE-------------------------------------------
      /COPY QRPGSRC,SATRIBDEF
     D appcol          s              3p 0
     D apppgm          s             10a
     D approw          s              3p 0
     D appscr          s             10a
     D appset          s             10a
     D apptyp          s              1a
     D bat             s              1a
     D callst          s              1p 0                                      CALL STSword
     D chkvar          s              1p 0                                      Perform Valid.
     D cmdkey          s              1a                                         Cmd key pressed fla
     D ct              s              3p 0                                      Counter
     D c1              s              3p 0                                      Numeric wrk fld
     D datfmt          s              3a                                        Date format
     D drn01           s              4p 0                                      Dspl.Rrn
     D dspws           s              1a                                        -dsply- replaced
     D ern01           s              4p 0                                      SFLEND +
     D extscr          s              1p 0
     D feb             s              2p 0                                      NOD in feb/Leap
     D fl0001          s              1p 0
     D f12flg          s              1p 0
     D hd0001          s                   like(rn0001)
     D hrc02           s                   like(rec02)
     D ins01           s             99a                                        Savd.Ind
     D in01            s             99a                                        Save Ind
     D ioflag          s              1a
     D kccl02          s              3a                                        ICCLAS
     D kcco01          s              3a                                        ICCOYNO
     D kyco01          s              3a                                        CYCOYNO
     D lck01           s              1p 0                                      File lock flag
     D lck02           s              1p 0                                      File lock flag
     D listf           s              1p 0                                      List of value flag
     D loopct          s              3p 0
     D lrflag          s              1a
     D mntflg          s              1p 0
     D moddsc          s              8a
     D mode            s              1p 0
     D msgact          s              1a
     D msgf            s             10a
     D msgfl           s             10a
     D msgflg          s              1a                                        Display Msg Flg
     D narg1           s             30p 9                                      Numer argument1
     D nrslt           s             30p 9                                      Numeric result
     D nrslt0          s             30p 9
     D nxtrrn          s              4p 0                                      NXT RRNC        0030
     D posflg          s              1p 0
     D pract           s              1a
     D pralwd          s              1a
     D*prm001          s              3a
     D prm002          s              3a
     D ps0102          s              3a
     D scrnid          s              8a                                        Scrn ID
     D sp              s              3p 0                                      Stk ptr
     D srn01           s              4p 0                                      Savd.Rrn
     D svcc            s              2p 0                                      Save century
     D svcy            s              4p 0                                      Save days
     D svdat           s              6p 0                                      Save date
     D svdays          s              3p 0                                      Save days
     D svdd            s              2p 0                                      Save days
     D svk001          s              3a
     D svk002          s              3a
     D svleap          s              1p 0                                      If leap year
     D svmm            s              2p 0                                      Save month
     D svs01           s              5p 0                                      SV STS          0030
     D svyy            s              2p 0                                      Save year
     D swexbl          s              1p 0                                      @EXITBLK        0030
     D swrd01          s              1a                                        RD STS
     D swrd02          s              1a                                        RD STS IMS Item clas
     D swskpr          s              1p 0                                      @SKIPREC        0030
     D uercnt          s              1p 0
     D updflg          s              1p 0
     D ursume          s              6a
     D validf          s              1p 0                                      Flag for validation
     D wadj01          s              3p 0                                      WRK ADJ
     D wcntr           s              3p 0                                      COUNTER
     D wfile#          s              2p 0                                      FILE#
     D wgetr           s              3p 0                                      COUNTER
     D wkuser          s             10a
     D wk0001          s                   like(rn0007)                         Company number
     D wlcntr          s              5p 0                                      LOOP CT         0030
     D wlgetr          s              5p 0                                      LOOP CT         0030
     D wrrn01          s              3p 0                                      WRK RRN
     D xno             s              1p 0                                      *NO keyword
     D xyes            s              1p 0                                      *YES keyword
     D x0              s              4p 0                                      INDEX 0
     D x1              s              3p 0                                      INDEX 1
     D z1              s              3p 0                                      Loop Counter . . . .
     D z2              s              3p 0                                      Loop Counter . . . .

     ¹********************************************************************
     ¹*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     ¹********************************************************************
     D a01             s              3    dim(12)
     D a02             s              3    dim(12)
     D sid             s              8    dim(99)                              Scrn stk
     D sty             s              1    dim(99)                              Scr type
     D a1              s             80    dim(9) ctdata perrcd(1)              Alpha constants i
     D da3             s              2    dim(17)                              Fld Attr. Wrk Ary
     D da1             s             24    dim(8) ctdata perrcd(1)              Fld Attr. Indic t
     D da2             s             34    dim(8) alt(da1)
     D fids02          ds
     D  sts02            *status
     D  rec02                397    400b 0
     D fids01          ds
     D  sts01            *status
     D  rec01                397    400b 0
     ¹*
     ¹* INFDS for cursor location
     ¹*
     D dspfds          ds
     D  row                  370    370
     D  col                  371    371
     D  sflrrn               378    379b 0
     ¹*
     ¹* Work Data Structure for cursor
     ¹*
     D @ds001          ds
     D  halfwd                 1      2b 0
     D  byte2                  2      2
     ¹*
     ¹* Display Attribute Structure
     ¹*
     D @ds002          ds
     D  fldscr                 1     10
     D  fldnam                11     20
     D  fldinx                21     24  0
     D  dsperr                25     25
     D  #ds                   26     26
     D  #hi                   27     27
     D  #ri                   28     28
     D  #ul                   29     29
     D  #bl                   30     30
     D  #cs                   31     31
     D  #pc                   32     32
     D  #nd                   33     33
     D  #pr                   34     34
     D  #gn                   35     35
     D  #rd                   36     36
     D  #pk                   37     37
     D  #wt                   38     38
     D  #tq                   39     39
     D  #yw                   40     40
     D  #bu                   41     41
     D  da6                   27     41    dim(15)                              Fld Attr. Wrk Ary
     D  #atrib                11     41
     D  #from                 25     28  0
     D  #to                   29     32  0
     D  #clf                  25     32  0
     D  #map                   1     24
     ¹*
     ¹* Named constants
     ¹*
     D c0001           c                   const('Record not found for-
     D                                      Edit')
     ¹*
     ¹* Named constants
     ¹*
     D c0002           c                   const('Record not found for-
     D                                      de1ete')                            -delete - replaced
     ¹*
     ¹* Named constants
     ¹*
     D c0003           c                   const('Record not found for-
     D                                      Display')
     ¹*
     ¹* Named constants
     ¹*
     D c0004           c                   const('Invalid action choic-
     D                                     e')
     ¹*
     ¹* Date Manipulation Data Struct.
     ¹*
     D                 ds
     D  x1cdat                 1      8  0
     D  x1date                 1      6  0
     D  x12                    1      2  0
     D  x34                    3      4  0
     D  x56                    5      6  0
     D  x78                    7      8  0
     ¹*
     ¹* Message data structure
     ¹*
     D @ds003          ds
     D  msgdta                 1    132
     D  umesg1                 1     51
     D  umesg2                52    102
     D  umesg3               103    132
     ¹*
     ¹* Program status data structure
     ¹*
     D sds            sds
     D  wsid                 244    253
     D  user                 254    263
     D  pgm              *proc
     D  ustat                 11     15  0
     D  usrcln                21     28
     D  uroutn                29     36
     D  msgid                 40     46
     D  ulib                  81     90
     D  umsgtx                91    170
     D  ufile                201    208
     D  ufstat               209    213
     D  ufsrcl               228    235
     D  ujobn                264    269  0
     D  ucdat                288    293  0
     D  uctim                294    299  0
     D pindicators     s               *   inz(%addr(*in))
     D indicators      ds            99    based(pindicators)
      //-*ENTRY-----------------------------
     D p_mitmclas      PR                  extpgm('MITMCLAS')
     D                                3a                                        prm001
      // -----------------------------------
     D p_mitmclas      PI
     D prm001                         3a
      // -----------------------------------
      //------------------------------------------------------
     D p_bsecims       PR                  extpgm('BSECIMS')
     D                                1a                                        bat
     D                                3a                                        prm001
     D                               10a                                        wkuser
     D                                1a                                        pract
     D                                1a                                        pralwd
      //---AS/SET - AS/400 Software Engineering Technology----
     D p_clmsg         PR                  extpgm('CLMSG')
     D                                1a                                        msgact
     D                                7a                                        msgid
     D                               10a                                        msgf
     D                               10a                                        msgfl
     D                              132a                                        msgdta
     Icompanyf
     I              cycoyno                     rn0001
     I              cyempcol                    rn0002
     I              cyemphead                   rn0003
     I              cyprdhead                   rn0004
     I              cyrefhead                   rn0005
     I              cysdesc                     rn0006
     Iitmclasf
     I              iccoyno                     rn0007
      ********************************************************************
      *                   K e y      L i s t
      ********************************************************************
      *
      /FREE

         // *******************************************************************
         // V a r i a b l e s     D e c l a r a t i o n
         // *******************************************************************
         if lrflag <> 'N';
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
            dspws = *blanks;                                                 //-dsply- replaced
            ins01 = *blanks;
            swrd01 = *blanks;
            kcco01 = *blanks;
            kccl02 = *blanks;
            swrd02 = *blanks;
            kyco01 = *blanks;
            cmdkey = 'N';
            validf = *zeros;
            listf = *zeros;
            x1cdat = *zeros;
            msgflg = 'N';
            appset = *blanks;
            evalr appset = *blanks;                                          //Check conversion
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
         endif;
         lrflag = *blanks;
         *in60 = *off;


         // *******************************************************************
         // M a i n l i n e      R o u t i n e
         // *******************************************************************
         exsr smain;


         // ****************************************************************
         // SMAIN - Main flow of the program.
         // ****************************************************************
         begsr SMAIN;


            // Clear Message Subfile.
            msgact = 'C';
            exsr smsg;
            write msgctl;
            // *------------------------------------------*
            // *  Process all screens.                    *
            // *------------------------------------------*
            scrnid = 'SC0001';
            exsr spbact;
            dow not *inlr;
               select;
               when scrnid = 'SC0001';
                  exsr s001;
               when scrnid = 'SC0002';
                  exsr s002;
               when scrnid = 'SEND';
                  exsr send;
               endsl;
            enddo;
         ENDSR;

         // ****************************************************************
         // SEND - END of program.
         // ****************************************************************
         begsr SEND;

            if lrflag = 'Y'  or
               lrflag = *blank;
               *inlr = *on;
            endif;                                                           //LRFLAG EQ 'Y'
            scrnid = *blanks;
            return;
         ENDSR;

         // ****************************************************************
         // S001 - List Screen for ITMCLAS
         // ****************************************************************
         begsr S001;

            dspws = 'Y';                                                     //-dsply- replaced
            *in01 = *off;
            *in02 = *off;
            *in03 = *on;
            *in04 = *off;
            *in05 = *off;
            *in64 = *off;
            *in80 = *on;
            // *
            // *** Get Company Name at start.
            // ***  Clear list panel and start display on
            // ***  first record in file. Performed only once
            // ***  at start of program.
            // *
            // F12FLG = 0
            f12flg = *zeros;
            // ICCLAS = ' '
            xcclas = *blanks;
            // ICDESC = ' '
            xcdesc = *blanks;
            // *
            // Set Key values to parms passed
            // SVK001 = PRM001
            svk001 = prm001;
            // SVK002 = PRM002
            svk002 = prm002;
            // *
            // Set file for list to first record in file
            // SETLL D.ITMCLAS,F.ITMCLAS,SVK001,SVK002

            exsr s003;
            // *
            // Fill list Panel
            // EXSUBR S01FWD
            exsr s01fwd;
            if lrflag <> *blank;
               leavesr;
            endif;

            dow dspws = 'Y';                                                 //-dsply- replaced

               *in63 = *on;
               *in65 = *on;
               *in79 = *on;
               *in99 = *off;
               // Write sub-file messages
               if msgflg = 'Y';
                  *in99 = *on;
                  write msgctl;
               endif;
               write scr001;
               // Turn off SFLDSP in case of empty subfile
               if rrn01 < 1;
                  *in64 = *off;
                  else;
                  *in64 = *on;
               endif;
               if ern01 = 1;
                  *in67 = *on;
                  else;
                  *in67 = *off;
               endif;
               drn01 = rrn01;
               exfmt scr001c1;
               if sflrrn > 0  and
                  drn01 <> 0;
                  rrn01 = sflrrn;
                  drn01 = sflrrn;
               endif;
               *in01 = *off;
               *in03 = *on;
               *in05 = *off;
               *in80 = *on;
               cmdkey = 'N';

               // Clear Message Subfile.
               if msgflg = 'Y';
                  msgact = 'C';
                  exsr smsg;
                  write msgctl;
               endif;

               // Exit

               if *inkc  and
                  cmdkey = 'N';
                  // *** Exit program on function key 3
                  // *
                  // EXTPGM                                                        *
                  lrflag = 'Y';
                  scrnid = *blanks;
                  scrnid = 'SEND';
                  leavesr;
                  cmdkey = 'Y';
               endif;

               // Cancel

               if *inkl  and
                  cmdkey = 'N';
                  // *** Exit program on function key 12
                  // *
                  // EXTPGM                                                        *
                  lrflag = 'Y';
                  scrnid = *blanks;
                  scrnid = 'SEND';
                  leavesr;
                  cmdkey = 'Y';
               endif;
               if cmdkey = 'N';

                  // Create

                  if *inkf  and
                     cmdkey = 'N';
                     // *** Process ADD Request on function key 6
                     // *
                     // MODE = 6
                     mode = 6;
                     // EXSCR SC0002
                     sp = sp + 1;
                     sid(sp) = 'SC0001  ';
                     sty(sp) = 'F';
                     in01 = indicators;
                     exsr s002;
                     sid(sp) = *blanks;
                     sty(sp) = *blanks;
                     sp = sp - 1;
                     if lrflag <> *blank;
                        leavesr;
                     endif;
                     indicators = in01;
                     *in79 = *on;
                     // SETLL D.ITMCLAS,F.ITMCLAS,SVK001,SVK002

                     exsr s003;
                     // EXSUBR S01FWD
                     exsr s01fwd;
                     if lrflag <> *blank;
                        leavesr;
                     endif;
                     cmdkey = 'Y';
                  endif;

                  // Bkwd

                  if *in62  and
                     cmdkey = 'N';
                     // *** Scroll information backwards
                     // 1. Check for any selected records.
                     // EXSUBR S01EDT
                     exsr s01edt;
                     if lrflag <> *blank;
                        leavesr;
                     endif;
                     // 2. Fill panel.
                     // EXSUBR S01BKW
                     exsr s01bkw;
                     if lrflag <> *blank;
                        leavesr;
                     endif;
                     cmdkey = 'Y';
                  endif;

                  // Fwd

                  if *in61  and
                     cmdkey = 'N';
                     // *** Scroll information forwards
                     // 1. Check for selected records.
                     // EXSUBR S01EDT
                     exsr s01edt;
                     if lrflag <> *blank;
                        leavesr;
                     endif;
                     // 2. Fill Panel.
                     // EXSUBR S01FWD
                     exsr s01fwd;
                     if lrflag <> *blank;
                        leavesr;
                     endif;
                     cmdkey = 'Y';
                  endif;
                  if cmdkey = 'N';
                     // *** Check for any selected records on post-enter.
                     // *
                     // Reset reposition flag and check for any
                     // selected records.
                     // POSFLG = 0
                     posflg = *zeros;
                     // EXSUBR S01EDT
                     exsr s01edt;
                     if lrflag <> *blank;
                        leavesr;
                     endif;
                     // *** Check for reposition
                     // *** Check field only if not passed as parm.
                     // *
                     // IF (PS0102<>' ')
                     if ps0102 <> *blanks;
                        // POSFLG = 1
                        posflg = 1;
                        // END                                                           *
                     endif;
                     // *
                     // *
                     // If reposition values entered, set key
                     // values to reposition values.
                     // IF POSFLG=1
                     if posflg = 1;
                        // SVK002 = PS0102
                        svk002 = ps0102;
                        // Reset/clear reposition values to parms passed
                        // PS0102 = ' '
                        ps0102 = *blanks;
                        // END                                                           *
                     endif;
                     // *
                     // Refresh screen if record selected or
                     // if reposition was selected.
                     // IF POSFLG=1 | updflg=1
                     if posflg = 1  or
                        updflg = 1;
                        // *
                        // Set pointer to file.
                        // SETLL D.ITMCLAS,F.ITMCLAS,SVK001,SVK002

                        exsr s003;
                        // *
                        // Fill Panel.
                        // EXSUBR S01FWD
                        exsr s01fwd;
                        if lrflag <> *blank;
                           leavesr;
                        endif;
                        // END                                                           *
                     endif;
                  endif;
               endif;
            enddo;
         ENDSR;

         // ****************************************************************
         // S002 - Detail Screen for ITMCLAS
         // ****************************************************************
         begsr S002;

            dspws = 'Y';                                                     //-dsply- replaced
            *in01 = *off;
            *in02 = *off;
            *in03 = *off;
            *in04 = *off;
            *in05 = *off;
            *in06 = *off;
            *in07 = *off;
            *in80 = *on;
            // *** Check user allowed action.
            // BAT = 'I'
            bat = 'I';
            // WKUSER = *userid
            wkuser = *blanks;
            wkuser = user;
            // PRACT = %ctc(mode)
            // Convert To Character
            pract = *blanks;
            pract = %char(mode);                                             //Check char conv
            // PRALWD = ' '
            pralwd = *blanks;
            // CALL 'BSECIMS',bat,prm001,wkuser,pract,pralwd
            callst = 1;

            callp(e) p_BSECIMS(
                     bat:
                     prm001:
                     wkuser:
                     pract:
                     pralwd);

            if %error;
               *in93 = *on;
            endif;

            // call      'BSECIMS'     p0001                  93
            *in79 = *on;
            if *in93;
               msgflg = 'Y';
               callst = *zeros;
            endif;
            // IF pralwd = 'N'
            if pralwd = 'N';
               // DSPERR *NONE,'USR0001','ERRORS'
               msgid = 'USR0001';
               msgf = 'ERRORS';
               msgact = 'A';
               exsr smsg;
               // EXTSCR                                                        *
               leavesr;
               // END                                                           *
            endif;
            // *** Clear detail screens, setup field attributes,
            // *** and retrieve field values from files.
            // *
            // Refresh exit flag at start of detail
            // EXTSCR = 0
            extscr = *zeros;
            // *
            // Process Edit, Delete, and Display action choices
            // IF MODE=2 | MODE=4 | MODE=5
            if mode = 2  or
               mode = 4  or
               mode = 5;
               // *
               // Save Key values prior to clearing screens,
               // otherwise, keys will be lost when screen is
               // cleared.
               // SVK001 = ICCOYNO
               svk001 = wk0001;
               // SVK002 = ICCLAS
               svk002 = xcclas;
               // ICCLAS = ' '
               xcclas = *blanks;
               // ICDESC = ' '
               xcdesc = *blanks;
               // ICCOYNO = SVK001
               wk0001 = svk001;
               // ICCLAS = SVK002
               xcclas = svk002;
               // *
               // Revise, Delete, and Display, protect
               // key fields from being changed.
               // FLDATR ICCLAS,*PR
               #pr = 'X';
               fldnam = 'XCCLAS  ';
               fldinx = *zeros;
               fldscr = *blanks;
               fldscr = 'SC0002  ';
               exsr satrib;
               // *
               // Get selected record for edit function.
               // IF MODE=2
               if mode = 2;
                  // GETREC D.ITMCLAS,F.ITMCLAS,*lock,*eq,SVK001,SVK002

                  exsr s004;
                  // *
                  // If record locked, return to previous
                  // screen and display lock message from OS/400.
                  // IF %lock(D.ITMCLAS,F.ITMCLAS)=*yes
                  // Lock status on file
                  exsr slock;
                  if lck01 = *zero;
                     // EXTSCR = 1
                     extscr = 1;
                     // EXTSCR                                                        *
                     leavesr;
                     // END                                                           *
                  endif;
                  // *
                  // If record not found, Display message
                  // and return.
                  // IF %sts(D.ITMCLAS,F.ITMCLAS)=*no
                  // Status of last file I/O
                  if sts01 <> *zero;
                     // DSPERR *none,'Record not found for Edit'
                     msgdta = c0001;
                     msgid = 'CPF9898';
                     msgact = 'A';
                     exsr smsg;
                     // EXTSCR = 1
                     extscr = 1;
                     // EXTSCR                                                        *
                     leavesr;
                     // END                                                           *
                  endif;
                  // *
                  // FLDATR ICDESC,*UL
                  #ul = 'X';
                  fldnam = 'XCDESC  ';
                  fldinx = *zeros;
                  fldscr = *blanks;
                  fldscr = 'SC0002  ';
                  exsr satrib;
                  // *
                  // Get secondary records if any were selected.
                  // MODDSC = 'CHANGE'
                  moddsc = *blanks;
                  moddsc = 'CHANGE';
                  // ELSE                                                          *
                  else;
                  // *
                  // Protect Data fields from being changed for
                  // delete and display action choices.
                  // *
                  // Get selected record for delete function.
                  // IF MODE=4
                  if mode = 4;
                     // GETREC D.ITMCLAS,F.ITMCLAS,*lock,*eq,SVK001,SVK002

                     exsr s004;
                     // *
                     // If record locked, return to previous
                     // screen and display lock message from OS/400.
                     // IF %lock(D.ITMCLAS,F.ITMCLAS)=*yes
                     // Lock status on file
                     exsr slock;
                     if lck01 = *zero;
                        // EXTSCR = 1
                        extscr = 1;
                        // EXTSCR                                                        *
                        leavesr;
                        // END                                                           *
                     endif;
                     // *
                     // If record not found, Display message
                     // and return.
                     // IF %sts(D.ITMCLAS,F.ITMCLAS)=*no
                     // Status of last file I/O
                     if sts01 <> *zero;
                        // DSPERR *none,'Record not found for Delete'
                        msgdta = c0002;
                        msgid = 'CPF9898';
                        msgact = 'A';
                        exsr smsg;
                        // EXTSCR = 1
                        extscr = 1;
                        // EXTSCR                                                        *
                        leavesr;
                        // END                                                           *
                     endif;
                     // *
                     // Get secondary records if any were selected.
                     // FLDATR ICDESC,*PR
                     #pr = 'X';
                     fldnam = 'XCDESC  ';
                     fldinx = *zeros;
                     fldscr = *blanks;
                     fldscr = 'SC0002  ';
                     exsr satrib;
                     // MODDSC = 'DELETE'
                     moddsc = *blanks;
                     moddsc = 'de1ete';                                      //-delete - replaced
                     // ELSE                                                          *
                     else;
                     // *
                     // Get selected record for display function.
                     // GETREC D.ITMCLAS,F.ITMCLAS,*eq,SVK001,SVK002

                     exsr s005;
                     // *
                     // If record not found, Display message
                     // and return.
                     // IF %sts(D.ITMCLAS,F.ITMCLAS)=*no
                     // Status of last file I/O
                     if sts01 <> *zero;
                        // DSPERR *none,'Record not found for Display'
                        msgdta = c0003;
                        msgid = 'CPF9898';
                        msgact = 'A';
                        exsr smsg;
                        // EXTSCR = 1
                        extscr = 1;
                        // EXTSCR                                                        *
                        leavesr;
                        // END                                                           *
                     endif;
                     // *
                     // Get secondary records if any were selected.
                     // FLDATR ICDESC,*PR
                     #pr = 'X';
                     fldnam = 'XCDESC  ';
                     fldinx = *zeros;
                     fldscr = *blanks;
                     fldscr = 'SC0002  ';
                     exsr satrib;
                     // MODDSC = 'DISPLAY'
                     moddsc = *blanks;
                     moddsc = 'DISPLAY';
                     // END                                                           *
                  endif;
                  // END                                                           *
               endif;
               // ELSE                                                          *
               else;
               // *
               // *
               // Clear screens for Add function.
               // ICCOYNO = PRM001
               wk0001 = prm001;
               // ICCLAS = ' '
               xcclas = *blanks;
               // ICDESC = ' '
               xcdesc = *blanks;
               // MODDSC = 'ADD'
               moddsc = *blanks;
               moddsc = 'ADD';
               // END                                                           *
            endif;
            // F12FLG = 0
            f12flg = *zeros;
            // *
            // IF MODE = 6
            if mode = 6;
               // FLDATR ICCLAS,*UL
               #ul = 'X';
               fldnam = 'XCCLAS  ';
               fldinx = *zeros;
               fldscr = *blanks;
               fldscr = 'SC0002  ';
               exsr satrib;
               // FLDATR ICDESC,*UL
               #ul = 'X';
               fldnam = 'XCDESC  ';
               fldinx = *zeros;
               fldscr = *blanks;
               fldscr = 'SC0002  ';
               exsr satrib;
               // END                                                           *
            endif;

            dow dspws = 'Y';                                                 //-dsply- replaced

               *in79 = *on;
               *in99 = *off;
               // Write sub-file messages
               if msgflg = 'Y';
                  *in99 = *on;
                  write msgctl;
               endif;
               exfmt scr002;
               *in01 = *off;
               *in04 = *off;
               *in07 = *off;
               *in80 = *on;
               cmdkey = 'N';

               // Clear Message Subfile.
               if msgflg = 'Y';
                  msgact = 'C';
                  exsr smsg;
                  write msgctl;
               endif;

               // Cancel

               if *inkl  and
                  cmdkey = 'N';
                  // *** Return to list panel on function key 12
                  // Set exit flag to signal previous screen
                  // EXTSCR = 1
                  extscr = 1;
                  // *
                  // Release record if edit or delete functions
                  // IF mode=2 | mode=4
                  if mode = 2  or
                     mode = 4;
                     // RLSREC D.ITMCLAS,F.ITMCLAS

                     wfile# = 1;
                     UNLOCK ITMCLAS;                                         //Lo91 Repl 4 bif
                     // END                                                           *
                  endif;
                  // *
                  // EXTSCR                                                        *
                  leavesr;
                  cmdkey = 'Y';
               endif;

               // Delete

               if *inkn  and
                  cmdkey = 'N';
                  // *** Perform delete to file on function key 14
                  // *
                  // ** Delete
                  // IF MODE=4
                  if mode = 4;
                     // DELETE D.ITMCLAS,F.ITMCLAS

                     exsr s006;
                     // *
                     // IF %STS(D.ITMCLAS,F.ITMCLAS)=*YES
                     // Status of last file I/O
                     if sts01 = *zero;
                        // EXTSCR                                                        *
                        leavesr;
                        // END                                                           *
                     endif;
                     // END  ; mode = 4
                  endif;
                  cmdkey = 'Y';
               endif;
               if cmdkey = 'N';
                  // Process Screen Validation.
                  if chkvar = 1;
                     exsr s002v;
                  endif;
                  if validf = 1  or
                     chkvar = 0;
                     // *** Perform updates to file on function key 14
                     // *
                     // ** Revise
                     // IF mode <> 4
                     if mode <> 4;
                        // IF MODE=2
                        if mode = 2;
                           // UPDATE D.ITMCLAS,F.ITMCLAS

                           exsr s007;
                           // ELSE                                                          *
                           else;
                           // *
                           // ** Create
                           // IF MODE=6
                           if mode = 6;
                              // WRITE D.ITMCLAS,F.ITMCLAS

                              exsr s008;
                              // ** Set keys for first record to display.
                              // SVK001 = ICCOYNO
                              svk001 = wk0001;
                              // SVK002 = ICCLAS
                              svk002 = xcclas;
                              // END                                                           *
                           endif;
                           // END                                                           *
                        endif;
                        // *
                        // IF %STS(D.ITMCLAS,F.ITMCLAS)=*YES
                        // Status of last file I/O
                        if sts01 = *zero;
                           // EXTSCR                                                        *
                           leavesr;
                           // END                                                           *
                        endif;
                        // END  ; mode <> 4
                     endif;
                  endif;
               endif;
            enddo;
         ENDSR;

         // ****************************************************************
         // SPBACT - Performs all the program begin actions.
         // ****************************************************************
         begsr SPBACT;

            // PGMBEGACT                                                     *
            // GETREC D.COMPANY,F.COMPANY,*EQ,PRM001

            exsr s009;
            // END                                                           *
         ENDSR;

         // ****************************************************************
         // SREDSP -  Redisplay Windows within stack.
         // ****************************************************************
         begsr SREDSP;

            ct = sp;
            dow ct > 1  and
               sty(ct) <> 'F';
               ct = ct - 1;
            enddo;

            // Redisplay Windows within stack.

            dow ct <= sp  and
               ct > 0;

               if sid(ct) = 'SC0001';
                  *in79 = *on;
                  *in99 = *on;
                  write scr001;
                  write scr001c1;
                  else;
                  if sid(ct) = 'SC0002';
                     *in79 = *on;
                     *in99 = *on;
                     write scr002;
                  endif;
               endif;

               ct = ct + 1;
            enddo;

         ENDSR;

         // ****************************************************************
         // S01BKW - SCRN SUB
         // ****************************************************************
         begsr S01BKW;

            // ***  Scroll information backward
            // *
            // C01 = 0
            z1 = *zeros;
            // ** Clear hidden key arrays used for record
            // ** retrieval.
            // A001 = ' '
            a01 = *blanks;                                                   //Was movea
            // A002 = ' '
            a02 = *blanks;                                                   //Was movea
            // *
            // FLDATR FL0001,*ND,*PR
            #nd = 'X';
            #pr = 'X';
            fldnam = 'FL0001  ';
            fldinx = *zeros;
            fldscr = *blanks;
            fldscr = 'SC0001  ';
            exsr satrib;
            // GETBLK D.ITMCLAS,F.ITMCLAS,*PV,SVK001

            exsr s010;

            kcco01 = *blanks;
            kcco01 = svk001;

            // ---------------------------------------------------------------
            // | Initialize Loop
            // ---------------------------------------------------------------
            wcntr = *zeros;
            wlcntr = 12;
            // ---------------------------------------------------------------
            // | Initialize subfile    SCR001S1
            // ---------------------------------------------------------------
            *in63 = *off;
            *in64 = *off;
            *in65 = *off;
            *in66 = *off;
            write scr001c1;                                                  //CLEAR SUBFILE
            rrn01 = 0;

            xrn01 = 1;
            srn01 = xrn01;
            *in63 = *on;
            *in64 = *on;
            *in65 = *on;
            *in66 = *off;
            ins01 = indicators;
            // ---------------------------------------------------------------
            // | Setup Loop To Retrieve Record
            // ---------------------------------------------------------------
            dou swrd01 <> 'Y'  or                                            //RD.SW.ITMCLAS
               wcntr >= wlcntr  or
               swexbl <> *zero;
               swskpr = *zeros;
               fl0001 = *zeros;
               xcclas = *blanks;
               xcdesc = *blanks;
               wfile# = 1;
               READE(EN) (kcco01) ITMCLAS;                                   //Lo91Eq90 Repl 4 bif
               IF %eof OR                                                    //Chg Ind 90 to bif
                  %ERROR;                                                    //Chg Ind 91 to bif
                  swrd01 = 'N';
                  hrc01 = *zeros;
                  hd0002 = *blanks;
                  hcclas = *blanks;
                  else;
                  swrd01 = 'Y';
               endif;

               if swrd01 = 'Y';                                              //RD.SW.ITMCLAS
                  exsr smvtow;                                               //MOVE FLD TO WORK

                  // FLDATR FL0001,*DS
                  #ds = 'X';
                  fldnam = 'FL0001  ';
                  fldinx = *zeros;
                  fldscr = *blanks;
                  fldscr = 'SC0001  ';
                  exsr satrib;
                  // C01 = C01+1
                  nrslt0 = z1 + 1;
                  z1 = nrslt0;                                               //Check fld overflow
                  // ** Save key values in key arrays.
                  // A001(C01) = ICCOYNO
                  a01(z1) = *blanks;
                  a01(z1) = wk0001;
                  // A002(C01) = ICCLAS
                  a02(z1) = *blanks;
                  a02(z1) = xcclas;
                  // ** Fill any possible work fields in list
                  // ** panel with secondary file fields.
                  // ENDBLK                                                        *
                  if swexbl = *zero  and
                     swskpr = *zero;
                     wcntr = wcntr + 1;
                     wrrn01 = wcntr;
                     insav1 = indicators;
                     rrn01 = rrn01 + 1;
                     WRITE SCR001S1;                                         //Lo90Eq   Repl 4 bif
                     xrn01 = xrn01 + 1;
                  endif;
               endif;
            enddo;
            swexbl = *zeros;
            nxtrrn = rrn01;
            fl0001 = *zeros;
            xcclas = *blanks;
            xcdesc = *blanks;
            indicators = ins01;
            *in65 = *off;
            insav1 = indicators;
            wgetr = wcntr;
            dow wgetr < wlcntr;
               rrn01 = rrn01 + 1;
               WRITE SCR001S1;                                               //Lo90Eq   Repl 4 bif
               xrn01 = xrn01 + 1;
               wgetr = wgetr + 1;
            enddo;
            if nxtrrn > 0;
               chain(e) NXTRRN SCR001S1;                                     //Hi90Lo   Repl 4 bif
               indicators = insav1;
               *in65 = *on;
               UPDATE SCR001S1;                                              //Lo90 Repl 4 bif
               indicators = ins01;
            endif;
            if rrn01 > srn01;
               rrn01 = srn01;
            endif;
            exsr s012;                                                       //CHK EOF

         ENDSR;

         // ****************************************************************
         // S01EDT - SCRN SUB
         // ****************************************************************
         begsr S01EDT;

            // ** Process Maintenance on Detail Panel (MB)
            // **   1. Check for any selected records, If record
            // **      selected, display detail panel.
            // UPDFLG = 0
            updflg = *zeros;
            // I01 = 0
            z2 = *zeros;
            // DOBLK D.ITMCLAS

            srn01 = rrn01;
            rrn01 = 1;
            *in90 = *off;
            *in91 = *off;
            ins01 = indicators;
            if srn01 >= 1;
               dou *in90  or
                  *in91  or
                  swexbl <> *zero;
                  READC(E) SCR001S1;                                         //Lo91Eq90 Repl 4 bif
                  IF %eof;
                     *in90 = *on;
                  ENDIF;
                  IF %error;
                     *in91 = *on;
                  ENDIF;
                  IF Not %eof AND                                            //Chg Ind 90 to bif
                     Not %ERROR;                                             //Chg Ind 91 to bif
                     indicators = insav1;
                     *in65 = *on;
                     *in01 = *off;
                     *in03 = *on;
                     *in05 = *off;
                     // I01 = I01+1
                     nrslt0 = z2 + 1;
                     z2 = nrslt0;                                            //Check fld overflow
                     // *
                     // ** display detail screen
                     // IF (FL0001=2)|(FL0001=4)|(FL0001=5)
                     if fl0001 = 2  or
                        fl0001 = 4  or
                        fl0001 = 5;
                        // MODE = FL0001
                        mode = fl0001;
                        // ** set keys from hidden key arrays.
                        // ICCOYNO = A001(I01)
                        wk0001 = a01(z2);
                        // ICCLAS = A002(I01)
                        xcclas = a02(z2);
                        // ** Get record and any secondary records.
                        // GETREC D.ITMCLAS,F.ITMCLAS,*EQ,ICCOYNO,ICCLAS

                        exsr s013;
                        // ** Display Screen.
                        // EXSCR SC0002
                        sp = sp + 1;
                        sid(sp) = 'SC0001  ';
                        sty(sp) = 'F';
                        in01 = indicators;
                        UPDATE SCR001S1;                                     //Lo90 Repl 4 bif
                        exsr s002;
                        sid(sp) = *blanks;
                        sty(sp) = *blanks;
                        sp = sp - 1;
                        if lrflag <> *blank;
                           leavesr;
                        endif;
                        chain(e) RRN01 SCR001S1;                             //Hi90Lo91 Repl 4 bif
                        indicators = in01;
                        *in79 = *on;
                        // FL0001 = 0
                        fl0001 = *zeros;
                        // UPDFLG = 1
                        updflg = 1;
                        // END                                                           *
                     endif;
                     // ** Process any optional action codes.
                     // 1. Set keys from hidden key arrays.
                     // 2. Get record and any secondary records.
                     // 3. Display Screen.
                     // *
                     // ** If the action choice is not
                     // ** one of the allowed values,
                     // ** display error message.
                     // IF (FL0001<>0)&(UPDFLG=0)
                     if fl0001 <> *zero  and
                        updflg = *zero;
                        // DSPERR FL0001,'Invalid action choice'
                        msgdta = c0004;
                        msgid = 'CPF9898';
                        msgact = 'A';
                        exsr smsg;
                        dsperr = 'X';
                        fldnam = 'FL0001  ';
                        fldinx = *zeros;
                        fldscr = *blanks;
                        fldscr = 'SC0001  ';
                        exsr satrib;
                        // END                                                           *
                     endif;
                     // END                                                           *
                     *in90 = *off;
                     *in91 = *off;
                     insav1 = indicators;
                     UPDATE SCR001S1;                                        //Lo90 Repl 4 bif
                     *in01 = *off;
                     *in03 = *on;
                     *in05 = *off;
                  endif;
               enddo;
               swexbl = *zeros;
            endif;

            rrn01 = srn01;
            indicators = ins01;



         ENDSR;

         // ****************************************************************
         // S01FWD - SCRN SUB
         // ****************************************************************
         begsr S01FWD;

            // *** Scroll information forward
            // *
            // C01 = 0
            z1 = *zeros;
            // ** Clear Hidden key arrays used for later
            // ** record retrieval.
            // A001 = ' '
            a01 = *blanks;                                                   //Was movea
            // A002 = ' '
            a02 = *blanks;                                                   //Was movea
            // *
            // FLDATR FL0001,*ND,*PR
            #nd = 'X';
            #pr = 'X';
            fldnam = 'FL0001  ';
            fldinx = *zeros;
            fldscr = *blanks;
            fldscr = 'SC0001  ';
            exsr satrib;
            // GETBLK D.ITMCLAS,F.ITMCLAS,*NE,SVK001


            kcco01 = *blanks;
            kcco01 = svk001;

            // ---------------------------------------------------------------
            // | Initialize Loop
            // ---------------------------------------------------------------
            wcntr = *zeros;
            wlcntr = 12;
            // ---------------------------------------------------------------
            // | Initialize subfile    SCR001S1
            // ---------------------------------------------------------------
            *in63 = *off;
            *in64 = *off;
            *in65 = *off;
            *in66 = *off;
            write scr001c1;                                                  //CLEAR SUBFILE
            rrn01 = 0;

            xrn01 = 1;
            srn01 = xrn01;
            *in63 = *on;
            *in64 = *on;
            *in65 = *on;
            *in66 = *off;
            ins01 = indicators;
            // ---------------------------------------------------------------
            // | Setup Loop To Retrieve Record
            // ---------------------------------------------------------------
            dou swrd01 <> 'Y'  or                                            //RD.SW.ITMCLAS
               wcntr >= wlcntr  or
               swexbl <> *zero;
               swskpr = *zeros;
               fl0001 = *zeros;
               xcclas = *blanks;
               xcdesc = *blanks;
               wfile# = 1;
               READE(EN) (kcco01) ITMCLAS;                                   //Lo91Eq90 Repl 4 bif
               IF %eof OR                                                    //Chg Ind 90 to bif
                  %ERROR;                                                    //Chg Ind 91 to bif
                  swrd01 = 'N';
                  hrc01 = *zeros;
                  hd0002 = *blanks;
                  hcclas = *blanks;
                  else;
                  swrd01 = 'Y';
               endif;

               if swrd01 = 'Y';                                              //RD.SW.ITMCLAS
                  exsr smvtow;                                               //MOVE FLD TO WORK
                  // FLDATR FL0001,*DS
                  #ds = 'X';
                  fldnam = 'FL0001  ';
                  fldinx = *zeros;
                  fldscr = *blanks;
                  fldscr = 'SC0001  ';
                  exsr satrib;
                  // C01 = C01+1
                  nrslt0 = z1 + 1;
                  z1 = nrslt0;                                               //Check fld overflow
                  // ** Save key information in key arrays.
                  // A001(C01) = ICCOYNO
                  a01(z1) = *blanks;
                  a01(z1) = wk0001;
                  // A002(C01) = ICCLAS
                  a02(z1) = *blanks;
                  a02(z1) = xcclas;
                  // ** Set any work fields to values in
                  // ** secondary file fields.
                  // ENDBLK                                                        *
                  if swexbl = *zero  and
                     swskpr = *zero;
                     wcntr = wcntr + 1;
                     wrrn01 = wcntr;
                     insav1 = indicators;
                     rrn01 = rrn01 + 1;
                     WRITE SCR001S1;                                         //Lo90Eq   Repl 4 bif
                     xrn01 = xrn01 + 1;
                  endif;
               endif;
            enddo;
            swexbl = *zeros;
            nxtrrn = rrn01;
            fl0001 = *zeros;
            xcclas = *blanks;
            xcdesc = *blanks;
            indicators = ins01;
            *in65 = *off;
            insav1 = indicators;
            wgetr = wcntr;
            dow wgetr < wlcntr;
               rrn01 = rrn01 + 1;
               WRITE SCR001S1;                                               //Lo90Eq   Repl 4 bif
               xrn01 = xrn01 + 1;
               wgetr = wgetr + 1;
            enddo;
            if nxtrrn > 0;
               chain(e) NXTRRN SCR001S1;                                     //Hi90Lo   Repl 4 bif
               indicators = insav1;
               *in65 = *on;
               UPDATE SCR001S1;                                              //Lo90 Repl 4 bif
               indicators = ins01;
            endif;
            if rrn01 > srn01;
               rrn01 = srn01;
            endif;
            exsr s012;                                                       //RESET FP
            // *
            // IF c01 = 0
            if z1 = *zero;
               // EXSUBR s01bkw
               exsr s01bkw;
               if lrflag <> *blank;
                  leavesr;
               endif;
               // END                                                           *
            endif;

         ENDSR;

         // ****************************************************************
         // SMSG - calls message handling program to either clear, add, or
         // remove messages from message subfile or extracts
         // messages from message files.
         // ****************************************************************
         begsr SMSG;

            // Add message to message subfile

            if msgact = 'A'  or
               msgact = 'R';
               msgflg = 'Y';
               else;
               // Clear message subfile or extract message from message file.

               if msgact = 'C';
                  msgflg = 'N';
               endif;
            endif;

            if msgact = 'C'  or
               msgact = 'A'  or
               msgact = 'E';

               p_CLMSG(
                     msgact:
                     msgid:
                     msgf:
                     msgfl:
                     msgdta);

               // call      'CLMSG'       pmsgcl
               msgid = *blanks;
               msgf = *blanks;
               msgfl = *blanks;
               // Do not clear the message data field if message is extracted
               // from message file
               if msgact <> 'E';
                  msgdta = *blanks;
               endif;
            endif;

         ENDSR;

         // *************************************************************************
         // S003   - SETLL D.ITMCLAS,F.ITMCLAS,SVK001,SVK002
         // *************************************************************************
         begsr S003;
            wfile# = 1;
            swrd01 = 'Y';
            hd0002 = *loval;
            hcclas = *loval;

            kcco01 = svk001;
            hd0002 = svk001;
            rn0007 = svk001;
            kccl02 = svk002;
            hcclas = svk002;
            icclas = svk002;

            setll(e) (kcco01:kccl02) ITMCLAS;                                //Hi  Lo  Eq90 Repl bi
            IF Not %EQUAL;                                                   //Chg Ind 90 to bif
               sts01 = 12;
            endif;                                                           //*IN90=0
         ENDSR;


         // *************************************************************************
         // S004   - GETREC D.ITMCLAS,F.ITMCLAS,*lock,*eq,SVK001,SVK002
         // *************************************************************************
         begsr S004;
            wfile# = 1;
            kcco01 = *blanks;
            kcco01 = svk001;
            kccl02 = *blanks;
            kccl02 = svk002;
            chain(e) (kcco01:kccl02) ITMCLAS;                                //Hi90Lo91 Repl 4 bif
            IF Not %FOUND OR                                                 //Chg Ind 90 to bif
               %ERROR;                                                       //Chg Ind 91 to bif

               IF %ERROR;                                                    //Chg Ind 91 to bif
                  msgflg = 'Y';
               endif;

               swrd01 = 'N';
               hrc01 = *zeros;
               else;
               swrd01 = 'Y';
               exsr smvtow;                                                  //MOVE FLD TO WORK
            endif;


         ENDSR;


         // *************************************************************************
         // S005   - GETREC D.ITMCLAS,F.ITMCLAS,*eq,SVK001,SVK002
         // *************************************************************************
         begsr S005;
            wfile# = 1;
            kcco01 = *blanks;
            kcco01 = svk001;
            kccl02 = *blanks;
            kccl02 = svk002;
            chain(en) (kcco01:kccl02) ITMCLAS;                               //Lo91Eq   Repl 4 bif
            IF Not %FOUND OR                                                 //Chg Ind 90 to bif
               %ERROR;                                                       //Chg Ind 91 to bif
               swrd01 = 'N';
               hrc01 = *zeros;
               else;
               swrd01 = 'Y';
               exsr smvtow;                                                  //MOVE FLD TO WORK
            endif;


         ENDSR;


         // *************************************************************************
         // S006   - DELETE D.ITMCLAS,F.ITMCLAS
         // *************************************************************************
         begsr S006;
            *in90 = *off;
            *in91 = *off;
            svs01 = *hival;
            kcco01 = *blanks;
            kcco01 = wk0001;
            kccl02 = *blanks;
            kccl02 = xcclas;
            setll (kcco01:kccl02) itmclas;                                   //SETLL  ITMCLAS
            // ---------------------------------------------------------------
            // | Setup Loop To Delete Record - ITMCLAS
            // ---------------------------------------------------------------
            dou *in90  or
               *in91;

               wfile# = 1;
               READE(E) (kcco01:kccl02) ITMCLAS;                             //Lo91Eq90 Repl 4 bif
               IF %eof;                                                      //Set Ind for dou loop
                  *in90 = *on;                                               //Set Ind for dou loop
               ENDIF;                                                        //Set Ind for dou loop
               IF %error;                                                    //Set Ind for dou loop
                  *in91 = *on;                                               //Set Ind for dou loop
               ENDIF;                                                        //Set Ind for dou loop

               IF Not %eof AND                                               //Chg Ind 90 to bif
                  Not %ERROR;                                                //Chg Ind 91 to bif

                  DELETE ITMCLAS;                                            //Lo91 Repl 4 bif
                  svs01 = sts01;
                  // ---------------------------------------------------------------
                  // | Send Message To Indicate Delete Status
                  // ---------------------------------------------------------------
                  IF Not %ERROR;                                             //Chg Ind 91 to bif
                     msgdta = a1(2);
                     msgact = 'A';
                     exsr smsg;                                              //GET THE MESSAGE
                  endif;                                                     //END-DEL STATUS

                  else;                                                      //ELSE-READ-FILE

                  if *in90;                                                  //NO RCD FOUND
                     msgdta = a1(3);
                     msgact = 'A';
                     exsr smsg;                                              //GET THE MESSAGE
                     else;
                     msgflg = 'Y';
                  endif;                                                     //READ KEY FILE FAIL

               endif;                                                        //END-READ KEY FILE
            enddo;                                                           //EMD-DOUNE LOOP
            *in90 = *off;
            *in91 = *off;

            setll (kcco01:kccl02) itmclas;                                   //RESUME FILE POINTER
            sts01 = svs01;
         ENDSR;


         // *************************************************************************
         // S007   - UPDATE D.ITMCLAS,F.ITMCLAS
         // *************************************************************************
         begsr S007;
            wfile# = 1;
            kcco01 = *blanks;
            kcco01 = hd0002;
            kccl02 = *blanks;
            kccl02 = hcclas;
            chain(e) (kcco01:kccl02) ITMCLAS;                                //Hi90Lo91 Repl 4 bif

            IF %ERROR;                                                       //Chg Ind 91 to bif
               msgflg = 'Y';
            endif;

            IF %FOUND AND                                                    //Chg Ind 90 to bif
               Not %ERROR;                                                   //Chg Ind 91 to bif

               if icclas = xcclas  and
                  rn0007 = wk0001  and
                  icdesc = xcdesc;
                  UNLOCK ITMCLAS;                                            //Lo91 Repl 4 bif
                  else;
                  exsr smvtof;                                               //MOVE FLD TO FILE
                  UPDATE ITMCLASF;                                           //Lo90 Repl 4 bif
                  IF %ERROR;                                            //Chg Ind 90 to bif
                     exsr smvtow;                                            //MOVE FLD TO WORK
                     msgdta = a1(4);
                     msgact = 'A';
                     exsr smsg;                                              //GET THE MESSAGE
                  endif;                                                     //END-UPDATE STATUS
               endif;                                                        //END-FLD COMPARE


               else;
               msgdta = a1(5);
               msgact = 'A';
               exsr smsg;                                                    //GET THE MESSAGE
            endif;                                                           //END-STATUS
         ENDSR;


         // *************************************************************************
         // S008   - WRITE D.ITMCLAS,F.ITMCLAS
         // *************************************************************************
         begsr S008;
            wfile# = 1;
            exsr smvtof;                                                     //MOVE FLD TO FILE
            WRITE ITMCLASF;                                                  //Lo90Eq   Repl 4 bif
            IF not %ERROR;                                                       //Chg Ind 90 to bif
               exsr smvtow;                                                  //MOVE FLD TO WORK
               msgdta = a1(6);
               msgact = 'A';
               exsr smsg;                                                    //GET THE MESSAGE
               else;
               msgdta = a1(7);
               msgact = 'A';
               exsr smsg;                                                    //GET THE MESSAGE
            endif;                                                           //END-STATUS
         ENDSR;


         // *************************************************************************
         // S009   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
         // *************************************************************************
         begsr S009;
            wfile# = 2;
            kyco01 = *blanks;
            kyco01 = prm001;
            chain(e) (kyco01) COMPANY;                                       //Hi90Lo91 Repl 4 bif
            IF Not %FOUND OR                                                 //Chg Ind 90 to bif
               %ERROR;                                                       //Chg Ind 91 to bif
               swrd02 = 'N';
               hrc02 = *zeros;
               else;
               swrd02 = 'Y';
               exsr smvtow;                                                  //MOVE FLD TO WORK
            endif;


         ENDSR;


         // *************************************************************************
         // S010   - GETBLK D.ITMCLAS,F.ITMCLAS,*PV,SVK001
         // *************************************************************************
         begsr S010;

            kcco01 = *blanks;
            kcco01 = svk001;

            // ---------------------------------------------------------------
            // | Initialize Loop
            // ---------------------------------------------------------------
            wcntr = *zeros;
            wlcntr = wrrn01;
            wlcntr = wlcntr + wadj01;
            // ---------------------------------------------------------------
            // | Setup Loop To Retrieve Record
            // ---------------------------------------------------------------
            dou swrd01 <> 'Y'  or                                            //RD.SW.ITMCLAS
               wcntr >= wlcntr  or
               swexbl <> *zero;
               swskpr = *zeros;
               wfile# = 1;
               READPE(EN) (kcco01) ITMCLAS;                                  //Lo91Eq90 Repl 4 bif
               IF %eof OR                                                    //Chg Ind 90 to bif
                  %ERROR;                                                    //Chg Ind 91 to bif
                  swrd01 = 'N';
                  hrc01 = *zeros;
                  hd0002 = *blanks;
                  hcclas = *blanks;
                  else;
                  swrd01 = 'Y';
               endif;

               if swrd01 = 'Y';                                              //RD.SW.ITMCLAS
                  exsr smvtow;                                               //MOVE FLD TO WORK
                  wcntr = wcntr + 1;
               endif;
            enddo;
            swexbl = *zeros;
            exsr s011;                                                       //CHK BOF
         ENDSR;


         // *************************************************************************
         // S011   - Process To Reset File Pointer(BOF) - ITMCLAS
         // *************************************************************************
         begsr S011;

            if swrd01 <> 'Y'  and                                            //RD.SW.ITMCLAS
               sts01 <> 1122  and                                            //RCD LOCK
               sts01 <> 1218;                                                //RCD LOCK

               swrd01 = 'Y';
               svs01 = sts01;
               kcco01 = *blanks;
               kcco01 = rn0007;
               setll (kcco01) itmclas;
               sts01 = svs01;

               msgdta = a1(8);
               msgact = 'A';
               exsr smsg;                                                    //GET THE MESSAGE
            endif;
         ENDSR;


         // *************************************************************************
         // S012   - Process To Reset File Pointer(EOF) - ITMCLAS
         // *************************************************************************
         begsr S012;

            if swrd01 <> 'Y'  and                                            //RD.SW.ITMCLAS
               sts01 <> 1122  and                                            //RCD LOCK
               sts01 <> 1218;                                                //RCD LOCK

               swrd01 = 'Y';
               svs01 = sts01;
               kcco01 = *blanks;
               kcco01 = rn0007;
               setgt (kcco01) itmclas;
               sts01 = svs01;

               wadj01 = 1;
               if wcntr <> *zero;
                  wadj01 = wadj01 + 12;
               endif;
               msgdta = a1(9);
               msgact = 'A';
               exsr smsg;                                                    //GET THE MESSAGE
               else;
               wadj01 = wrrn01;
            endif;
         ENDSR;


         // *************************************************************************
         // S013   - GETREC D.ITMCLAS,F.ITMCLAS,*EQ,ICCOYNO,ICCLAS
         // *************************************************************************
         begsr S013;
            wfile# = 1;
            kcco01 = *blanks;
            kcco01 = wk0001;
            kccl02 = *blanks;
            kccl02 = xcclas;
            chain(en) (kcco01:kccl02) ITMCLAS;                               //Lo91Eq   Repl 4 bif
            IF Not %FOUND OR                                                 //Chg Ind 90 to bif
               %ERROR;                                                       //Chg Ind 91 to bif
               swrd01 = 'N';
               hrc01 = *zeros;
               else;
               swrd01 = 'Y';
               exsr smvtow;                                                  //MOVE FLD TO WORK
            endif;


         ENDSR;


         // *************************************************************************
         // S002V - Detail Screen for ITMCLAS
         // Validation subroutine for -- SC0002
         // *************************************************************************
         begsr S002V;

            validf = 1;

            if xcclas = a1(1);                                               //Lst Valid/Invalid va
               listf = 0;
               else;
               listf = 1;
            endif;

            fldinx = 0;
            fldnam = 'XCCLAS';
            fldscr = 'SC0002';
            if listf = 1;                                                    //Lst Valid/Invalid va
               dsperr = 'R';
               exsr satrib;
               else;
               validf = 0;
               msgid = *blanks;
               msgf = *blanks;
               msgfl = *blanks;
               msgdta = *blanks;
               msgact = 'A';
               msgid = 'FLD0005';
               msgf = 'ERRORS';
               exsr smsg;                                                    //Exsr error handler
               dsperr = 'X';
               exsr satrib;
            endif;

            if xcdesc = a1(1);                                               //Lst Valid/Invalid va
               listf = 0;
               else;
               listf = 1;
            endif;

            fldinx = 0;
            fldnam = 'XCDESC';
            fldscr = 'SC0002';
            if listf = 1;                                                    //Lst Valid/Invalid va
               dsperr = 'R';
               exsr satrib;
               else;
               validf = 0;
               msgid = *blanks;
               msgf = *blanks;
               msgfl = *blanks;
               msgdta = *blanks;
               msgact = 'A';
               msgid = 'FLD0010';
               msgf = 'ERRORS';
               exsr smsg;                                                    //Exsr error handler
               dsperr = 'X';
               exsr satrib;
            endif;
         ENDSR;
         // *************************************************************************

         // ****************************************************************
         // *PSSR - Program Execution Errors Handler
         // ****************************************************************
         begsr *PSSR;
            if uercnt <> *zero;
               ursume = '*CANCL';
               else;
               uercnt = 1;
               msgact = 'R';
               msgf = *blanks;
               msgf = 'QCPFMSG';
               msgfl = *blanks;
               msgfl = 'QSYS';
               msgdta = *blanks;
               if umsgtx <> *blanks;
                  msgdta = umsgtx;
                  else;
                  msgdta = uroutn;
               endif;

               if ustat = *zeros;
                  ustat = %dec(ufstat:5:0);                                  //Check conversion
                  usrcln = ufsrcl;
               endif;
               evalr ustat4 = %char(ustat);                                  //Check conversion

               if msgid = *blanks;
                  evalr msgid = ustat4;                                      //Check conversion
                  msgid = 'RPG';
                  msgf = 'QRPGMSGE';
               endif;


               p_CLMSG(
                     msgact:
                     msgid:
                     msgf:
                     msgfl:
                     msgdta);

               // call      'CLMSG'       pmsgcl                   93

               ueropt = '1';
               exfmt pssr0001;

               if ueropt = '1';
                  ursume = '*GETIN  ';
                  else;
                  if ueropt = '2';
                     ursume = '*CANCL  ';
                     else;
                     if ueropt = '3';
                        evalr ursume = '        ';                           //Check conversion
                     endif;
                  endif;
               endif;
            endif;

            msgid = *blanks;
            uercnt = *zeros;

         ENDSR;
         // /EJECT
         // ****************************************************************
         // SATRIB - Display Attribute Handler
         // ****************************************************************
      /COPY QRPGSRC,SATRIB

         // ****************************************************************
         // SLOCK - Update Lock Flag
         // ****************************************************************
         begsr SLOCK;
            if sts01 = 1218  or                                               //LOCK(SYS)-ITMCLAS
               sts01 = 1122;                                                 //LOCK(ASSET)
               lck01 = *zeros;
               else;
               lck01 = 1;
            endif;
         ENDSR;

         // ****************************************************************
         // SFERR - File Exception Handler
         // ****************************************************************
         begsr SFERR;
            msgflg = 'Y';
            if wfile# = 1;                                                   //ITMCLAS
               if sts01 = 1218;                                              //LOCK(SYS)
                  sts01 = 1122;
                  else;
                  if sts01 = 1211;                                           //CLOSED FILE
                     exsr *pssr;
                     else;
                     sts01 = 1121;
                  endif;
               endif;
            endif;
            if wfile# = 2;                                                   //COMPANY
               if sts02 = 1218;                                              //LOCK(SYS)
                  sts02 = 1122;
                  else;
                  if sts02 = 1211;                                           //CLOSED FILE
                     exsr *pssr;
                     else;
                     sts02 = 1121;
                  endif;
               endif;
            endif;
         ENDSR;

         // ****************************************************************
         // SMVTOF - Move Fields From Work Area To File(s)
         // ****************************************************************
         begsr SMVTOF;
            // ------------------------------------------------------
            // | Move Fields From Work Area To File - ITMCLAS
            // ------------------------------------------------------
            if wfile# = 01;
               icclas = xcclas;
               rn0007 = wk0001;
               icdesc = xcdesc;
            endif;
         ENDSR;

         // ****************************************************************
         // SMVTOW - Move Fields From File(s) To Work Area
         // ****************************************************************
         begsr SMVTOW;
            // ------------------------------------------------------
            // | Move Fields From File To Work Area - ITMCLAS
            // ------------------------------------------------------
            if wfile# = 01;
               xcclas = icclas;
               wk0001 = rn0007;
               xcdesc = icdesc;
               hrc01 = rec01;
               hd0002 = rn0007;
               hcclas = icclas;
               else;
               // ------------------------------------------------------
               // | Move Fields From File To Work Area - COMPANY
               // ------------------------------------------------------
               if wfile# = 02;
                  xydesc = cydesc;
                  hrc02 = rec02;
                  hd0001 = rn0001;
               endif;
            endif;
         ENDSR;

         // *******************************************************************
         // C o m p i l e   T i m e   A r r a y
         // I n i t i a l i z a t i o n
         // *******************************************************************
      /END-FREE
**   Alpha Constant Array - A1

Record deleted from file IMS Item class parameters   IC
No record found to delete from file IMS Item class parameters   IC
Record update for file IMS Item class parameters   IC
Unable to update record for file IMS Item class parameters   IC
Record added to file IMS Item class parameters   IC
Unable to add record to file IMS Item class parameters   IC
The beginning of the file was reached
The end of the file was reached
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XYDESC    0000  05      05
SC0002    XYDESC    0000  07      07
SC0002    XCCLAS    0000  0103    01  02
SC0002    XCDESC    0000  0406    04  05
SC0001    FL0001    0000  0103    010402               Y
