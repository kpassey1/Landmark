     F/TITLE EPORDS    Display PO for Supplier
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    EPORDS
     F*  Application ID      -    EPORDS
     F*  Application Name    -       Display PO for Supplier
     F*  Date Generated      -    Jan 12, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  PORDHSU     - (I/DISK   ) P.O. By supplier
     F*  PORDD       - (I/DISK   ) Purchase Order Detail       PO
     F*  IPSITEM     - (I/DISK   ) IPS Supplied Items
     F*  EPORDSD     - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCR001     - Initial list panel
     F*
     F*  01     - SCR001S1 / RN0034 : DSPATR(ND)
     F*  02     - SCR001S1 / WSACT : DSPATR(PC)
     F*  02     - SCR001S1 / WSACT : DSPATR(RI)
     F*  03     - SCR001S1 / WSACT : DSPATR(PR)
     F*  04     - SCR001S1 / WSACT : DSPATR(UL)
     F*  05     - SCR001S1 / WSACT : DSPATR(ND)
     F*  06     - SCR001S1 / WSDELD : DSPATR(ND)
     F*  07     - SCR001S1 / POQORD : DSPATR(ND)
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
     F*  SCR002     - Detail panel
     F*
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SCR003     - Header information
     F*
     F*  99     - SCR003 OVERLAY
     F* N79     - SCR003 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - Initial list panel
     F* S002 - Detail panel
     F* S003 - Header information
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW - Roll backward
     F* S01FWD - Roll forward
     F* SY0010 - Format Date
     F* SCMD - Processes OS/400 Commands
     F* SMSG - calls message handling program to either clear, add, or
     F* S004   - CLRSCR SCR001
     F* S005   - Process To Initialize SubFile - SCR001S1
     F* S006   - GETREC D.COMPANY,F.COMPANY,*EQ,COYNO#
     F* S007   - SETLL D.PORDhsu,F.PORDhsu,COYNO#,prsupp,prsupb
     F* S008   - CLRSCR SCR002
     F* S009   - GETREC D.PORDhsu,f.pordhsu,*eq,COYNO#,svsup,svbrn,svpord
     F* S010   - GETREC D.PORDhsu,f.pordd,*eq,COYNO#,svpord,SVseq
     F* S011   - GETREC D.ipsitem,F.ipsitem,*EQ,COYNO#,svsup,svbrn,poitem
     F* S012   - CLRSCR SCR003
     F* S013   - GETBLK D.PORDhsu,*PV,COYNO#
     F* S014   - Process To Reset File Pointer(BOF) - PORDHSU   PORDD
     F* S015   - Process To Reset File Pointer(EOF) - PORDHSU   PORDD
     F* *PSSR - Program Execution Errors Handler
     F* SATRIB - Display Attribute Handler
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FEPORDSD   CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FPORDHSU   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPORDD     IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIPSITEM   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D BRN             S              3    DIM(14)
     D POR             S             10    DIM(14)
     D SEQ             S              5  0 DIM(14)
     D SUP             S              6    DIM(14)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D CST             S              1    DIM(2560)                            Command string
     D A1              S             80    DIM(2) CTDATA PERRCD(1)              Alpha constants i
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(7) CTDATA PERRCD(1)              Fld Attr. Indic t
     D DA2             S             34    DIM(7) ALT(DA1)
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D*
     D* Company Number
     D*
     D @DS001          DS             3
     D  COYNO#                 1      3
     D*
     D* KDPKEY3
     D*
     D @DS002          DS            27
     D  KDPKEY                 1     27
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
     D @DS003          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS004          DS
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
     D C0001           C                   CONST('Action must be 1 or -
     D                                     5')
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
     D @DS005          DS
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
     I              CYCOYNO                     RN0008
     I              CYEMPCOL                    RN0009
     I              CYEMPHEAD                   RN0010
     I              CYPRDHEAD                   RN0011
     I              CYREFHEAD                   RN0012
     I              CYSDESC                     RN0013
     IIPSITEMF
     I              PIBRNBR                     RN0014
     I              PICNVCDE                    RN0015
     I              PICOYNO                     RN0016
     I              PIPBRK1                     RN0017
     I              PIPBRK2                     RN0018
     I              PIPBRK3                     RN0019
     I              PIPBRK4                     RN0020
     I              PIPRCOD                     RN0021
     I              PIQBRK1                     RN0022
     I              PIQBRK2                     RN0023
     I              PIQBRK3                     RN0024
     I              PIQBRK4                     RN0025
     I              PISDESC                     RN0026
     I              PISPITM                     RN0027
     I              PISUPPN                     RN0028
     IPORDDF
     I              POCOYNO                     RN0029
     I              PODLVDT                     RN0030
     I              POIDESC                     RN0031
     I              PONLALL                     RN0032
     I              POPRICE                     RN0033
     I              POQRCVD                     RN0034
     I              POQRCYC                     RN0035
     IPORDHF
     I              PHBRNBR                     RN0036
     I              PHBUYER                     RN0037
     I              PHCMPDT                     RN0038
     I              PHCONNAM                    RN0039
     I              PHCOYNO                     RN0040
     I              PHCUSORD                    RN0041
     I              PHDLVDT                     RN0042
     I              PHENTDT                     RN0043
     I              PHLRCVDT                    RN0044
     I              PHNLALL                     RN0045
     I              PHNOPOS                     RN0046
     I              PHRLAUD                     RN0047
     I              PHSHIPV                     RN0048
     I              PHSLIN1                     RN0049
     I              PHSLIN2                     RN0050
     I              PHSLIN3                     RN0051
     I              PHSLIN4                     RN0052
     I              PHSLIN5                     RN0053
     I              PHSLIN6                     RN0054
     I              PHSNAME                     RN0055
     I              PHSPSTCD                    RN0056
     I              PHSUPPN                     RN0057
     I              PHWLIN1                     RN0058
     I              PHWLIN2                     RN0059
     I              PHWLIN3                     RN0060
     I              PHWLIN4                     RN0061
     I              PHWLIN5                     RN0062
     I              PHWLIN6                     RN0063
     I              PHWNAME                     RN0064
     I              PHWPSTCD                    RN0065
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    PGO
     C                   PARM                    KDPKEY           27
     C                   PARM                    WK0601
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRSUPP            6
     C                   PARM                    PRSUPB            3
     C                   PARM                    PRMEND            1
     C                   PARM                    XYMD              6 0
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
     C                   KFLD                    KHCO01
     C                   KFLD                    KHSU02
     C                   KFLD                    KHBR03
     C*
     C     K0003         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHSU02
     C                   KFLD                    KHBR03
     C                   KFLD                    KHPO04
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C                   KFLD                    KOSE03
     C*
     C     K0005         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KISU02
     C                   KFLD                    KIBR03
     C                   KFLD                    KIIT04
     C*
     C     K0006         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0007         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C                   KFLD                    KOSE03
     C*
     C     K0008         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0008        WK0001                         Company number
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    RN0030        WK0003                         Delivery Date
     C     *LIKE         DEFINE    RN0042        WK0013                         Delivery Date
     C     *LIKE         DEFINE    RN0063        WK0029                         Line 6
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0008        HD0001
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0016        HD0003
     C     *LIKE         DEFINE    RN0028        HD0004
     C     *LIKE         DEFINE    RN0014        HD0002
     C     *LIKE         DEFINE    PIITEM        HIITEM
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
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
     C                   MOVE      *ZEROS        SVCY              4 0          Save days
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *ZEROS        DT1550           15 5
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        I                 3 0
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *BLANKS       PGO               3
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *BLANKS       PRM002           10
     C                   MOVE      *ZEROS        PRM003            5 0
     C                   MOVE      *BLANKS       SVBRN             3
     C                   MOVE      *BLANKS       SVDESC           40
     C                   MOVE      *BLANKS       SVPORD           10
     C                   MOVE      *ZEROS        SVSEQ             5 0
     C                   MOVE      *BLANKS       SVSUP             6
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0001            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0002            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0003           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0004            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0005            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0006            4            SYMMDDA
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        WK0601            8 0
     C                   MOVE      *ZEROS        WSACT             1 0
     C                   MOVE      *BLANKS       WSDELD           10
     C                   MOVE      *BLANKS       RN0007           10            WSDLVDT
     C                   MOVE      *BLANKS       WSDLVE           10
     C                   MOVE      *BLANKS       WSIDES           20
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *BLANKS       RN0066            1            P.O. Pending
     C                   MOVE      *BLANKS       RN0067            1            Print P.O.Requested
     C                   MOVE      *BLANKS       RN0068            1            Print Receiving List
     C                   MOVE      *BLANKS       RN0069            1            special order attent
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       KHCO01            3            PHCOYNO
     C                   MOVE      *BLANKS       KHSU02            6            PHSUPPN
     C                   MOVE      *BLANKS       KHBR03            3            PHBRNBR
     C                   MOVE      *BLANKS       KHPO04           10            PHPORD
     C                   MOVE      *BLANKS       KHPO02           10            PHPORD
     C                   MOVE      *ZEROS        KOSE03            5 0          POSEQ
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO01            3            PICOYNO
     C                   MOVE      *BLANKS       KISU02            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR03            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT04           20            PIITEM
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       KOPO02           10            POPORD
     C                   MOVE      *BLANKS       RN0070           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       CMDERR            1
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVEL     'LANDIPS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     1             XRN01
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        X1                3 0          INDEX 1
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        SRN01             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN01             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN01             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS          0030
     C                   Z-ADD     1             C3                5 0          *CST INDEX
     C                   Z-ADD     1             CALLST            1 0          CALL STSEX
     C                   Z-ADD     *ZEROS        LEN              15 5
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
     C*
     C     *DTAARA       DEFINE    COMPNUMB      @DS001
     C     *DTAARA       DEFINE    KDPKEY3       @DS002
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
     C                   MOVEL     'SCR001'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SCR001'      S001
     C     SCRNID        CASEQ     'SCR002'      S002
     C     SCRNID        CASEQ     'SCR003'      S003
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
     C* S001 - Initial list panel
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0001000'     *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* WK0601 = *ymd
     C                   Z-ADD     XYMD          WK0601
     C* PGO = ' '
     C                   MOVEL     *BLANKS       PGO
     C* GETDTAA KDPKEY3
     C                   IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* CALL 'MITMKV',pgo,KDPKEY,wk0601
     C                   Z-ADD     1             CALLST
     C                   CALL      'MITMKV'      P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF pgo <> '@@*'
     C     PGO           IFNE      '@@*'
     C* SIGNOFF                                                       *
     C                   MOVEA     *BLANKS       CST
     C                   MOVEA     'SIGNOFF '    CST
     C                   EXSR      SCMD
     C* END                                                           *
     C                   END
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* GETDTAA compnumb
     C                   IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* CLRSCR SCR001
     C*
     C                   EXSR      S004
     C*                                                               *
     C* GETREC D.COMPANY,F.COMPANY,*EQ,COYNO#
     C*
     C                   EXSR      S006
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0004
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0005
     C* SVDESC = cydesc
     C                   MOVE      XYDESC        SVDESC
     C*                                                               *
     C* SETLL D.PORDhsu,F.PORDhsu,COYNO#,prsupp,prsupb
     C*
     C                   EXSR      S007
     C*                                                               *
     C* EXSUBR s01fwd
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
     C                   MOVEA     '0'           *IN(2)
     C                   MOVEA     '1'           *IN(4)
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
     C* PRMEND = 'Y'
     C                   MOVE      'Y'           PRMEND
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
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
     C* Backward
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** scroll information backwards
     C*                                                               *
     C* EXSUBR s01bkw
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Forward
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forward
     C*                                                               *
     C* EXSUBR s01fwd
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*                                                               *
     C* IF I = 0
     C     I             IFEQ      *ZERO
     C* EXSUBR s01bkw
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter
     C*                                                               *
     C* I = 0
     C                   Z-ADD     *ZERO         I
     C* DOBLK D.PORDhsu
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
     C                   MOVEA     '0'           *IN(2)
     C                   MOVEA     '1'           *IN(4)
     C* I = i + 1
     C     I             ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        I
     C* IF wsact=5
     C     WSACT         IFEQ      5
     C* SVPORD = por(i)
     C                   MOVE      POR(I)        SVPORD
     C* SVSEQ = seq(i)
     C                   Z-ADD     SEQ(I)        SVSEQ
     C* SVSUP = sup(i)
     C                   MOVE      SUP(I)        SVSUP
     C* SVBRN = brn(i)
     C                   MOVE      BRN(I)        SVBRN
     C* MODE = wsact
     C                   Z-ADD     WSACT         MODE
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* WSACT = 0
     C                   Z-ADD     *ZERO         WSACT
     C* ELSE                                                          *
     C                   ELSE
     C* IF wsact=1
     C     WSACT         IFEQ      1
     C* MODE = wsact
     C                   Z-ADD     WSACT         MODE
     C* SVPORD = por(i)
     C                   MOVE      POR(I)        SVPORD
     C* SVSUP = sup(i)
     C                   MOVE      SUP(I)        SVSUP
     C* SVBRN = brn(i)
     C                   MOVE      BRN(I)        SVBRN
     C* EXSCR SCR003
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* WSACT = 0
     C                   Z-ADD     *ZERO         WSACT
     C* ELSE                                                          *
     C                   ELSE
     C* IF wsact<>0
     C     WSACT         IFNE      *ZERO
     C* DSPERR wsact,'Action must be 1 or 5'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WSACT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '0'           *IN(2)
     C                   MOVEA     '1'           *IN(4)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C                   END
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - Detail panel
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0001000'     *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* *** Clear screens and get values from files
     C*                                                               *
     C* CLRSCR SCR002
     C*
     C                   EXSR      S008
     C* CYDESC = svdesc
     C                   MOVE      SVDESC        XYDESC
     C*                                                               *
     C* Get selected record, If not found display message
     C* Set exit flag to signal previous routine and return
     C* to list panel.
     C* GETREC D.PORDhsu,f.pordhsu,*eq,COYNO#,svsup,svbrn,svpord
     C*
     C                   EXSR      S009
     C* GETREC D.PORDhsu,f.pordd,*eq,COYNO#,svpord,SVseq
     C*
     C                   EXSR      S010
     C* GETREC D.ipsitem,F.ipsitem,*EQ,COYNO#,svsup,svbrn,poitem
     C*
     C                   EXSR      S011
     C* *** Format the date
     C* SYDATI = podlvdt
     C                   Z-ADD     WK0003        RN0002
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* WSDLVE = SYDATo
     C                   MOVE      RN0003        WSDLVE
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
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Header
     C*
     C     *INKE         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXSCR scr003
     C                   ADD       1             SP
     C                   MOVEL     'SCR002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to List panel on function key 12
     C*                                                               *
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Header information
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0001000'     *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* CLRSCR SCR003
     C*
     C                   EXSR      S012
     C* CYDESC = svdesc
     C                   MOVE      SVDESC        XYDESC
     C* Get selected record for edit function.
     C* GETREC D.PORDHsu,F.PORDHsu,*eq,COYNO#,svsup,svbrn,SVpord
     C*
     C                   EXSR      S009
     C* *** Format the date
     C* SYDATI = phdlvdt
     C                   Z-ADD     WK0013        RN0002
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* WSDLVDT = SYDATo
     C                   MOVE      RN0003        RN0007
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
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* PRMEND = 'Y'
     C                   MOVE      'Y'           PRMEND
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to list panel on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* EXTSCR                                                        *
     C                   GOTO      $00399
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
     C     SID(CT)       IFEQ      'SCR001'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   WRITE     SCR001C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SCR002'
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   ELSE
     C     SID(CT)       IFEQ      'SCR003'
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
     C* S01BKW - Roll backward
     C*****************************************************************
     C     S01BKW        BEGSR
     C*
     C* *** scroll information backwards
     C*                                                               *
     C* I = 0
     C                   Z-ADD     *ZERO         I
     C* POR = ' '
     C                   MOVEA     *BLANKS       POR
     C* SEQ = 0
     C                   Z-ADD     *ZERO         SEQ
     C* FLDATR wsact,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'WSACT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR poqord,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR poqrcvd,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'WK0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wsdeld,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'WSDELD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORDhsu,*PV,COYNO#
     C*
     C                   EXSR      S013
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     14            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDHSU   PORD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        WSACT
     C                   MOVEL     *BLANKS       XOPORD
     C                   MOVEL     *BLANKS       WSDELD
     C                   MOVEL     *BLANKS       WSIDES
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     *ZEROS        WK0007
     C                   MOVEL     *BLANKS       WK0023
     C                   MOVEL     *BLANKS       WK0009
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD
     C     K0006         READE     PORDHSU                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0007                         Company number
     C                   MOVEL     *BLANK        HD0008                         Supplier Number
     C                   MOVEL     *BLANK        HD0006                         Branch Number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   END
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDHSU   PORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0040        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     PHPORD        KOPO02
     C                   Z-ADD     HOSEQ         KOSE03                         Sequence
     C     K0007         SETLL     PORDD
     C                   END                                                    END-STATUS
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0008         READE     PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0005                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* I = i + 1
     C     I             ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        I
     C* POR(I) = popord
     C                   MOVE      *BLANKS       POR(I)
     C                   MOVE      XOPORD        POR(I)
     C* SEQ(I) = poseq
     C                   Z-ADD     XOSEQ         SEQ(I)
     C* SUP(I) = phsuppn
     C                   MOVE      *BLANKS       SUP(I)
     C                   MOVE      WK0023        SUP(I)
     C* BRN(I) = phbrnbr
     C                   MOVE      *BLANKS       BRN(I)
     C                   MOVE      WK0009        BRN(I)
     C* WSIDES = POIDESC
     C                   MOVE      *BLANKS       WSIDES
     C                   MOVEL     WK0004        WSIDES
     C* *** Format the date
     C* SYDATI = podlvdt
     C                   Z-ADD     WK0003        RN0002
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01BK
     C                   END
     C* WSDELD = SYDATO
     C                   MOVE      RN0003        WSDELD
     C*                                                               *
     C* FLDATR wsact,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'WSACT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR poqord,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR poqrcvd,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'WK0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wsdeld,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'WSDELD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        WSACT
     C                   MOVEL     *BLANKS       XOPORD
     C                   MOVEL     *BLANKS       WSDELD
     C                   MOVEL     *BLANKS       WSIDES
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     *ZEROS        WK0007
     C                   MOVEL     *BLANKS       WK0023
     C                   MOVEL     *BLANKS       WK0009
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
     C                   EXSR      S015                                         CHK EOF
     C*                                                               *
     C*
     C     $S01BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S01FWD - Roll forward
     C*****************************************************************
     C     S01FWD        BEGSR
     C*
     C* FLDATR wsact,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'WSACT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR poqord,*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR poqrcvd,*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'WK0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wsdeld,*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'WSDELD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* I = 0
     C                   Z-ADD     *ZERO         I
     C* POR = ' '
     C                   MOVEA     *BLANKS       POR
     C* SEQ = 0
     C                   Z-ADD     *ZERO         SEQ
     C*                                                               *
     C* GETBLK D.PORDhsu,*NE,COYNO#
     C*
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     14            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDHSU   PORD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        WSACT
     C                   MOVEL     *BLANKS       XOPORD
     C                   MOVEL     *BLANKS       WSDELD
     C                   MOVEL     *BLANKS       WSIDES
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     *ZEROS        WK0007
     C                   MOVEL     *BLANKS       WK0023
     C                   MOVEL     *BLANKS       WK0009
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD
     C     K0006         READE     PORDHSU                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0007                         Company number
     C                   MOVEL     *BLANK        HD0008                         Supplier Number
     C                   MOVEL     *BLANK        HD0006                         Branch Number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   END
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDHSU   PORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0040        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     PHPORD        KOPO02
     C                   Z-ADD     HOSEQ         KOSE03                         Sequence
     C     K0007         SETLL     PORDD
     C                   END                                                    END-STATUS
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0008         READE     PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0005                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* I = i + 1
     C     I             ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        I
     C* POR(I) = popord
     C                   MOVE      *BLANKS       POR(I)
     C                   MOVE      XOPORD        POR(I)
     C* SEQ(I) = poseq
     C                   Z-ADD     XOSEQ         SEQ(I)
     C* SUP(I) = phsuppn
     C                   MOVE      *BLANKS       SUP(I)
     C                   MOVE      WK0023        SUP(I)
     C* BRN(I) = phbrnbr
     C                   MOVE      *BLANKS       BRN(I)
     C                   MOVE      WK0009        BRN(I)
     C* WSIDES = POIdesc
     C                   MOVE      *BLANKS       WSIDES
     C                   MOVEL     WK0004        WSIDES
     C* WSDELD %dmc(podlvdt)
     C* *** Format the date
     C* SYDATI = podlvdt
     C                   Z-ADD     WK0003        RN0002
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01FW
     C                   END
     C* WSDELD = SYDATO
     C                   MOVE      RN0003        WSDELD
     C*                                                               *
     C* FLDATR wsact,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'WSACT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR poqord,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR poqrcvd,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'WK0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wsdeld,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'WSDELD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        WSACT
     C                   MOVEL     *BLANKS       XOPORD
     C                   MOVEL     *BLANKS       WSDELD
     C                   MOVEL     *BLANKS       WSIDES
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     *ZEROS        WK0007
     C                   MOVEL     *BLANKS       WK0023
     C                   MOVEL     *BLANKS       WK0009
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
     C                   EXSR      S015                                         RESET FP
     C*
     C     $S01FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* SY0010 - Format Date
     C*****************************************************************
     C     SY0010        BEGSR
     C*
     C* *** INPUT PARAMETER = SYDATI - CYMD field 8N CMD
     C* ***                 = SYDSEP - date seperator
     C* ***                 = SYDFMT - date format
     C* ***                                                           *
     C* *** OUTPUT PARAMETER = SYDATO - Char date field 10A
     C* *** Split date components
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0005        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0005
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0002        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0002        SYMMDD
     C* SYMM = %ljf(SYMMDD) ; Month 2
     C*  Left Justify field into result field
     C                   MOVEL     SYMMDD        SYMM
     C* SYDD = %rjf(SYMMDD) ; Days  2
     C*  Right Justify field into result field
     C                   MOVE      SYMMDD        SYDD
     C*                                                               *
     C* *** Convert elements to Char
     C*                                                               *
     C* SYCCYYA = %CTC(SYCCYY)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0001
     C                   MOVEL     SYCCYY        RN0001
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0006
     C                   MOVEL     SYMMDD        RN0006
     C* SYMMA = %CTC(SYMM)
     C*  Convert To Character
     C                   MOVE      *BLANK        SYMMA
     C                   MOVEL     SYMM          SYMMA
     C* SYDDA = %CTC(SYDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        SYDDA
     C                   MOVEL     SYDD          SYDDA
     C*                                                               *
     C* IF SYDFMT = '1'
     C     RN0004        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0004        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0002        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0003
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0002        RN0002
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0005        RN0005
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0004        RN0004
     C*
     C     $SY001        ENDSR
     C/EJECT
     C*****************************************************************
     C* SCMD - Processes OS/400 Commands
     C*****************************************************************
     C     SCMD          BEGSR
     C*
     C                   MOVE      'N'           CMDERR                         Error flag
     C                   Z-ADD     2560          LEN
     C                   MOVE      '1'           *IN79
     C* Validate command syntax
     C*
     C                   CALL      'QCMDCHK'                            92
     C                   PARM                    CST                            CMD string
     C                   PARM                    LEN                            Length
     C* Check command syntax failure
     C*
     C     *IN92         IFEQ      '1'
     C                   MOVE      'Y'           CMDERR
     C                   END
     C* Execute command
     C*
     C     CMDERR        IFEQ      'N'
     C                   CALL      'QCMDEXC'                            92
     C                   PARM                    CST
     C                   PARM                    LEN
     C* Check command failure
     C*
     C     *IN92         IFEQ      '1'
     C                   MOVE      'Y'           CMDERR
     C                   END
     C                   END
     C*
     C                   MOVEA     *BLANKS       CST
     C                   ENDSR
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
     C* S004   - CLRSCR SCR001
     C**************************************************************************
     C     S004          BEGSR
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   Z-ADD     *ZEROS        WSACT                          INZ WSACT
     C                   MOVEL     *BLANK        WSDELD                         INZ WSDELD
     C                   MOVEL     *BLANK        WSIDES                         INZ WSIDES
     C                   MOVEL     *BLANK        XOPORD                         INZ XOPORD
     C                   Z-ADD     *ZEROS        XOQORD                         INZ XOQORD
     C                   Z-ADD     *ZEROS        WK0007                         INZ WK0007
     C                   MOVEL     *BLANK        WK0009                         INZ WK0009
     C                   MOVEL     *BLANK        WK0023                         INZ WK0023
     C                   EXSR      S005                                         INZ SFL
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - Process To Initialize SubFile - SCR001S1
     C**************************************************************************
     C     S005          BEGSR
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C*
     C                   MOVEA     '1110'        *IN(63)                        SFLCLR SFLDSP
     C                   MOVEA     *IN           INSAV1
     C     1             DO        14            RRN01
     C                   WRITE     SCR001S1                             90
     C                   END
     C*
     C                   Z-ADD     1             RRN01
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.COMPANY,F.COMPANY,*EQ,COYNO#
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     COYNO#        KYCO01
     C     K0001         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.COMPANY   IMSC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - SETLL D.PORDhsu,F.PORDhsu,COYNO#,prsupp,prsupb
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD
     C                   MOVEL     *LOVAL        HD0007                         Company number
     C                   MOVEL     *LOVAL        HD0008                         Supplier Number
     C                   MOVEL     *LOVAL        HD0006                         Branch Number
     C                   MOVEL     *LOVAL        HHPORD                         Purchase Order Numbe
     C*
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     COYNO#        HD0007                         Company number
     C                   MOVEL     COYNO#        RN0040                         Company number
     C                   MOVEL     PRSUPP        KHSU02
     C                   MOVEL     PRSUPP        HD0008                         Supplier Number
     C                   MOVEL     PRSUPP        RN0057                         Supplier Number
     C                   MOVEL     PRSUPB        KHBR03
     C                   MOVEL     PRSUPB        HD0006                         Branch Number
     C                   MOVEL     PRSUPB        RN0036                         Branch Number
     C*
     C     K0002         SETLL     PORDHSU                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - CLRSCR SCR002
     C**************************************************************************
     C     S008          BEGSR
     C                   MOVEL     *BLANK        WSDLVE                         INZ WSDLVE
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   MOVEL     *BLANK        WK0002                         INZ WK0002
     C                   Z-ADD     *ZEROS        XOCONV                         INZ XOCONV
     C                   MOVEL     *BLANK        XOITEM                         INZ XOITEM
     C                   MOVEL     *BLANK        XOPORD                         INZ XOPORD
     C                   Z-ADD     *ZEROS        XOQORD                         INZ XOQORD
     C                   Z-ADD     *ZEROS        XOSEQ                          INZ XOSEQ
     C                   MOVEL     *BLANK        XOUOM                          INZ XOUOM
     C                   MOVEL     *BLANK        XOWHSE                         INZ XOWHSE
     C                   MOVEL     *BLANK        WK0004                         INZ WK0004
     C                   MOVEL     *BLANK        WK0005                         INZ WK0005
     C                   Z-ADD     *ZEROS        WK0006                         INZ WK0006
     C                   Z-ADD     *ZEROS        WK0007                         INZ WK0007
     C                   Z-ADD     *ZEROS        WK0008                         INZ WK0008
     C                   MOVEL     *BLANK        WK0021                         INZ WK0021
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.PORDhsu,f.pordhsu,*eq,COYNO#,svsup,svbrn,svpord
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KHSU02
     C                   MOVEL     SVSUP         KHSU02
     C                   MOVEL     *BLANK        KHBR03
     C                   MOVEL     SVBRN         KHBR03
     C                   MOVEL     *BLANK        KHPO04
     C                   MOVEL     SVPORD        KHPO04
     C     K0003         CHAIN     PORDHSU                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.PORDhsu,f.pordd,*eq,COYNO#,svpord,SVseq
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     SVPORD        KHPO02
     C                   Z-ADD     SVSEQ         KOSE03
     C     K0004         CHAIN     PORDD                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.ipsitem,F.ipsitem,*EQ,COYNO#,svsup,svbrn,poitem
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     COYNO#        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     SVSUP         KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     SVBRN         KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     XOITEM        KIIT04
     C     K0005         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - CLRSCR SCR003
     C**************************************************************************
     C     S012          BEGSR
     C                   MOVEL     *BLANK        RN0007                         INZ RN0007
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   MOVEL     *BLANK        XHPORD                         INZ XHPORD
     C                   MOVEL     *BLANK        XHWHSE                         INZ XHWHSE
     C                   MOVEL     *BLANK        WK0009                         INZ WK0009
     C                   MOVEL     *BLANK        WK0010                         INZ WK0010
     C                   MOVEL     *BLANK        WK0011                         INZ WK0011
     C                   MOVEL     *BLANK        WK0012                         INZ WK0012
     C                   MOVEL     *BLANK        WK0014                         INZ WK0014
     C                   MOVEL     *BLANK        WK0015                         INZ WK0015
     C                   MOVEL     *BLANK        WK0016                         INZ WK0016
     C                   MOVEL     *BLANK        WK0017                         INZ WK0017
     C                   MOVEL     *BLANK        WK0018                         INZ WK0018
     C                   MOVEL     *BLANK        WK0019                         INZ WK0019
     C                   MOVEL     *BLANK        WK0020                         INZ WK0020
     C                   MOVEL     *BLANK        WK0021                         INZ WK0021
     C                   MOVEL     *BLANK        WK0022                         INZ WK0022
     C                   MOVEL     *BLANK        WK0023                         INZ WK0023
     C                   MOVEL     *BLANK        WK0024                         INZ WK0024
     C                   MOVEL     *BLANK        WK0025                         INZ WK0025
     C                   MOVEL     *BLANK        WK0026                         INZ WK0026
     C                   MOVEL     *BLANK        WK0027                         INZ WK0027
     C                   MOVEL     *BLANK        WK0028                         INZ WK0028
     C                   MOVEL     *BLANK        WK0030                         INZ WK0030
     C                   MOVEL     *BLANK        WK0031                         INZ WK0031
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETBLK D.PORDhsu,*PV,COYNO#
     C**************************************************************************
     C     S013          BEGSR
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
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
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDHSU   PORD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD
     C     K0006         READPE    PORDHSU                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0007                         Company number
     C                   MOVEL     *BLANK        HD0008                         Supplier Number
     C                   MOVEL     *BLANK        HD0006                         Branch Number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   END
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDHSU   PORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD
     C                   Z-ADD     *HIVAL        HOSEQ                          Sequence
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0040        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     PHPORD        KOPO02
     C                   Z-ADD     HOSEQ         KOSE03                         Sequence
     C     K0007         SETGT     PORDD
     C                   END                                                    END-STATUS
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0008         READPE    PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0005                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S014                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - Process To Reset File Pointer(BOF) - PORDHSU   PORDD
     C**************************************************************************
     C     S014          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDHSU   PORD
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C     SWRD03        ANDNE     'Y'                                          RD.SW.PORDD
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0040        KHCO01
     C     K0006         SETLL     PORDHSU
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0029        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C                   Z-ADD     POSEQ         KOSE03                         Sequence
     C     K0007         SETLL     PORDD
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
     C* S015   - Process To Reset File Pointer(EOF) - PORDHSU   PORDD
     C**************************************************************************
     C     S015          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDHSU   PORD
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C     SWRD03        ANDNE     'Y'                                          RD.SW.PORDD
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHSU   PORD
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0040        KHCO01
     C     K0006         SETGT     PORDHSU
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   Z-ADD     *HIVAL        HOSEQ                          Sequence
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0029        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C                   Z-ADD     POSEQ         KOSE03                         Sequence
     C     K0007         SETGT     PORDD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       14            WADJ01
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
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            COMPANY
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
     C     WFILE#        IFEQ      2                                            PORDHSU
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
     C     WFILE#        IFEQ      3                                            PORDD
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
     C     WFILE#        IFEQ      4                                            IPSITEM
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
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0008        WK0001                         Company number
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0008        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDHSU
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0036        WK0009                         Branch Number
     C                   MOVEL     RN0037        WK0010                         Buyers Code
     C                   MOVEL     RN0039        WK0011                         Contact name
     C                   MOVEL     RN0041        WK0012                         Our customer order n
     C                   Z-ADD     RN0042        WK0013                         Delivery Date
     C                   MOVEL     RN0045        WK0014                         Allocation Acc
     C                   MOVEL     PHPORD        XHPORD                         Purchase Order Numbe
     C                   MOVEL     RN0049        WK0015                         Supplier Address
     C                   MOVEL     RN0050        WK0016                         Line 2
     C                   MOVEL     RN0051        WK0017                         Line 3
     C                   MOVEL     RN0052        WK0018                         Line 4
     C                   MOVEL     RN0053        WK0019                         Line 5
     C                   MOVEL     RN0054        WK0020                         Line 6
     C                   MOVEL     RN0055        WK0021                         Supplier name
     C                   MOVEL     RN0056        WK0022                         Post code
     C                   MOVEL     RN0057        WK0023                         Supplier Number
     C                   MOVEL     PHWHSE        XHWHSE                         Warehouse Number
     C                   MOVEL     RN0058        WK0024                         Address
     C                   MOVEL     RN0059        WK0025                         Line 2
     C                   MOVEL     RN0060        WK0026                         Line 3
     C                   MOVEL     RN0061        WK0027                         Line 4
     C                   MOVEL     RN0062        WK0028                         Line 5
     C                   MOVEL     RN0063        WK0029                         Line 6
     C                   MOVEL     RN0064        WK0030                         Wharehouse Name
     C                   MOVEL     RN0065        WK0031                         Post code
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0040        HD0007                         Company number
     C                   MOVEL     RN0057        HD0008                         Supplier Number
     C                   MOVEL     RN0036        HD0006                         Branch Number
     C                   MOVEL     PHPORD        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     POCONV        XOCONV                         Conversion Qty
     C                   Z-ADD     RN0030        WK0003                         Delivery Date
     C                   MOVEL     RN0031        WK0004                         Item Description
     C                   MOVEL     POITEM        XOITEM                         Item Number
     C                   MOVEL     RN0032        WK0005                         Allocated account
     C                   MOVEL     POPORD        XOPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0033        WK0006                         Price
     C                   Z-ADD     POQORD        XOQORD                         Quantity ordered
     C                   Z-ADD     RN0034        WK0007                         Quantity received
     C                   Z-ADD     RN0035        WK0008                         Received this cycle
     C                   Z-ADD     POSEQ         XOSEQ                          Sequence
     C                   MOVEL     POUOM         XOUOM                          Unit of Measure
     C                   MOVEL     POWHSE        XOWHSE                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0029        HD0005                         Company number
     C                   MOVEL     POPORD        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     POSEQ         HOSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0027        WK0002                         Item Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0016        HD0003                         Company number
     C                   MOVEL     RN0028        HD0004                         Supplier Number
     C                   MOVEL     RN0014        HD0002                         Branch Number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   END
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
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SCR001    WSACT     0000  0204    020503               Y
SCR001    XOQORD    0000            07
SCR001    WK0007    0000            01
SCR001    WSDELD    0000            06
