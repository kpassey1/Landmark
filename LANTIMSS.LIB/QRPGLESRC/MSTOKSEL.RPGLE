     F/TITLE MSTOKSEL   Stock Take Request Options
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MSTOKSEL
     F*  Application ID      -    MSTOKSEL
     F*  Application Name    -      Stock Take Request Options
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  STOKREQ     - (I/DISK   ) IMS Stock take request      SR
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  STOKSEL     - (U/DISK   ) IMS Stocktake items rqustd  SS
     F*  STOKREQX    - (U/DISK   ) IMS Stock take request      SR
     F*  MSTOKSELD   - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCCHEK     - Check update really required
     F*
     F* N79     - SCR003 PUTOVR
     F*
     F*  SC0001     - List Screen for STOKREQ
     F*
     F*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0001 : DSPATR(ND)
     F*  05     - SCR001 / CYDESC : DSPATR(PC)
     F*  05     - SCR001 / CYDESC : DSPATR(RI)
     F*  63     - SCR001C1 SFLDSPCTL
     F*  64     - SCR001C1 SFLDSP
     F*  65     - SCR001S1 SFLNXTCHG
     F*  66     - SCR001C1 SFLINZ
     F*  99     - SCR001 OVERLAY
     F* N63     - SCR001C1 SFLCLR
     F* N64     - SCR001C1 ERASE(SCR001S1)
     F* N67     - SCR001C1 SFLEND
     F* N79     - SCR001 PUTOVR
     F* N79     - SCR001C1 PUTOVR
     F*
     F*  SC0003     - List Screen for STOKSEL
     F*
     F*  01     - SCR002S1 / RN0026 : DSPATR(RI)
     F*  02     - SCR002S1 / RN0026 : DSPATR(PR)
     F*  03     - SCR002S1 / RN0026 : DSPATR(UL)
     F*  04     - SCR002S1 / RN0026 : DSPATR(ND)
     F*  05     - SCR002 / CYDESC : DSPATR(PC)
     F*  05     - SCR002 / CYDESC : DSPATR(RI)
     F*  63     - SCR002C1 SFLDSPCTL
     F*  64     - SCR002C1 SFLDSP
     F*  65     - SCR002S1 SFLNXTCHG
     F*  66     - SCR002C1 SFLINZ
     F*  80     - SCR002S1 / RN0026 : DSPATR(PC)
     F*  99     - SCR002 OVERLAY
     F* N63     - SCR002C1 SFLCLR
     F* N64     - SCR002C1 ERASE(SCR002S1)
     F* N67     - SCR002C1 SFLEND
     F* N79     - SCR002 PUTOVR
     F* N79     - SCR002C1 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for STOKREQ
     F* S002 - List Screen for STOKSEL
     F* S003 - Check update really required
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S01FWD - SCRN SUB
     F* S03BKW - SCRN SUB
     F* S03EDT - SCRN SUB
     F* S03FWD - SCRN SUB
     F* SMSG - calls message handling program to either clear, add, or
     F* S004   - GETREC d.company,f.company,*eq,prcoyno
     F* S005   - SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
     F* S006   - SETLL D.STOKREQ,F.STOKSEL,SVK003,SVK004,SVK005,SVK006,SVK007,SV
     F* S007   - GETBLK D.STOKREQ,F.STOKREQ,*PV,prcoyno
     F* S008   - Process To Reset File Pointer(BOF) - STOKREQ
     F* S009   - Process To Reset File Pointer(EOF) - STOKREQ
     F* S010   - GETREC D.STOKREQ,F.STOKREQ,*EQ,SRCOYNO,SRSEQ
     F* S011   - GETREC D.STOKREQ,F.STOKREQ,*LOCK,*EQ,SRCOYNO,SVK002
     F* S012   - UPDATE d.stokreq,f.stokreq
     F* S013   - GETBLK D.STOKREQ,F.STOKSEL,*PV,SVK003,SVK004
     F* S014   - Process To Reset File Pointer(BOF) - STOKSEL
     F* S015   - Process To Reset File Pointer(EOF) - STOKSEL
     F* S016   - UPDATE D.STOKREQ,F.STOKSEL
     F* S002V - List Screen for STOKSEL
     F* *PSSR - Program Execution Errors Handler
     F* SATRIB - Display Attribute Handler
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FFILE0001  CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR002S1:RRN02)
     F                                     INFDS(DSPFDS)
     FSTOKREQ   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FSTOKSEL   UF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FSTOKREQX  UF   E             DISK
     F                                     INFDS(FIDS04)
     F                                     RENAME(STOKREQF:FMT001)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              3    DIM(11)
     D A02             S              5  0 DIM(11)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(6) CTDATA PERRCD(1)              Alpha constants i
     D N1              S             30  9 DIM(2) CTDATA PERRCD(1)              Numeric constants
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(7) CTDATA PERRCD(1)              Fld Attr. Indic t
     D DA2             S             34    DIM(7) ALT(DA1)
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D*
     D* INFDS for cursor location
     D*
     D DSPFDS          DS
     D  ROW                  370    370
     D  COL                  371    371
     D  SFLRRN               378    379B 0
     D*
     D* Work Data Structure for cursor
     D*
     D @DS001          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS002          DS
     D  FLDSCR                 1     10
     D  FLDNAM                11     20
     D  FLDINX                21     24  0
     D  DSPERR                25     25
     D  #DS                   26     26
     D  #HI                   27     27
     D  #RI                   28     28
     D  #UL                   29     29
     D  #BL                   30     30
     D  #CS                   31     31
     D  #PC                   32     32
     D  #ND                   33     33
     D  #PR                   34     34
     D  #GN                   35     35
     D  #RD                   36     36
     D  #PK                   37     37
     D  #WT                   38     38
     D  #TQ                   39     39
     D  #YW                   40     40
     D  #BU                   41     41
     D  DA6                   27     41    DIM(15)                              Fld Attr. Wrk Ary
     D  #ATRIB                11     41
     D  #FROM                 25     28  0
     D  #TO                   29     32  0
     D  #CLF                  25     32  0
     D  #MAP                   1     24
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('PSTOKSHTC')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('PSTOKVARC')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('BSTOKSELC')
     D*
     D* Named constants
     D*
     D C0004           C                   CONST('Invalid action choic-
     D                                     e')
     D*
     D* Date Manipulation Data Struct.
     D*
     D                 DS
     D  X1CDAT                 1      8  0
     D  X1DATE                 1      6  0
     D  X12                    1      2  0
     D  X34                    3      4  0
     D  X56                    5      6  0
     D  X78                    7      8  0
     D*
     D* Message data structure
     D*
     D @DS003          DS
     D  MSGDTA                 1    132
     D  UMESG1                 1     51
     D  UMESG2                52    102
     D  UMESG3               103    132
     D*
     D* Program status data structure
     D*
     D SDS            SDS
     D  WSID                 244    253
     D  USER                 254    263
     D  PGM              *PROC
     D  USTAT                 11     15  0
     D  USRCLN                21     28
     D  UROUTN                29     36
     D  MSGID                 40     46
     D  ULIB                  81     90
     D  UMSGTX                91    170
     D  UFILE                201    208
     D  UFSTAT               209    213
     D  UFSRCL               228    235
     D  UJOBN                264    269  0
     D  UCDAT                288    293  0
     D  UCTIM                294    299  0
     ICOMPANYF
     I              CYCOYNO                     RN0001
     I              CYEMPCOL                    RN0002
     I              CYEMPHEAD                   RN0003
     I              CYPRDHEAD                   RN0004
     I              CYREFHEAD                   RN0005
     I              CYSDESC                     RN0006
     ISTOKREQF
     I              SRBFLAG                     RN0007
     I              SRCOYNO                     RN0008
     I              SRFCLAS                     RN0009
     I              SRFITEM                     RN0010
     I              SRFLOCN                     RN0011
     I              SRFSBRN                     RN0012
     I              SRFSGRP                     RN0013
     I              SRFSTIG                     RN0014
     I              SRFSUPPN                    RN0015
     I              SRFWHSE                     RN0016
     I              SRTCLAS                     RN0017
     I              SRTITEM                     RN0018
     I              SRTLOCN                     RN0019
     I              SRTSBRN                     RN0020
     I              SRTSGRP                     RN0021
     I              SRTSTIG                     RN0022
     I              SRTSUPPN                    RN0023
     I              SRTWHSE                     RN0024
     ISTOKSELF
     I              SSCOYNO                     RN0025
     I              SSQUANT                     RN0026
     IFMT001
     I              SRBFLAG                     RN0007
     I              SRCOYNO                     RN0008
     I              SRFCLAS                     RN0009
     I              SRFITEM                     RN0010
     I              SRFLOCN                     RN0011
     I              SRFSBRN                     RN0012
     I              SRFSGRP                     RN0013
     I              SRFSTIG                     RN0014
     I              SRFSUPPN                    RN0015
     I              SRFWHSE                     RN0016
     I              SRTCLAS                     RN0017
     I              SRTITEM                     RN0018
     I              SRTLOCN                     RN0019
     I              SRTSBRN                     RN0020
     I              SRTSGRP                     RN0021
     I              SRTSTIG                     RN0022
     I              SRTSUPPN                    RN0023
     I              SRTWHSE                     RN0024
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    BAT
     C                   PARM                    WK0002
     C                   PARM                    DTSEQ
     C*
     C     P0002         PLIST
     C                   PARM                    BAT
     C                   PARM                    PRM003            3
     C                   PARM                    WKUSER
     C                   PARM                    PRACT
     C                   PARM                    PRALWD
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM003            3
     C*
     C     PMSGCL        PLIST
     C                   PARM                    MSGACT            1
     C                   PARM                    MSGID
     C                   PARM                    MSGF             10
     C                   PARM                    MSGFL            10
     C                   PARM                    MSGDTA
     C*
     C     PHELP         PLIST
     C                   PARM                    APPSET
     C                   PARM                    APPTYP
     C                   PARM                    APPPGM
     C                   PARM                    APPSCR
     C                   PARM                    APPROW
     C                   PARM                    APPCOL
     C********************************************************************
     C*                   K e y      L i s t
     C********************************************************************
     C*
     C     K0001         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0002         KLIST
     C                   KFLD                    KRCO01
     C                   KFLD                    KRSE02
     C*
     C     K0003         KLIST
     C                   KFLD                    KRCO01
     C                   KFLD                    KRSE02
     C                   KFLD                    KSWH03
     C                   KFLD                    KSPC04
     C                   KFLD                    KSLO05
     C                   KFLD                    KSIT06
     C*
     C     K0004         KLIST
     C                   KFLD                    KRCO01
     C*
     C     K0005         KLIST
     C                   KFLD                    KSCO01
     C                   KFLD                    KSSE02
     C*
     C     K0006         KLIST
     C                   KFLD                    KSCO01
     C                   KFLD                    KSSE02
     C                   KFLD                    KSWH03
     C                   KFLD                    KSPC04
     C                   KFLD                    KSLO05
     C                   KFLD                    KSIT06
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0007        WK0001                         Batch Update flag
     C     *LIKE         DEFINE    RN0008        WK0002                         Company number
     C     *LIKE         DEFINE    RN0025        WK0019                         Company number
     C     *LIKE         DEFINE    SSPCKR        WSPCKR                         Picking Route
     C     *LIKE         DEFINE    SSSEQ         WSSEQ                          Sequence
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0001        HD0001
     C                   MOVE      *ZEROS        NARG1            30 9          Numer argument1
     C                   MOVE      *ZEROS        NRSLT            30 9          Numeric result
     C                   MOVE      *BLANKS       DATFMT            3            Date format
     C                   MOVE      *ZEROS        SVDAT             6 0          Save date
     C                   MOVE      *ZEROS        SVYY              2 0          Save year
     C                   MOVE      *ZEROS        SVMM              2 0          Save month
     C                   MOVE      *ZEROS        SVDD              2 0          Save days
     C                   MOVE      *ZEROS        SVDAYS            3 0          Save days
     C                   MOVE      *ZEROS        SVLEAP            1 0          If leap year
     C                   MOVE      *ZEROS        FEB               2 0          NOD in feb/Leap
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *ZEROS        SVCY              4 0          Save days
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *BLANKS       BAT               1
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        C03               3 0
     C                   MOVE      *ZEROS        DTSEQ            15 5
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRACT             1
     C                   MOVE      *BLANKS       PRALWD            1
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *ZEROS        PRM002            5 0
     C                   MOVE      *ZEROS        PS0102            5 0
     C                   MOVE      *BLANKS       PS0301            3
     C                   MOVE      *BLANKS       PS0302            5
     C                   MOVE      *BLANKS       PS0303           10
     C                   MOVE      *BLANKS       PS0304           20
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *ZEROS        SVK002            5 0
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *ZEROS        SVK004            5 0
     C                   MOVE      *BLANKS       SVK005            3
     C                   MOVE      *BLANKS       SVK006            5
     C                   MOVE      *BLANKS       SVK007           10
     C                   MOVE      *BLANKS       SVK008           15
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *BLANKS       WKUSER           10
     C                   MOVE      *BLANKS       YESNO             1
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       KRCO01            3            SRCOYNO
     C                   MOVE      *ZEROS        KRSE02            5 0          SRSEQ
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *BLANKS       KSWH03            3            SSWHSE
     C                   MOVE      *BLANKS       KSPC04            5            SSPCKR
     C                   MOVE      *BLANKS       KSLO05           10            SSLOCN
     C                   MOVE      *BLANKS       KSIT06           20            SSITEM
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KSCO01            3            SSCOYNO
     C                   MOVE      *ZEROS        KSSE02            5 0          SSSEQ
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        RANGEF            1 0          Range chk flag
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVEL     'LANDIMS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     1             XRN01
     C                   Z-ADD     1             XRN02
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        X1                3 0          INDEX 1
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        SRN01             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN01             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN01             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     1             CALLST            1 0          CALL STS
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
     C*
     C/EJECT
     C********************************************************************
     C*        M a i n l i n e      R o u t i n e
     C********************************************************************
     C                   EXSR      SMAIN
     C*
     C/EJECT
     C*****************************************************************
     C* SMAIN - Main flow of the program.
     C*****************************************************************
     C     SMAIN         BEGSR
     C*
     C*
     C* Clear Message Subfile.
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C*      *------------------------------------------*
     C*      *  Process all screens.                    *
     C*      *------------------------------------------*
     C                   MOVEL     'SC0001'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0001'      S001
     C     SCRNID        CASEQ     'SC0003'      S002
     C     SCRNID        CASEQ     'SCCHEK'      S003
     C     SCRNID        CASEQ     'SEND'        SEND
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEND - END of program.
     C*****************************************************************
     C     SEND          BEGSR
     C*
     C     LRFLAG        IFEQ      'Y'
     C     LRFLAG        OREQ      *BLANK
     C                   MOVE      '1'           *INLR
     C                   END                                                    LRFLAG EQ 'Y'
     C                   MOVE      *BLANK        SCRNID
     C                   RETURN
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* S001 - List Screen for STOKREQ
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C* GETREC d.company,f.company,*eq,prcoyno
     C*
     C                   EXSR      S004
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* SRSEQ = 0
     C                   Z-ADD     *ZERO         XRSEQ
     C* Set Key values to parms passed
     C* SVK001 = prcoyno
     C                   MOVE      PRM003        SVK001
     C* SVK002 = *zero
     C                   Z-ADD     *ZERO         SVK002
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
     C*
     C                   EXSR      S005
     C*                                                               *
     C* Fill list Panel
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN63
     C                   MOVE      '1'           *IN65
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   WRITE     SCR001
     C* Turn off SFLDSP in case of empty subfile
     C     RRN01         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN01         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN01         DRN01
     C                   EXFMT     SCR001C1
     C     SFLRRN        IFGT      0
     C     DRN01         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN01
     C                   Z-ADD     SFLRRN        DRN01
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C                   MOVEA     '1'           *IN(80)
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 3
     C*                                                               *
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 12
     C*                                                               *
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*     1. Check for any selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S01BKW
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*     1. Check for selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
     C*                                                               *
     C* Reset reposition flag and check for any
     C* selected records.
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* *** Check for reposition
     C* IF PS0102<>0
     C     PS0102        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK002 = PS0102
     C                   Z-ADD     PS0102        SVK002
     C* Reset/clear reposition values to parms passed
     C* PS0102 = *zero
     C                   Z-ADD     *ZERO         PS0102
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* Set pointer to file.
     C* SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
     C*
     C                   EXSR      S005
     C*                                                               *
     C* Fill Panel.
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - List Screen for STOKSEL
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK005 = PS0301
     C                   MOVE      PS0301        SVK005
     C* SVK006 = PS0302
     C                   MOVE      PS0302        SVK006
     C* SVK007 = PS0303
     C                   MOVE      PS0303        SVK007
     C* SVK008 = PS0304
     C                   MOVE      *BLANKS       SVK008
     C                   MOVEL     PS0304        SVK008
     C*                                                               *
     C* Set Keys to values from header file.
     C* SSCOYNO = SRCOYNO
     C                   MOVE      WK0002        WK0019
     C* SSSEQ = SRSEQ
     C                   Z-ADD     XRSEQ         WSSEQ
     C* SVK003 = SRCOYNO
     C                   MOVE      WK0002        SVK003
     C* SVK004 = SRSEQ
     C                   Z-ADD     XRSEQ         SVK004
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.STOKREQ,F.STOKSEL,SVK003,SVK004,SVK005,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S006
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN63
     C                   MOVE      '1'           *IN65
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   WRITE     SCR002
     C* Turn off SFLDSP in case of empty subfile
     C     RRN02         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN02         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN02         DRN02
     C                   EXFMT     SCR002C1
     C     SFLRRN        IFGT      0
     C     DRN02         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN02
     C                   Z-ADD     SFLRRN        DRN02
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C                   MOVEA     '1'           *IN(80)
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 3
     C*                                                               *
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen on
     C* *** on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S002V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*     1. Check for any selected records.
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S03BKW
     C                   EXSR      S03BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*     1. Check for selected records.
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
     C*                                                               *
     C* Reset reposition flag and check for any
     C* selected records.
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* *** Check for reposition
     C*                                                               *
     C* IF PS0304<>' '|ps0303<>' '|ps0302<>' '|ps0301<>' '
     C     PS0304        IFNE      *BLANKS
     C     PS0303        ORNE      *BLANKS
     C     PS0302        ORNE      *BLANKS
     C     PS0301        ORNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK005 = PS0301
     C                   MOVE      PS0301        SVK005
     C* SVK006 = PS0302
     C                   MOVE      PS0302        SVK006
     C* SVK007 = PS0303
     C                   MOVE      PS0303        SVK007
     C* SVK008 = PS0304
     C                   MOVE      *BLANKS       SVK008
     C                   MOVEL     PS0304        SVK008
     C* PS0301 = ' '
     C                   MOVEL     *BLANKS       PS0301
     C* PS0302 = ' '
     C                   MOVEL     *BLANKS       PS0302
     C* PS0303 = ' '
     C                   MOVEL     *BLANKS       PS0303
     C* PS0304 = ' '
     C                   MOVEL     *BLANKS       PS0304
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.STOKREQ,F.STOKSEL,SVK003,SVK004,SVK005,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S006
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Check update really required
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   EXFMT     SCR003
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Accept
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* YESNO = 'Y'
     C                   MOVE      'Y'           YESNO
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* SREDSP -  Redisplay Windows within stack.
     C*****************************************************************
     C     SREDSP        BEGSR
     C*
     C                   Z-ADD     SP            CT
     C     CT            DOWGT     1
     C     STY(CT)       ANDNE     'F'
     C                   SUB       1             CT
     C                   END
     C*
     C*  Redisplay Windows within stack.
     C*
     C     CT            DOWLE     SP
     C     CT            ANDGT     0
     C*
     C     SID(CT)       IFEQ      'SC0001'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   WRITE     SCR001C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0003'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   WRITE     SCR002C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SCCHEK'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR003
     C                   END
     C                   END
     C                   END
     C*
     C                   ADD       1             CT
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* S01BKW - SCRN SUB
     C*****************************************************************
     C     S01BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C01 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Clear hidden key arrays used for record
     C* ** retrieval.
     C* A001 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A002 = 0
     C                   Z-ADD     *ZERO         A02
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.STOKREQ,F.STOKREQ,*PV,prcoyno
     C*
     C                   EXSR      S007
     C*
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM003        KRCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD01        DOUNE     'Y'                                          RD.SW.STOKREQ   ITMC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XRSEQ
     C                   MOVEL     *BLANKS       WK0010
     C                   MOVEL     *BLANKS       WK0008
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0006
     C                   MOVEL     *BLANKS       WK0003
     C                   MOVEL     *BLANKS       WK0007
     C                   MOVEL     *BLANKS       WK0005
     C                   MOVEL     *BLANKS       WK0004
     C                   MOVEL     *BLANKS       WK0018
     C                   MOVEL     *BLANKS       WK0016
     C                   MOVEL     *BLANKS       WK0017
     C                   MOVEL     *BLANKS       WK0014
     C                   MOVEL     *BLANKS       WK0011
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0012
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0004         READE     STOKREQ                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HRSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.STOKREQ   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = SRCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0002        A01(Z1)
     C* A002(C01) = SRSEQ
     C                   Z-ADD     XRSEQ         A02(Z1)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XRSEQ
     C                   MOVEL     *BLANKS       WK0010
     C                   MOVEL     *BLANKS       WK0008
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0006
     C                   MOVEL     *BLANKS       WK0003
     C                   MOVEL     *BLANKS       WK0007
     C                   MOVEL     *BLANKS       WK0005
     C                   MOVEL     *BLANKS       WK0004
     C                   MOVEL     *BLANKS       WK0018
     C                   MOVEL     *BLANKS       WK0016
     C                   MOVEL     *BLANKS       WK0017
     C                   MOVEL     *BLANKS       WK0014
     C                   MOVEL     *BLANKS       WK0011
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S009                                         CHK EOF
     C*
     C     $S01BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S01EDT - SCRN SUB
     C*****************************************************************
     C     S01EDT        BEGSR
     C*
     C* ** Process Inquiry List Panel (IL)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I01 = 0
     C                   Z-ADD     *ZERO         Z2
     C* DOBLK D.STOKREQ
     C*
     C                   Z-ADD     RRN01         SRN01                          Save RRN
     C                   Z-ADD     1             RRN01                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS01
     C     SRN01         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR001S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C* I01 = I01+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* ** Print stock count sheeets
     C* BAT = 'B'
     C                   MOVE      'B'           BAT
     C* IF FL0001=6
     C     FL0001        IFEQ      6
     C* SRCOYNO = A001(I01)
     C                   MOVE      A01(Z2)       WK0002
     C* DTSEQ = A002(I01)
     C                   Z-ADD     A02(Z2)       DTSEQ
     C* SVK002 = A002(I01)
     C                   Z-ADD     A02(Z2)       SVK002
     C* CALL 'PSTOKSHTC',bat,srcoyno,dtseq
     C                   Z-ADD     1             CALLST
     C                   CALL      C0001         P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Input count
     C* IF FL0001=7
     C     FL0001        IFEQ      7
     C* SRCOYNO = A001(I01)
     C                   MOVE      A01(Z2)       WK0002
     C* SRSEQ = A002(I01)
     C                   Z-ADD     A02(Z2)       XRSEQ
     C* SVK002 = A002(I01)
     C                   Z-ADD     A02(Z2)       SVK002
     C* GETREC D.STOKREQ,F.STOKREQ,*EQ,SRCOYNO,SRSEQ
     C*
     C                   EXSR      S010
     C* EXSCR SC0003
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01ED
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Print varaiance report
     C* IF FL0001=8
     C     FL0001        IFEQ      8
     C* SRCOYNO = A001(I01)
     C                   MOVE      A01(Z2)       WK0002
     C* DTSEQ = A002(I01)
     C                   Z-ADD     A02(Z2)       DTSEQ
     C* SVK002 = A002(I01)
     C                   Z-ADD     A02(Z2)       SVK002
     C* CALL 'PSTOKVARC',bat,srcoyno,dtseq
     C                   Z-ADD     1             CALLST
     C                   CALL      C0002         P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Update stock figures
     C* IF FL0001=9
     C     FL0001        IFEQ      9
     C* *** Check user allowed action             ibutes,
     C* BAT = 'I'
     C                   MOVE      'I'           BAT
     C* WKUSER = *userid
     C                   MOVE      *BLANKS       WKUSER
     C                   MOVEL     USER          WKUSER
     C* PRACT = 'A'
     C                   MOVE      'A'           PRACT
     C* PRALWD = ' '
     C                   MOVE      *BLANKS       PRALWD
     C* CALL 'BSECIMS',bat,prcoyno,wkuser,pract,pralwd
     C                   Z-ADD     1             CALLST
     C                   CALL      'BSECIMS'     P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF pralwd = 'N'
     C     PRALWD        IFEQ      'N'
     C* DSPERR fl0001,'USR0001','ERRORS'
     C                   MOVEL     'USR0001'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* GETREC D.STOKREQ,F.STOKREQ,*LOCK,*EQ,SRCOYNO,SVK002
     C*
     C                   EXSR      S011
     C* output are you sure
     C* YESNO = 'N'
     C                   MOVE      'N'           YESNO
     C* EXSCR scchek
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01ED
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* IF yesno = 'Y'
     C     YESNO         IFEQ      'Y'
     C* BAT = 'B'
     C                   MOVE      'B'           BAT
     C* SRCOYNO = A001(I01)
     C                   MOVE      A01(Z2)       WK0002
     C* DTSEQ = A002(I01)
     C                   Z-ADD     A02(Z2)       DTSEQ
     C* SVK002 = A002(I01)
     C                   Z-ADD     A02(Z2)       SVK002
     C* CALL 'PSTOKVARC',bat,srcoyno,dtseq
     C                   Z-ADD     1             CALLST
     C                   CALL      C0002         P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* CALL 'BSTOKSELC',bat,srcoyno,dtseq
     C                   Z-ADD     1             CALLST
     C                   CALL      C0003         P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* SRBFLAG = 'Y'
     C                   MOVE      'Y'           WK0001
     C* UPDATE d.stokreq,f.stokreq
     C*
     C                   EXSR      S012
     C* ELSE                                                          *
     C                   ELSE
     C* RLSREC d.stokreq,f.stokreq
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   UNLOCK    STOKREQX                             91      RLS LCK STOKREQX
     C* END                                                           *
     C                   END
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* END                                                           *
     C                   END
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0001<>0)&(UPDFLG=0)
     C     FL0001        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0001,'Invalid action choice'
     C                   MOVEL     C0004         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C*
     C     $S01ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S01FWD - SCRN SUB
     C*****************************************************************
     C     S01FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C01 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Clear Hidden key arrays used for later
     C* ** record retrieval.
     C* A001 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A002 = 0
     C                   Z-ADD     *ZERO         A02
     C* FLDATR fl0001,*nd,*pr
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.STOKREQ,F.STOKREQ,*NE,PRCOYNO
     C*
     C*
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM003        KRCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD01        DOUNE     'Y'                                          RD.SW.STOKREQ   ITMC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XRSEQ
     C                   MOVEL     *BLANKS       WK0010
     C                   MOVEL     *BLANKS       WK0008
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0006
     C                   MOVEL     *BLANKS       WK0003
     C                   MOVEL     *BLANKS       WK0007
     C                   MOVEL     *BLANKS       WK0005
     C                   MOVEL     *BLANKS       WK0004
     C                   MOVEL     *BLANKS       WK0018
     C                   MOVEL     *BLANKS       WK0016
     C                   MOVEL     *BLANKS       WK0017
     C                   MOVEL     *BLANKS       WK0014
     C                   MOVEL     *BLANKS       WK0011
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0012
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0004         READE     STOKREQ                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HRSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.STOKREQ   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = SRCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0002        A01(Z1)
     C* A002(C01) = SRSEQ
     C                   Z-ADD     XRSEQ         A02(Z1)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XRSEQ
     C                   MOVEL     *BLANKS       WK0010
     C                   MOVEL     *BLANKS       WK0008
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0006
     C                   MOVEL     *BLANKS       WK0003
     C                   MOVEL     *BLANKS       WK0007
     C                   MOVEL     *BLANKS       WK0005
     C                   MOVEL     *BLANKS       WK0004
     C                   MOVEL     *BLANKS       WK0018
     C                   MOVEL     *BLANKS       WK0016
     C                   MOVEL     *BLANKS       WK0017
     C                   MOVEL     *BLANKS       WK0014
     C                   MOVEL     *BLANKS       WK0011
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S009                                         RESET FP
     C* IF c01 = 0
     C     Z1            IFEQ      *ZERO
     C* EXSUBR s01bkw
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01FW
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C*
     C     $S01FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03BKW - SCRN SUB
     C*****************************************************************
     C     S03BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* FLDATR ssquant,*nd,*pr
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0020  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.STOKREQ,F.STOKSEL,*PV,SVK003,SVK004
     C*
     C                   EXSR      S013
     C*
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK003        KSCO01
     C                   Z-ADD     SVK004        KSSE02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR002S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR002C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN02
     C*
     C                   Z-ADD     1             XRN02                          Init Next RRN
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.STOKSEL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XSWHSE
     C                   MOVEL     *BLANKS       XSLOCN
     C                   MOVEL     *BLANKS       XSITEM
     C                   Z-ADD     *ZEROS        WK0020
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0005         READE(N)  STOKSEL                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   Z-ADD     *ZERO         HSSEQ                          Sequence
     C                   MOVEL     *BLANK        HSWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HSPCKR                         Picking Route
     C                   MOVEL     *BLANK        HSLOCN                         Location
     C                   MOVEL     *BLANK        HSITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.STOKSEL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR SSQUANT,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'WK0020  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   MOVEL     *BLANKS       XSWHSE
     C                   MOVEL     *BLANKS       XSLOCN
     C                   MOVEL     *BLANKS       XSITEM
     C                   Z-ADD     *ZEROS        WK0020
     C                   MOVEA     INS02         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR002S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR002S1                             90
     C                   MOVEA     INS02         *IN
     C                   END
     C     RRN02         IFGT      SRN02
     C                   Z-ADD     SRN02         RRN02
     C                   END
     C                   EXSR      S015                                         CHK EOF
     C*
     C     $S03BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03EDT - SCRN SUB
     C*****************************************************************
     C     S03EDT        BEGSR
     C*
     C* **   Process Maintenance List Panel (ML)
     C* **   1. Check for any selected records,
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* DOBLK D.STOKREQ
     C*
     C                   Z-ADD     RRN02         SRN02                          Save RRN
     C                   Z-ADD     1             RRN02                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS02
     C     SRN02         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR002S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C* UPDATE D.STOKREQ,F.STOKSEL
     C*
     C                   EXSR      S016
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR002S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN02         RRN02
     C                   MOVEA     INS02         *IN
     C*
     C*
     C*
     C     $S03ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03FWD - SCRN SUB
     C*****************************************************************
     C     S03FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C03 = 0
     C                   Z-ADD     *ZERO         C03
     C* FLDATR ssquant,*nd,*pr
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0020  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.STOKREQ,F.STOKSEL,*NE,SVK003,SVK004
     C*
     C*
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK003        KSCO01
     C                   Z-ADD     SVK004        KSSE02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR002S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR002C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN02
     C*
     C                   Z-ADD     1             XRN02                          Init Next RRN
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.STOKSEL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XSWHSE
     C                   MOVEL     *BLANKS       XSLOCN
     C                   MOVEL     *BLANKS       XSITEM
     C                   Z-ADD     *ZEROS        WK0020
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0005         READE(N)  STOKSEL                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   Z-ADD     *ZERO         HSSEQ                          Sequence
     C                   MOVEL     *BLANK        HSWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HSPCKR                         Picking Route
     C                   MOVEL     *BLANK        HSLOCN                         Location
     C                   MOVEL     *BLANK        HSITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.STOKSEL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR ssquant,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'WK0020  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* C03 = C03+1
     C     C03           ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        C03
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   MOVEL     *BLANKS       XSWHSE
     C                   MOVEL     *BLANKS       XSLOCN
     C                   MOVEL     *BLANKS       XSITEM
     C                   Z-ADD     *ZEROS        WK0020
     C                   MOVEA     INS02         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR002S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR002S1                             90
     C                   MOVEA     INS02         *IN
     C                   END
     C     RRN02         IFGT      SRN02
     C                   Z-ADD     SRN02         RRN02
     C                   END
     C                   EXSR      S015                                         RESET FP
     C*                                                               *
     C* IF c03 = 0
     C     C03           IFEQ      *ZERO
     C* EXSUBR s03bkw
     C                   EXSR      S03BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S03FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* SMSG - calls message handling program to either clear, add, or
     C*        remove messages from message subfile or extracts
     C*        messages from message files.
     C*****************************************************************
     C     SMSG          BEGSR
     C*
     C* Add message to message subfile
     C*
     C     MSGACT        IFEQ      'A'
     C     MSGACT        OREQ      'R'
     C                   MOVE      'Y'           MSGFLG
     C                   ELSE
     C* Clear message subfile or extract message from message file.
     C*
     C     MSGACT        IFEQ      'C'
     C                   MOVE      'N'           MSGFLG
     C                   END
     C                   END
     C*
     C     MSGACT        IFEQ      'C'
     C     MSGACT        OREQ      'A'
     C     MSGACT        OREQ      'E'
     C                   CALL      'CLMSG'       PMSGCL
     C                   MOVE      *BLANK        MSGID
     C                   MOVE      *BLANK        MSGF
     C                   MOVE      *BLANK        MSGFL
     C* Do not clear the message data field if message is extracted
     C* from message file
     C     MSGACT        IFNE      'E'
     C                   MOVE      *BLANK        MSGDTA
     C                   END
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC d.company,f.company,*eq,prcoyno
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM003        KYCO01
     C     K0001         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.COMPANY   IMSC
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C                   MOVEL     *LOVAL        HD0002                         Company number
     C                   Z-ADD     *LOVAL        HRSEQ                          Sequence
     C*
     C                   MOVEL     SVK001        KRCO01
     C                   MOVEL     SVK001        HD0002                         Company number
     C                   MOVEL     SVK001        RN0008                         Company number
     C                   Z-ADD     SVK002        KRSE02
     C                   Z-ADD     SVK002        HRSEQ                          Sequence
     C                   Z-ADD     SVK002        SRSEQ                          Sequence
     C*
     C     K0002         SETLL     STOKREQ                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - SETLL D.STOKREQ,F.STOKSEL,SVK003,SVK004,SVK005,SVK006,SVK007,SV
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   MOVEL     *LOVAL        HSWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HSPCKR                         Picking Route
     C                   MOVEL     *LOVAL        HSLOCN                         Location
     C                   MOVEL     *LOVAL        HSITEM                         Item Number
     C*
     C                   MOVEL     SVK003        KRCO01
     C                   MOVEL     SVK003        HD0003                         Company number
     C                   MOVEL     SVK003        RN0025                         Company number
     C                   Z-ADD     SVK004        KRSE02
     C                   Z-ADD     SVK004        HSSEQ                          Sequence
     C                   Z-ADD     SVK004        SSSEQ                          Sequence
     C                   MOVEL     SVK005        KSWH03
     C                   MOVEL     SVK005        HSWHSE                         Warehouse Number
     C                   MOVEL     SVK005        SSWHSE                         Warehouse Number
     C                   MOVEL     SVK006        KSPC04
     C                   MOVEL     SVK006        HSPCKR                         Picking Route
     C                   MOVEL     SVK006        SSPCKR                         Picking Route
     C                   MOVEL     SVK007        KSLO05
     C                   MOVEL     SVK007        HSLOCN                         Location
     C                   MOVEL     SVK007        SSLOCN                         Location
     C                   MOVEL     SVK008        KSIT06
     C                   MOVEL     SVK008        HSITEM                         Item Number
     C                   MOVEL     SVK008        SSITEM                         Item Number
     C*
     C     K0003         SETLL     STOKSEL                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETBLK D.STOKREQ,F.STOKREQ,*PV,prcoyno
     C**************************************************************************
     C     S007          BEGSR
     C*
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM003        KRCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN01        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ01        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD01        DOUNE     'Y'                                          RD.SW.STOKREQ   ITMC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0004         READPE    STOKREQ                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HRSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.STOKREQ   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S008                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - Process To Reset File Pointer(BOF) - STOKREQ
     C**************************************************************************
     C     S008          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.STOKREQ   ITMC
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0008        KRCO01
     C     K0004         SETLL     STOKREQ
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - Process To Reset File Pointer(EOF) - STOKREQ
     C**************************************************************************
     C     S009          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.STOKREQ   ITMC
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0008        KRCO01
     C     K0004         SETGT     STOKREQ
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       6             WADJ01
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.STOKREQ,F.STOKREQ,*EQ,SRCOYNO,SRSEQ
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     WK0002        KRCO01
     C                   Z-ADD     XRSEQ         KRSE02
     C     K0002         CHAIN     STOKREQ                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.STOKREQ,F.STOKREQ,*LOCK,*EQ,SRCOYNO,SVK002
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     WK0002        KRCO01
     C                   Z-ADD     SVK002        KRSE02
     C     K0002         CHAIN     STOKREQ                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   Z-ADD     REC01         HRC01
     C     HRC01         CHAIN     STOKREQX                           9091      STOKREQ
     C                   Z-ADD     STS04         STS01                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   ELSE
     C                   Z-ADD     *HIVAL        STS04                          REC LOCKED
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - UPDATE d.stokreq,f.stokreq
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   Z-ADD     HRC01         REC01
     C     HRC01         CHAIN     STOKREQX                           9091
     C                   Z-ADD     STS04         STS01                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0007        IFEQ      WK0001
     C     RN0008        ANDEQ     WK0002
     C     RN0009        ANDEQ     WK0003
     C     RN0010        ANDEQ     WK0004
     C     RN0011        ANDEQ     WK0005
     C     RN0012        ANDEQ     WK0006
     C     RN0013        ANDEQ     WK0007
     C     RN0014        ANDEQ     WK0008
     C     RN0015        ANDEQ     WK0009
     C     RN0016        ANDEQ     WK0010
     C     SRSEQ         ANDEQ     XRSEQ
     C     RN0017        ANDEQ     WK0011
     C     RN0018        ANDEQ     WK0012
     C     RN0019        ANDEQ     WK0013
     C     RN0020        ANDEQ     WK0014
     C     RN0021        ANDEQ     WK0015
     C     RN0022        ANDEQ     WK0016
     C     RN0023        ANDEQ     WK0017
     C     RN0024        ANDEQ     WK0018
     C                   UNLOCK    STOKREQX                             91      RLS LCK STOKREQX
     C                   ELSE
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    FMT001                               90      UPDATE STOKREQ
     C                   Z-ADD     STS04         STS01                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(3)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(4)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETBLK D.STOKREQ,F.STOKSEL,*PV,SVK003,SVK004
     C**************************************************************************
     C     S013          BEGSR
     C*
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK003        KSCO01
     C                   Z-ADD     SVK004        KSSE02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN02        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ02        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.STOKSEL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0005         READPE(N) STOKSEL                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   Z-ADD     *ZERO         HSSEQ                          Sequence
     C                   MOVEL     *BLANK        HSWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HSPCKR                         Picking Route
     C                   MOVEL     *BLANK        HSLOCN                         Location
     C                   MOVEL     *BLANK        HSITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.STOKSEL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S014                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - Process To Reset File Pointer(BOF) - STOKSEL
     C**************************************************************************
     C     S014          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.STOKSEL
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KSCO01                         Company number
     C                   MOVEL     RN0025        KSCO01
     C                   Z-ADD     SSSEQ         KSSE02                         Sequence
     C     K0005         SETLL     STOKSEL
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - Process To Reset File Pointer(EOF) - STOKSEL
     C**************************************************************************
     C     S015          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.STOKSEL
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KSCO01                         Company number
     C                   MOVEL     RN0025        KSCO01
     C                   Z-ADD     SSSEQ         KSSE02                         Sequence
     C     K0005         SETGT     STOKSEL
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ02
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - UPDATE D.STOKREQ,F.STOKSEL
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01                         Company number
     C                   MOVEL     HD0003        KSCO01
     C                   Z-ADD     HSSEQ         KSSE02                         Sequence
     C                   MOVEL     *BLANK        KSWH03                         Warehouse Number
     C                   MOVEL     HSWHSE        KSWH03
     C                   MOVEL     *BLANK        KSPC04                         Picking Route
     C                   MOVEL     HSPCKR        KSPC04
     C                   MOVEL     *BLANK        KSLO05                         Location
     C                   MOVEL     HSLOCN        KSLO05
     C                   MOVEL     *BLANK        KSIT06                         Item Number
     C                   MOVEL     HSITEM        KSIT06
     C     K0006         CHAIN     STOKSEL                            9091      CHAIN  STOKSEL
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0025        IFEQ      WK0019
     C     SSITEM        ANDEQ     XSITEM
     C     SSLOCN        ANDEQ     XSLOCN
     C     SSPCKR        ANDEQ     WSPCKR
     C     RN0026        ANDEQ     WK0020
     C     SSSEQ         ANDEQ     WSSEQ
     C     SSWHSE        ANDEQ     XSWHSE
     C                   UNLOCK    STOKSEL                              91      RLS LCK STOKSEL
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    STOKSELF                             90      UPDATE STOKSEL
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(5)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(6)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - List Screen for STOKSEL
     C* Validation subroutine for -- SC0003
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C     *IN64         IFEQ      '1'
     C                   Z-ADD     RRN02         SRN02
     C                   MOVEA     *IN           INS02
     C                   READC     SCR002S1                             9091
     C     *IN91         DOWEQ     '0'
     C     *IN90         ANDEQ     '0'
     C*
     C                   MOVEA     INSAV1        *IN
     C*
     C*
     C     WK0020        IFLE      N1(1)                                        High value
     C     WK0020        ANDGE     N1(2)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0020'      FLDNAM
     C                   MOVEL     'SC0003'      FLDSCR
     C     RANGEF        IFEQ      1                                            Range check
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'FLD0042'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C                   SETON                                        65
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR002S1
     C                   READC     SCR002S1                             9091
     C                   END
     C                   Z-ADD     SRN02         RRN02
     C                   MOVEA     INS02         *IN
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C*****************************************************************
     C* *PSSR - Program Execution Errors Handler
     C*****************************************************************
     C     *PSSR         BEGSR
     C     UERCNT        IFNE      *ZERO
     C                   MOVEL     '*CANCL'      URSUME
     C                   ELSE
     C                   Z-ADD     1             UERCNT
     C                   MOVE      'R'           MSGACT
     C                   MOVE      *BLANKS       MSGF
     C                   MOVEL     'QCPFMSG'     MSGF
     C                   MOVE      *BLANKS       MSGFL
     C                   MOVEL     'QSYS'        MSGFL
     C                   MOVE      *BLANKS       MSGDTA
     C     UMSGTX        IFNE      *BLANKS
     C                   MOVEL     UMSGTX        MSGDTA
     C                   ELSE
     C                   MOVEL     UROUTN        MSGDTA
     C                   END
     C*
     C     USTAT         IFEQ      *ZEROS
     C                   MOVE      UFSTAT        USTAT
     C                   MOVE      UFSRCL        USRCLN
     C                   END
     C                   MOVE      USTAT         USTAT4
     C*
     C     MSGID         IFEQ      *BLANKS
     C                   MOVE      USTAT4        MSGID
     C                   MOVEL     'RPG'         MSGID
     C                   MOVEL     'QRPGMSGE'    MSGF
     C                   END
     C*
     C                   CALL      'CLMSG'       PMSGCL                   93
     C*
     C                   MOVEL     '1'           UEROPT
     C                   EXFMT     PSSR0001
     C*
     C     UEROPT        IFEQ      '1'
     C                   MOVEL     '*GETIN  '    URSUME
     C                   ELSE
     C     UEROPT        IFEQ      '2'
     C                   MOVEL     '*CANCL  '    URSUME
     C                   ELSE
     C     UEROPT        IFEQ      '3'
     C                   MOVE      '        '    URSUME
     C                   END
     C                   END
     C                   END
     C                   END
     C*
     C                   MOVEL     *BLANK        MSGID
     C                   MOVE      *ZERO         UERCNT
     C*
     C                   ENDSR     URSUME
     C*/EJECT
     C*****************************************************************
     C* SATRIB - Display Attribute Handler
     C*****************************************************************
     C     SATRIB        BEGSR
     C*
     C* FIND TABLE OFFSET BY SCREEN ID AND FIELD NAME AND FIELD INDEX
     C*
     C                   Z-ADD     1             X0
     C     #MAP          LOOKUP    DA1(X0)                                90
     C     *IN90         IFEQ      '1'                                          IF FIND
     C                   MOVEA     DA2(X0)       DA3
     C*
     C*          ------------------------------------------------------
     C*          | @DSPERR/VALIDATION FIELD DISPLAY ATTRIBUTES
     C*          ------------------------------------------------------
     C     DSPERR        IFNE      *BLANK
     C     DA3(6)        IFNE      *BLANK                                       TURN ON *PC
     C                   MOVE      DA3(6)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVE      '0'           *IN80
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,6 NE *BLANK
     C*
     C     DA3(2)        IFNE      *BLANK                                       TURN ON *RI
     C                   MOVE      DA3(2)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,2 NE *BLANK
     C*
     C     DA3(3)        IFNE      *BLANK                                       TURN OFF *UL
     C     DA3(16)       ANDEQ     ' Y'                                         KEEP UL
     C                   MOVE      DA3(3)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '1'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,3 NE *BLANK
     C                   ELSE                                                   x-DSPERR NE *BL
     C*
     C*          ------------------------------------------------------
     C*          | *DS - RESET FIELD DISPLAY ATTRIBUTES
     C*          ------------------------------------------------------
     C     #DS           IFNE      *BLANK
     C     1             DO        15            X0
     C     DA3(X0)       IFNE      *BLANK
     C     X0            IFEQ      3
     C     DA3(16)       ANDEQ     ' Y'
     C                   ELSE                                                   x-X0 EQ 3
     C                   MOVE      DA3(X0)       X1
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    X0 EQ 3
     C                   END                                                    DA3,X0 NE *BLAN
     C                   END                                                    1 DO 15
     C*          ------------------------------------------------------
     C*          | *DS - TURN ON ORIGINAL COLOR ATTRIBUTES
     C*          |       IF THERE IS NO COLOR SPECIFIED
     C*          ------------------------------------------------------
     C     DA3(17)       IFNE      *BLANK
     C     #GN           ANDEQ     *BLANK
     C     #RD           ANDEQ     *BLANK
     C     #WT           ANDEQ     *BLANK
     C     #PK           ANDEQ     *BLANK
     C     #TQ           ANDEQ     *BLANK
     C     #YW           ANDEQ     *BLANK
     C     #BU           ANDEQ     *BLANK
     C                   MOVE      DA3(17)       X1
     C                   MOVEA     '1'           *IN(X1)
     C                   END                                                    DA3,17 NE *BLAN
     C                   END                                                    #DS NE *BLANK
     C*
     C*          ------------------------------------------------------
     C*          | LOOP TO TURN ON/OFF ATTRIBUTE INDICATORS
     C*          ------------------------------------------------------
     C     1             DO        15            X0
     C     DA3(X0)       IFNE      *BLANK
     C                   MOVE      DA3(X0)       X1
     C*          ------------------------------------------------------
     C*          | TURN ON ATTRIBUTE INDICATORS
     C*          ------------------------------------------------------
     C     DA6(X0)       IFNE      *BLANK
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DA6,X0 NE *BL
     C*          ------------------------------------------------------
     C*          | FOR COLOR ATTRIBUTE, RESET OTHER COLOR THAT ARE
     C*          | NOT SPECIFIED.
     C*          ------------------------------------------------------
     C     X0            IFGE      9
     C     X0            ANDLE     15
     C     #GN           IFNE      *BLANK
     C     #RD           ORNE      *BLANK
     C     #WT           ORNE      *BLANK
     C     #PK           ORNE      *BLANK
     C     #TQ           ORNE      *BLANK
     C     #YW           ORNE      *BLANK
     C     #BU           ORNE      *BLANK
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    #GN NE *BLANK
     C                   END                                                    X0 GE 9
     C                   END                                                    DA6,X0 NE *BLAN
     C                   END                                                    DA3,X0 NE *BLAN
     C                   END                                                    1 DO 15
     C                   END                                                    DSPERR NE *BLAN
     C                   END                                                    *IN90 EQ '1'
     C*
     C                   MOVE      *BLANK        #ATRIB
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    STOKREQX                             91      STOKREQX  MSTOKSELD
     C                   READ      STOKREQX                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            STOKREQ
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            COMPANY
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            STOKSEL
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            STOKREQX
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOF - Move Fields From Work Area To File(s)
     C*****************************************************************
     C     SMVTOF        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - STOKREQ
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0001        RN0007                         Batch Update flag
     C                   MOVEL     WK0002        RN0008                         Company number
     C                   MOVEL     WK0003        RN0009                         From Item Class
     C                   MOVEL     WK0004        RN0010                         From Item Number
     C                   MOVEL     WK0005        RN0011                         From Location
     C                   MOVEL     WK0006        RN0012                         From Branch Number
     C                   MOVEL     WK0007        RN0013                         FromStock Group
     C                   MOVEL     WK0008        RN0014                         From Stock Inventory
     C                   MOVEL     WK0009        RN0015                         From Supplier Number
     C                   MOVEL     WK0010        RN0016                         From Warehouse Numbe
     C                   Z-ADD     XRSEQ         SRSEQ                          Sequence
     C                   MOVEL     WK0011        RN0017                         To Item Class
     C                   MOVEL     WK0012        RN0018                         To Item Number
     C                   MOVEL     WK0013        RN0019                         To Location
     C                   MOVEL     WK0014        RN0020                         To Branch Number
     C                   MOVEL     WK0015        RN0021                         To Stock Group
     C                   MOVEL     WK0016        RN0022                         To Stock Inventory G
     C                   MOVEL     WK0017        RN0023                         To Supplier Number
     C                   MOVEL     WK0018        RN0024                         To Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - STOKSEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WK0019        RN0025                         Company number
     C                   MOVEL     XSITEM        SSITEM                         Item Number
     C                   MOVEL     XSLOCN        SSLOCN                         Location
     C                   MOVEL     WSPCKR        SSPCKR                         Picking Route
     C                   Z-ADD     WK0020        RN0026                         Quantity counted
     C                   Z-ADD     WSSEQ         SSSEQ                          Sequence
     C                   MOVEL     XSWHSE        SSWHSE                         Warehouse Number
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKREQ
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0007        WK0001                         Batch Update flag
     C                   MOVEL     RN0008        WK0002                         Company number
     C                   MOVEL     RN0009        WK0003                         From Item Class
     C                   MOVEL     RN0010        WK0004                         From Item Number
     C                   MOVEL     RN0011        WK0005                         From Location
     C                   MOVEL     RN0012        WK0006                         From Branch Number
     C                   MOVEL     RN0013        WK0007                         FromStock Group
     C                   MOVEL     RN0014        WK0008                         From Stock Inventory
     C                   MOVEL     RN0015        WK0009                         From Supplier Number
     C                   MOVEL     RN0016        WK0010                         From Warehouse Numbe
     C                   Z-ADD     SRSEQ         XRSEQ                          Sequence
     C                   MOVEL     RN0017        WK0011                         To Item Class
     C                   MOVEL     RN0018        WK0012                         To Item Number
     C                   MOVEL     RN0019        WK0013                         To Location
     C                   MOVEL     RN0020        WK0014                         To Branch Number
     C                   MOVEL     RN0021        WK0015                         To Stock Group
     C                   MOVEL     RN0022        WK0016                         To Stock Inventory G
     C                   MOVEL     RN0023        WK0017                         To Supplier Number
     C                   MOVEL     RN0024        WK0018                         To Warehouse Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0008        HD0002                         Company number
     C                   Z-ADD     SRSEQ         HRSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKSEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0025        WK0019                         Company number
     C                   MOVEL     SSITEM        XSITEM                         Item Number
     C                   MOVEL     SSLOCN        XSLOCN                         Location
     C                   MOVEL     SSPCKR        WSPCKR                         Picking Route
     C                   Z-ADD     RN0026        WK0020                         Quantity counted
     C                   Z-ADD     SSSEQ         WSSEQ                          Sequence
     C                   MOVEL     SSWHSE        XSWHSE                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0025        HD0003                         Company number
     C                   Z-ADD     SSSEQ         HSSEQ                          Sequence
     C                   MOVEL     SSWHSE        HSWHSE                         Warehouse Number
     C                   MOVEL     SSPCKR        HSPCKR                         Picking Route
     C                   MOVEL     SSLOCN        HSLOCN                         Location
     C                   MOVEL     SSITEM        HSITEM                         Item Number
     C                   END
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C********************************************************************
     C*            C o m p i l e   T i m e   A r r a y
     C*               I n i t i a l i z a t i o n
     C********************************************************************
**   Alpha Constant Array - A1
The beginning of the file was reached
The end of the file was reached
Record update for file IMS Stock take request      SR
Unable to update record for file IMS Stock take request      SR
Record update for file IMS Stocktake items rqustd  SS
Unable to update record for file IMS Stocktake items rqustd  SS
**   Numeric Constant Array - N1
000000000000999999999000000000
000000000000000000000000000000
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XYDESC    0000  05      05
SC0003    XYDESC    0000  05      05
SC0003    WK0020    0000  0103    010402               Y
SC0001    FL0001    0000  0103    010402               Y
