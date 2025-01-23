     F/TITLE MFSSTOR    Work with Store CrossRef
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MFSSTOR
     F*  Application ID      -    MFSSTOR
     F*  Application Name    -       Work with Store CrossRef
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  FSSTOR      - (U/DISK   ) IMS Warehouse/Store Xref
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  MFSSTORD    - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SC0001     - List Screen for FSSTOR
     F*
     F*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0001 : DSPATR(ND)
     F*  05     - SCR001C1 / PS0102 : DSPATR(PR)
     F*  06     - SCR001 / CYDESC : DSPATR(PC)
     F*  06     - SCR001 / CYDESC : DSPATR(RI)
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
     F*  SC0002     - Detail Screen for FSSTOR
     F*
     F*  01     - SCR002 / WLUSDF : DSPATR(PR)
     F*  02     - SCR002 / WLWHSE : DSPATR(PC)
     F*  02     - SCR002 / WLWHSE : DSPATR(RI)
     F*  03     - SCR002 / WLWHSE : DSPATR(PR)
     F*  04     - SCR002 / WLWHSE : DSPATR(UL)
     F*  05     - SCR002 / CYDESC : DSPATR(PC)
     F*  05     - SCR002 / CYDESC : DSPATR(RI)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for FSSTOR
     F* S002 - Detail Screen for FSSTOR
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S01FWD - SCRN SUB
     F* SMSG - calls message handling program to either clear, add, or
     F* S003   - GETREC d.company,f.company,*eq,prm001
     F* S004   - SETLL D.FSSTOR,F.FSSTOR,SVK001,SVK002
     F* S005   - GETREC D.FSSTOR,F.FSSTOR,*lock,*eq,SVK001,SVK002
     F* S006   - GETREC D.FSSTOR,F.FSSTOR,*eq,SVK001,SVK002
     F* S007   - UPDATE D.FSSTOR,F.FSSTOR
     F* S008   - DELETE D.FSSTOR,F.FSSTOR
     F* S009   - WRITE D.FSSTOR,F.FSSTOR
     F* S010   - GETBLK D.FSSTOR,F.FSSTOR,*PV,SVK001
     F* S011   - Process To Reset File Pointer(BOF) - FSSTOR
     F* S012   - Process To Reset File Pointer(EOF) - FSSTOR
     F* S013   - GETREC D.FSSTOR,F.FSSTOR,*EQ,WLCNO,WLUSDF
     F* S002V - Detail Screen for FSSTOR
     F* *PSSR - Program Execution Errors Handler
     F* SATRIB - Display Attribute Handler
     F* SLOCK - Update Lock Flag
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMFSSTORD  CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FFSSTOR    UF A E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              3    DIM(11)
     D A02             S              5    DIM(11)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(1) CTDATA PERRCD(1)              Alpha constants i
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(9) CTDATA PERRCD(1)              Fld Attr. Indic t
     D DA2             S             34    DIM(9) ALT(DA1)
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
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
     D C0001           C                   CONST('Record not found for-
     D                                      Edit')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('Record not found for-
     D                                      Delete')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('Record not found for-
     D                                      Display')
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
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM001            3
     C                   PARM                    PRM002            5
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
     C                   KFLD                    KLCN01
     C                   KFLD                    KLUS02
     C*
     C     K0003         KLIST
     C                   KFLD                    KLCN01
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
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
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *ZEROS        PRMCNT            3 0
     C                   MOVE      *BLANKS       PS0101            3
     C                   MOVE      *BLANKS       PS0102            5
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *BLANKS       SVK002            5
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          003
     C                   MOVE      *BLANKS       KLCN01            3            WLCNO
     C                   MOVE      *BLANKS       KLUS02            5            WLUSDF
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        LISTF             1 0          List of value flag
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
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        X1                3 0          INDEX 1
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        SRN01             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN01             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN01             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
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
     C     SCRNID        CASEQ     'SC0002'      S002
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
     C* S001 - List Screen for FSSTOR
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '001000'      *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C* GETREC d.company,f.company,*eq,prm001
     C*
     C                   EXSR      S003
     C*                                                               *
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* WLUSDF = ' '
     C                   MOVEL     *BLANKS       XLUSDF
     C* WLWHSE = ' '
     C                   MOVEL     *BLANKS       XLWHSE
     C*                                                               *
     C* Count number of parms passed.
     C* Protect all parms first, Then if a parm was not
     C* passed, unprotect it and reduce parm count.
     C*                                                               *
     C* If parms are not generated, these fields
     C* will be blank.
     C* FLDATR PS0101,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'PS0101  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PS0102,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'PS0102  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* PRMCNT = 002
     C                   Z-ADD     002           PRMCNT
     C*                                                               *
     C* IF PRM002=' '
     C     PRM002        IFEQ      *BLANKS
     C* PRMCNT = PRMCNT-1
     C     PRMCNT        SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        PRMCNT
     C* FLDATR PS0102,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'PS0102  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* IF PRM001=' '
     C     PRM001        IFEQ      *BLANKS
     C* PRMCNT = PRMCNT-1
     C     PRMCNT        SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        PRMCNT
     C* FLDATR PS0101,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'PS0101  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* Set Key values to parms passed
     C* SVK001 = PRM001
     C                   MOVE      PRM001        SVK001
     C* SVK002 = PRM002
     C                   MOVE      PRM002        SVK002
     C*                                                               *
     C* Set Reposition values to parms passed
     C* PS0101 = PRM001
     C                   MOVE      PRM001        PS0101
     C* PS0102 = PRM002
     C                   MOVE      PRM002        PS0102
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.FSSTOR,F.FSSTOR,SVK001,SVK002
     C*
     C                   EXSR      S004
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
     C                   MOVEA     '0'           *IN(6)
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
     C* Help
     C*
     C     *INKA         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process help requests on function key 1
     C*                                                               *
     C* DSPHLP                                                        *
     C                   MOVE      'Y'           CMDKEY
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
     C* Create
     C*
     C     *INKF         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process ADD Request on function key 6
     C*                                                               *
     C* MODE = 6
     C                   Z-ADD     6             MODE
     C* EXSCR SC0002
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* SETLL D.FSSTOR,F.FSSTOR,SVK001,SVK002
     C*
     C                   EXSR      S004
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* ***  Scroll information backward on function key 7
     C* **   1. Check for any selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* **   2. Fill panel.
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
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forward on function key 8
     C* **  1. Check for selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* **  2. Fill panel.
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
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
     C* *** Check field only if not passed as parm.
     C*                                                               *
     C* IF (PS0102<>' ')*AND(PRM002=' ')
     C     PS0102        IFNE      *BLANKS
     C     PRM002        ANDEQ     *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF (PS0101<>' ')*AND(PRM001=' ')
     C     PS0101        IFNE      *BLANKS
     C     PRM001        ANDEQ     *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* ELSE                                                          *
     C                   ELSE
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK001 = PS0101
     C                   MOVE      PS0101        SVK001
     C* SVK002 = PS0102
     C                   MOVE      PS0102        SVK002
     C* Reset/clear reposition values to parms passed
     C* PS0101 = PRM001
     C                   MOVE      PRM001        PS0101
     C* PS0102 = PRM002
     C                   MOVE      PRM002        PS0102
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 *OR updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C*                                                               *
     C* Set pointer to file.
     C* SETLL D.FSSTOR,F.FSSTOR,SVK001,SVK002
     C*
     C                   EXSR      S004
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
     C* S002 - Detail Screen for FSSTOR
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00010'       *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=2 *OR MODE=4 *OR MODE=5
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C     MODE          OREQ      5
     C*                                                               *
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* SVK001 = WLCNO
     C                   MOVE      XLCNO         SVK001
     C* SVK002 = WLUSDF
     C                   MOVE      XLUSDF        SVK002
     C* WLCNO = ' '
     C                   MOVEL     *BLANKS       XLCNO
     C* WLUSDF = ' '
     C                   MOVEL     *BLANKS       XLUSDF
     C* WLWHSE = ' '
     C                   MOVEL     *BLANKS       XLWHSE
     C* WLCNO = SVK001
     C                   MOVE      SVK001        XLCNO
     C* WLUSDF = SVK002
     C                   MOVE      SVK002        XLUSDF
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR FSSTOR.FSSTOR.WLUSDF,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XLUSDF  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.FSSTOR,F.FSSTOR,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S005
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.FSSTOR,F.FSSTOR)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK01         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.FSSTOR,F.FSSTOR)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* FLDATR FSSTOR.FSSTOR.WLWHSE,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XLWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.FSSTOR,F.FSSTOR,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S005
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.FSSTOR,F.FSSTOR)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK01         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.FSSTOR,F.FSSTOR)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.FSSTOR,F.FSSTOR,*eq,SVK001,SVK002
     C*
     C                   EXSR      S006
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.FSSTOR,F.FSSTOR)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* WLCNO = prm001
     C                   MOVE      PRM001        XLCNO
     C* WLUSDF = ' '
     C                   MOVEL     *BLANKS       XLUSDF
     C* WLWHSE = ' '
     C                   MOVEL     *BLANKS       XLWHSE
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
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
     C                   EXFMT     SCR002
     C                   MOVEA     '0'           *IN(2)
     C                   MOVEA     '10'          *IN(4)
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
     C* Help
     C*
     C     *INKA         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process help request on function key 1
     C*                                                               *
     C* DSPHLP                                                        *
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** End the program
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to list panel on function key 12
     C* Set exit flag to signal previous screen
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C*                                                               *
     C* Release record if edit or delete functions
     C* IF mode=2 | mode=4
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C* RLSREC D.FSSTOR,F.FSSTOR
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   UNLOCK    FSSTOR                               91      RLS LCK FSSTOR
     C* END                                                           *
     C                   END
     C*                                                               *
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
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* ** Revise
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.FSSTOR,F.FSSTOR
     C*
     C                   EXSR      S007
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.FSSTOR,F.FSSTOR
     C*
     C                   EXSR      S008
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.FSSTOR,F.FSSTOR
     C*
     C                   EXSR      S009
     C* ** Set keys for first record to display.
     C* SVK001 = WLCNO
     C                   MOVE      XLCNO         SVK001
     C* SVK002 = WLUSDF
     C                   MOVE      XLUSDF        SVK002
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.FSSTOR,F.FSSTOR)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
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
     C     SID(CT)       IFEQ      'SC0002'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
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
     C* C01 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Clear hidden key arrays used for record
     C* ** retrieval.
     C* A001 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A002 = ' '
     C                   MOVEA     *BLANKS       A02
     C*                                                               *
     C* FLDATR FL0001,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.FSSTOR,F.FSSTOR,*PV,SVK001
     C*
     C                   EXSR      S010
     C*
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     SVK001        KLCN01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     11            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.FSSTOR
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XLUSDF
     C                   MOVEL     *BLANKS       XLWHSE
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  FSSTOR                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.FSSTOR
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HLCNO                          Company number
     C                   MOVEL     *BLANK        HLUSDF                         Store Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.FSSTOR
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR FL0001,*UL,*DS
     C                   MOVE      'X'           #UL
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
     C* A001(C01) = WLCNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      XLCNO         A01(Z1)
     C* A002(C01) = WLUSDF
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XLUSDF        A02(Z1)
     C* ** Fill any possible work fields in list
     C* ** panel with secondary file fields.
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
     C                   MOVEL     *BLANKS       XLUSDF
     C                   MOVEL     *BLANKS       XLWHSE
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
     C                   EXSR      S012                                         CHK EOF
     C*
     C     $S01BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S01EDT - SCRN SUB
     C*****************************************************************
     C     S01EDT        BEGSR
     C*
     C* ** Process Maintenance on Detail Panel (MB)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I01 = 0
     C                   Z-ADD     *ZERO         Z2
     C* DOBLK D.FSSTOR
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
     C                   MOVEA     '0'           *IN(6)
     C* I01 = I01+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0001=2)*OR(FL0001=4)*OR(FL0001=5)
     C     FL0001        IFEQ      2
     C     FL0001        OREQ      4
     C     FL0001        OREQ      5
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* ** set keys from hidden key arrays.
     C* WLCNO = A001(I01)
     C                   MOVE      A01(Z2)       XLCNO
     C* WLUSDF = A002(I01)
     C                   MOVE      A02(Z2)       XLUSDF
     C* ** Get record and any secondary records.
     C* GETREC D.FSSTOR,F.FSSTOR,*EQ,WLCNO,WLUSDF
     C*
     C                   EXSR      S013
     C* ** Display Screen.
     C* EXSCR SC0002
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
     C* ** Process any optional action codes.
     C*    1. Set keys from hidden key arrays.
     C*    2. Get record and any secondary records.
     C*    3. Display Screen.
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0001<>0)*AND(UPDFLG=0)
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
     C                   MOVEA     '0'           *IN(6)
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
     C* C01 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Clear Hidden key arrays used for later
     C* ** record retrieval.
     C* A001 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A002 = ' '
     C                   MOVEA     *BLANKS       A02
     C* FLDATR FL0001,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.FSSTOR,F.FSSTOR,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     SVK001        KLCN01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     11            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.FSSTOR
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XLUSDF
     C                   MOVEL     *BLANKS       XLWHSE
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  FSSTOR                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.FSSTOR
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HLCNO                          Company number
     C                   MOVEL     *BLANK        HLUSDF                         Store Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.FSSTOR
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR FL0001,*UL,*DS
     C                   MOVE      'X'           #UL
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
     C* A001(C01) = WLCNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      XLCNO         A01(Z1)
     C* A002(C01) = WLUSDF
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XLUSDF        A02(Z1)
     C* ** Set any work fields to values in
     C* ** secondary file fields.
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
     C                   MOVEL     *BLANKS       XLUSDF
     C                   MOVEL     *BLANKS       XLWHSE
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
     C                   EXSR      S012                                         RESET FP
     C*                                                               *
     C*                                                               *
     C* IF c01=0
     C     Z1            IFEQ      *ZERO
     C* EXSUBR s01bkw
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S01FW        ENDSR
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
     C* S003   - GETREC d.company,f.company,*eq,prm001
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
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
     C* S004   - SETLL D.FSSTOR,F.FSSTOR,SVK001,SVK002
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   MOVEL     *LOVAL        HLCNO                          Company number
     C                   MOVEL     *LOVAL        HLUSDF                         Store Number
     C*
     C                   MOVEL     SVK001        KLCN01
     C                   MOVEL     SVK001        HLCNO                          Company number
     C                   MOVEL     SVK001        WLCNO                          Company number
     C                   MOVEL     SVK002        KLUS02
     C                   MOVEL     SVK002        HLUSDF                         Store Number
     C                   MOVEL     SVK002        WLUSDF                         Store Number
     C*
     C     K0002         SETLL     FSSTOR                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.FSSTOR,F.FSSTOR,*lock,*eq,SVK001,SVK002
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     SVK001        KLCN01
     C                   MOVEL     *BLANK        KLUS02
     C                   MOVEL     SVK002        KLUS02
     C     K0002         CHAIN     FSSTOR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD01                         RD.SW.FSSTOR
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.FSSTOR,F.FSSTOR,*eq,SVK001,SVK002
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     SVK001        KLCN01
     C                   MOVEL     *BLANK        KLUS02
     C                   MOVEL     SVK002        KLUS02
     C     K0002         CHAIN(N)  FSSTOR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.FSSTOR
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - UPDATE D.FSSTOR,F.FSSTOR
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCN01                         Company number
     C                   MOVEL     HLCNO         KLCN01
     C                   MOVEL     *BLANK        KLUS02                         Store Number
     C                   MOVEL     HLUSDF        KLUS02
     C     K0002         CHAIN     FSSTOR                             9091      CHAIN  FSSTOR
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     WLCNO         IFEQ      XLCNO
     C     WLUSDF        ANDEQ     XLUSDF
     C     WLWHSE        ANDEQ     XLWHSE
     C                   UNLOCK    FSSTOR                               91      RLS LCK FSSTOR
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    FSSTORR                              90      UPDATE FSSTOR
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - DELETE D.FSSTOR,F.FSSTOR
     C**************************************************************************
     C     S008          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     XLCNO         KLCN01
     C                   MOVEL     *BLANK        KLUS02
     C                   MOVEL     XLUSDF        KLUS02
     C     K0002         SETLL     FSSTOR                                       SETLL  FSSTOR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - FSSTOR
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0002         READE     FSSTOR                               9190    READE  FSSTOR
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    FSSTOR                               91      DELETE FSSTOR
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0002         SETLL     FSSTOR                                       RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - WRITE D.FSSTOR,F.FSSTOR
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     FSSTORR                              90      ADD REC TO FSSTOR
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETBLK D.FSSTOR,F.FSSTOR,*PV,SVK001
     C**************************************************************************
     C     S010          BEGSR
     C*
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     SVK001        KLCN01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.FSSTOR
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READPE(N) FSSTOR                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.FSSTOR
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HLCNO                          Company number
     C                   MOVEL     *BLANK        HLUSDF                         Store Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.FSSTOR
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S011                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - Process To Reset File Pointer(BOF) - FSSTOR
     C**************************************************************************
     C     S011          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.FSSTOR
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCN01                         Company number
     C                   MOVEL     WLCNO         KLCN01
     C     K0003         SETLL     FSSTOR
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - Process To Reset File Pointer(EOF) - FSSTOR
     C**************************************************************************
     C     S012          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.FSSTOR
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCN01                         Company number
     C                   MOVEL     WLCNO         KLCN01
     C     K0003         SETGT     FSSTOR
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       11            WADJ01
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETREC D.FSSTOR,F.FSSTOR,*EQ,WLCNO,WLUSDF
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     XLCNO         KLCN01
     C                   MOVEL     *BLANK        KLUS02
     C                   MOVEL     XLUSDF        KLUS02
     C     K0002         CHAIN(N)  FSSTOR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.FSSTOR
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSSTOR
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - Detail Screen for FSSTOR
     C* Validation subroutine for -- SC0002
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XLWHSE        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XLWHSE'      FLDNAM
     C                   MOVEL     'SC0002'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'FLD0068'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
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
     C* SLOCK - Update Lock Flag
     C*****************************************************************
     C     SLOCK         BEGSR
     C     STS01         IFEQ      1218                                         LOCK(SYS)-FSSTOR
     C     STS01         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK01                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK01                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            FSSTOR
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
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOF - Move Fields From Work Area To File(s)
     C*****************************************************************
     C     SMVTOF        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - FSSTOR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     XLCNO         WLCNO                          Company number
     C                   MOVEL     XLUSDF        WLUSDF                         Store Number
     C                   MOVEL     XLWHSE        WLWHSE                         Warehouse Number
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - FSSTOR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WLCNO         XLCNO                          Company number
     C                   MOVEL     WLUSDF        XLUSDF                         Store Number
     C                   MOVEL     WLWHSE        XLWHSE                         Warehouse Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     WLCNO         HLCNO                          Company number
     C                   MOVEL     WLUSDF        HLUSDF                         Store Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C********************************************************************
     C*            C o m p i l e   T i m e   A r r a y
     C*               I n i t i a l i z a t i o n
     C********************************************************************
**   Alpha Constant Array - A1

**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XYDESC    0000  06      06
SC0002    XYDESC    0000  05      05
SC0002    XLWHSE    0000  0204    02  03               Y
SC0001    PS0102    0000              05
SC0001    FL0001    0000  0103    010402               Y
SC0002    XLUSDF    0000              01
