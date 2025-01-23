     F/TITLE BSTOKREQ     Stock Request Update
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BSTOKREQ
     F*  Application ID      -    BSTOKREQ
     F*  Application Name    -        Stock Request Update
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  STOKREQ     - (I/DISK   ) IMS Stock take request      SR
     F*  WLOCITM     - (I/DISK   ) IMS Warehouse Location Item WI
     F*  WAREDET     - (I/DISK   ) IMS Warehouse Item Details  WD
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  STOKSEL1    - (I/DISK   ) IMS Selected in whs loc item
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  STOKREQX    - (U/DISK   ) IMS Stock take request      SR
     F*  FILE0001    - (U/DISK   ) IMS Selected in whs loc item
     F*  BSTOKREQO   - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SPEACT - Performs all the program end actions.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.company,F.company,*EQ,PRCOYNO
     F* S002   - GETREC D.STOKREQ,F.STOKREQ,*EQ,PRCOYNO,PRSEQ
     F* S003   - SETLL D.WAREHED,F.WLOCITM,PRCOYNO,SRFWHSE,SRFLOCN,SRFITEM
     F* S004   - GETREC D.WAREHED,F.Wlocitm,*NE,PrCOYNO
     F* S005   - Process To Reset File Pointer(EOF) - WLOCITM
     F* S006   - GETREC d.warehed,f.waredet,*eq,prcoyno,wiwhse,wiitem
     F* S007   - GETREC D.ITMMast,F.ITMMAST,*eq,PrCOYNO,WiITEM
     F* S008   - GETREC D.STOKSEL1,F.STOKSEL1,*EQ,PRCOYNO,WIWHSE,WILOCN,WIITEM
     F* S009   - GETREC D.WAREHED,F.WARELOC,*EQ,PRCOYNO,WIWHSE,WILOCN
     F* S010   - WRITE D.SToksel1,F.SToksel1
     F* S011   - UPDATE D.STOKREQ,F.STOKREQ
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FSTOKREQ   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWLOCITM   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWAREDET   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FSTOKSEL1  IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FFILE0002  O    E             PRINTER
     F                                     INFDS(FIDS10)
     FSTOKREQX  UF   E             DISK
     F                                     INFDS(FIDS08)
     F                                     RENAME(STOKREQF:FMT001)
     F                                     INFSR(SFERR)
     FFILE0001  UF A E             DISK
     F                                     INFDS(FIDS09)
     F                                     RENAME(STOKSELF:FMT002)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                367    368B 0
     D  OLN10                188    189B 0
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
     D* Program status data structure
     D*
     D SDS            SDS
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
     IITMSTRF
     I              ITALPHA                     RN0007
     I              ITCOYNO                     RN0008
     I              ITIDESC                     RN0009
     ISTOKREQF
     I              SRBFLAG                     RN0010
     I              SRCOYNO                     RN0011
     I              SRFCLAS                     RN0012
     I              SRFITEM                     RN0013
     I              SRFLOCN                     RN0014
     I              SRFSBRN                     RN0015
     I              SRFSGRP                     RN0016
     I              SRFSTIG                     RN0017
     I              SRFSUPPN                    RN0018
     I              SRFWHSE                     RN0019
     I              SRTCLAS                     RN0020
     I              SRTITEM                     RN0021
     I              SRTLOCN                     RN0022
     I              SRTSBRN                     RN0023
     I              SRTSGRP                     RN0024
     I              SRTSTIG                     RN0025
     I              SRTSUPPN                    RN0026
     I              SRTWHSE                     RN0027
     ISTOKSELF
     I              SSCOYNO                     RN0028
     I              SSQUANT                     RN0029
     IWDETAILF
     I              WDCOYNO                     RN0030
     I              WDSUPPN                     RN0031
     IWARELOCF
     I              WLCOYNO                     RN0032
     IWLOCITMF
     I              WICOYNO                     RN0033
     IFMT001
     I              SRBFLAG                     RN0010
     I              SRCOYNO                     RN0011
     I              SRFCLAS                     RN0012
     I              SRFITEM                     RN0013
     I              SRFLOCN                     RN0014
     I              SRFSBRN                     RN0015
     I              SRFSGRP                     RN0016
     I              SRFSTIG                     RN0017
     I              SRFSUPPN                    RN0018
     I              SRFWHSE                     RN0019
     I              SRTCLAS                     RN0020
     I              SRTITEM                     RN0021
     I              SRTLOCN                     RN0022
     I              SRTSBRN                     RN0023
     I              SRTSGRP                     RN0024
     I              SRTSTIG                     RN0025
     I              SRTSUPPN                    RN0026
     I              SRTWHSE                     RN0027
     IFMT002
     I              SSCOYNO                     RN0028
     I              SSQUANT                     RN0029
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C                   PARM                    PRSEQ             5 0
     C*
     C     PMSGCL        PLIST
     C                   PARM                    MSGACT            1
     C                   PARM                    MSGID             7
     C                   PARM                    MSGF             10
     C                   PARM                    MSGFL            10
     C                   PARM                    MSGDTA          132
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
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KLLO03
     C                   KFLD                    KDIT04
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C*
     C     K0006         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIT02
     C*
     C     K0007         KLIST
     C                   KFLD                    KSCO01
     C                   KFLD                    KSWH02
     C                   KFLD                    KSLO03
     C                   KFLD                    KSIT04
     C*
     C     K0008         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KLLO03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0001        WK0001                         Company number
     C     *LIKE         DEFINE    ITCLAS        WTCLAS                         Item Class
     C     *LIKE         DEFINE    ITIGRP        WTIGRP                         Stock Group
     C     *LIKE         DEFINE    RN0010        WK0002                         Batch Update flag
     C     *LIKE         DEFINE    RN0011        WK0003                         Company number
     C     *LIKE         DEFINE    SRSEQ         WRSEQ                          Sequence
     C     *LIKE         DEFINE    RN0028        WK0020                         Company number
     C     *LIKE         DEFINE    SSPCKR        WSPCKR                         Picking Route
     C     *LIKE         DEFINE    RN0029        WK0021                         Quantity counted
     C     *LIKE         DEFINE    WDSBRN        WK0022                         Branch Number
     C     *LIKE         DEFINE    WDSTOG        WK0023                         Stock Turnover Group
     C     *LIKE         DEFINE    RN0031        WK0024                         Supplier Number
     C     *LIKE         DEFINE    WLPCKR        WK0025                         Picking Route
     C     *LIKE         DEFINE    WIITEM        WK0026                         Item Number
     C     *LIKE         DEFINE    WILOCN        WK0027                         Location
     C     *LIKE         DEFINE    WIWHSE        WK0028                         Warehouse Number
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0008        HD0002
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0011        HD0003
     C     *LIKE         DEFINE    SRSEQ         HRSEQ
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0028        HD0004
     C     *LIKE         DEFINE    SSWHSE        HSWHSE
     C     *LIKE         DEFINE    SSLOCN        HSLOCN
     C     *LIKE         DEFINE    SSITEM        HSITEM
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0030        HD0005
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0032        HD0006
     C     *LIKE         DEFINE    WLWHSE        HLWHSE
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0033        HD0007
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    WIITEM        HIITEM
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
     C                   MOVE      *BLANKS       NOREC             1
     C                   MOVE      *BLANKS       PRINT             1
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          003
     C                   MOVE      *BLANKS       KRCO01            3            SRCOYNO
     C                   MOVE      *ZEROS        KRSE02            5 0          SRSEQ
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KLLO03           10            WLLOCN
     C                   MOVE      *BLANKS       KDIT04           20            WDITEM
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KTCO01            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT02           20            ITITEM
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       KSCO01            3            SSCOYNO
     C                   MOVE      *BLANKS       KSWH02            3            SSWHSE
     C                   MOVE      *BLANKS       KSLO03           10            SSLOCN
     C                   MOVE      *BLANKS       KSIT04           20            SSITEM
     C                   MOVE      *BLANKS       SAVIN            99            Save Indord
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        RN0034           30 9
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
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
     C* *** Get the stock request record
     C* GETREC D.company,F.company,*EQ,PRCOYNO
     C*
     C                   EXSR      S001
     C* GETREC D.STOKREQ,F.STOKREQ,*EQ,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S002
     C* IF srtwhse = ' '
     C     WK0019        IFEQ      *BLANKS
     C* SRTWHSE = *hival
     C                   MOVE      *BLANKS       WK0019
     C                   MOVEL     *HIVAL        WK0019
     C* END                                                           *
     C                   END
     C* IF srtlocn = ' '
     C     WK0014        IFEQ      *BLANKS
     C* SRTLOCN = *hival
     C                   MOVE      *BLANKS       WK0014
     C                   MOVEL     *HIVAL        WK0014
     C* END                                                           *
     C                   END
     C* IF srtitem = ' '
     C     WK0013        IFEQ      *BLANKS
     C* SRTITEM = *hival
     C                   MOVE      *BLANKS       WK0013
     C                   MOVEL     *HIVAL        WK0013
     C* END                                                           *
     C                   END
     C* IF srtclas = ' '
     C     WK0012        IFEQ      *BLANKS
     C* SRTCLAS = *hival
     C                   MOVE      *BLANKS       WK0012
     C                   MOVEL     *HIVAL        WK0012
     C* END                                                           *
     C                   END
     C* IF srtsgrp = ' '
     C     WK0016        IFEQ      *BLANKS
     C* SRTSGRP = *hival
     C                   MOVE      *BLANKS       WK0016
     C                   MOVEL     *HIVAL        WK0016
     C* END                                                           *
     C                   END
     C* IF srtsuppn = ' '
     C     WK0018        IFEQ      *BLANKS
     C* SRTSUPPN = *hival
     C                   MOVE      *BLANKS       WK0018
     C                   MOVEL     *HIVAL        WK0018
     C* END                                                           *
     C                   END
     C* IF srtsbrn = ' '
     C     WK0015        IFEQ      *BLANKS
     C* SRTSBRN = *hival
     C                   MOVE      *BLANKS       WK0015
     C                   MOVEL     *HIVAL        WK0015
     C* END                                                           *
     C                   END
     C* *** Find the first Warehouse Detail record
     C* SETLL D.WAREHED,F.WLOCITM,PRCOYNO,SRFWHSE,SRFLOCN,SRFITEM
     C*
     C                   EXSR      S003
     C* *** Read all details until EOF
     C* DOU %STS(D.WAREHED,F.Wlocitm)=*NO
     C     RSLT01        DOUEQ     1
     C* GETREC D.WAREHED,F.Wlocitm,*NE,PrCOYNO
     C*
     C                   EXSR      S004
     C* IF %STS(D.WAREHED,F.Wlocitm)=*YES
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* *** Is check finished
     C* IF WIwhse > srtwhse
     C     WK0028        IFGT      WK0019
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C* IF wiitem >= srfitem & wiitem <= srtitem
     C     WK0026        IFGE      WK0005
     C     WK0026        ANDLE     WK0013
     C* IF wilocn >= srflocn & wilocn <= srtlocn
     C     WK0027        IFGE      WK0006
     C     WK0027        ANDLE     WK0014
     C* GETREC d.warehed,f.waredet,*eq,prcoyno,wiwhse,wiitem
     C*
     C                   EXSR      S006
     C* IF wdsuppn >= srfsuppn & wdsuppn <= srtsuppn
     C     WK0024        IFGE      WK0010
     C     WK0024        ANDLE     WK0018
     C* IF wdsbrn >= srfsbrn & wdsbrn <= srtsbrn
     C     WK0022        IFGE      WK0007
     C     WK0022        ANDLE     WK0015
     C* *** Check record falls within item parameters
     C* GETREC D.ITMMast,F.ITMMAST,*eq,PrCOYNO,WiITEM
     C*
     C                   EXSR      S007
     C* IF itclas >= SRFCLAS & ITCLAS <= srtclas
     C     WTCLAS        IFGE      WK0004
     C     WTCLAS        ANDLE     WK0012
     C* IF itigrp >= SRFsgrp & ITigrp <= srtsgrp
     C     WTIGRP        IFGE      WK0008
     C     WTIGRP        ANDLE     WK0016
     C* *** Check record not already output
     C* GETREC D.STOKSEL1,F.STOKSEL1,*EQ,PRCOYNO,WIWHSE,WILOCN,WIITEM
     C*
     C                   EXSR      S008
     C* IF %STS(D.SToksel1,F.SToksel1)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* *** Print headings on overflow
     C* IF print = ' '|%OVF(LAYOUT1)=*YES
     C     PRINT         IFEQ      *BLANKS
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             RN0034
     C                   ELSE
     C                   Z-ADD     0             RN0034
     C                   END
     C     RN0034        IFEQ      XYES
     C                   Z-ADD     1             RN0034
     C                   ELSE
     C                   Z-ADD     0             RN0034
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0034        OREQ      1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT LAYOUT1,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT LAYOUT1,AH2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT LAYOUT1,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** Print error message
     C* PRINT = 'Y'
     C                   MOVE      'Y'           PRINT
     C* PRINT LAYOUT1,BD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* ELSE                                                          *
     C                   ELSE
     C* ההההה                                                         *
     C*                                                               *
     C* GETREC D.WAREHED,F.WARELOC,*EQ,PRCOYNO,WIWHSE,WILOCN
     C*
     C                   EXSR      S009
     C* NOREC = 'N'
     C                   MOVE      'N'           NOREC
     C* SSCOYNO = prCOYNO
     C                   MOVE      PRM001        WK0020
     C* SSWHSE = WiWHSE
     C                   MOVE      WK0028        WSWHSE
     C* SSLOCN = WiLOCN
     C                   MOVE      WK0027        WSLOCN
     C* SSITEM = WiITEM
     C                   MOVE      WK0026        WSITEM
     C* SSSEQ = SRSEQ
     C                   Z-ADD     WRSEQ         WSSEQ
     C* SSPCKR = WLPCKR
     C                   MOVE      WK0025        WSPCKR
     C* SSQUANT = 0
     C                   Z-ADD     *ZERO         WK0021
     C* *** Write the Stoksel record
     C* WRITE D.SToksel1,F.SToksel1
     C*
     C                   EXSR      S010
     C* הההההה ההההההההההההההההההה
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0034
     C                   ELSE
     C                   Z-ADD     0             RN0034
     C                   END
     C     RN0034        IFEQ      XNO
     C                   Z-ADD     1             RN0034
     C                   ELSE
     C                   Z-ADD     0             RN0034
     C                   END
     C                   Z-ADD     RN0034        RSLT01
     C                   END
     C* Check for no records found
     C                   EXSR      SEND
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEND - END of program.
     C*****************************************************************
     C     SEND          BEGSR
     C*
     C                   EXSR      SPEACT
     C     LRFLAG        IFEQ      'Y'
     C     LRFLAG        OREQ      *BLANK
     C                   MOVE      '1'           *INLR
     C                   END                                                    LRFLAG EQ 'Y'
     C                   RETURN
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SPEACT - Performs all the program end actions.
     C*****************************************************************
     C     SPEACT        BEGSR
     C*
     C* PGMENDACT                                                     *
     C* IF NOREC=' '
     C     NOREC         IFEQ      *BLANKS
     C* IF PRINT=' '
     C     PRINT         IFEQ      *BLANKS
     C* PRINT LAYOUT1,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT LAYOUT1,AH2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT LAYOUT1,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* PRINT LAYOUT1,BD2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Update in use flag
     C* SRBFLAG = 'N'
     C                   MOVE      'N'           WK0002
     C* UPDATE D.STOKREQ,F.STOKREQ
     C*
     C                   EXSR      S011
     C* END                                                           *
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMSG - Error messages to job log.
     C*        calls message handling program to add error
     C*        messages to job log or extract message from message file
     C*****************************************************************
     C     SMSG          BEGSR
     C*
     C                   CALL      'CLMSG'       PMSGCL
     C                   ENDSR
     C/EJECT
     C**************************************************************************
     C* S001   - GETREC D.company,F.company,*EQ,PRCOYNO
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
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
     C* S002   - GETREC D.STOKREQ,F.STOKREQ,*EQ,PRCOYNO,PRSEQ
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   Z-ADD     PRSEQ         KRSE02
     C     K0002         CHAIN     STOKREQ                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.STOKREQ   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - SETLL D.WAREHED,F.WLOCITM,PRCOYNO,SRFWHSE,SRFLOCN,SRFITEM
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HIITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     PRM001        HD0007                         Company number
     C                   MOVEL     PRM001        RN0033                         Company number
     C                   MOVEL     WK0011        KHWH02
     C                   MOVEL     WK0011        HIWHSE                         Warehouse Number
     C                   MOVEL     WK0011        WIWHSE                         Warehouse Number
     C                   MOVEL     WK0006        KLLO03
     C                   MOVEL     WK0006        HILOCN                         Location
     C                   MOVEL     WK0006        WILOCN                         Location
     C                   MOVEL     WK0005        KDIT04
     C                   MOVEL     WK0005        HIITEM                         Item Number
     C                   MOVEL     WK0005        WIITEM                         Item Number
     C*
     C     K0003         SETLL     WLOCITM                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.WAREHED,F.Wlocitm,*NE,PrCOYNO
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C     K0004         READE     WLOCITM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S005                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - Process To Reset File Pointer(EOF) - WLOCITM
     C**************************************************************************
     C     S005          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.WLOCITM
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0033        KHCO01
     C     K0004         SETGT     WLOCITM
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC d.warehed,f.waredet,*eq,prcoyno,wiwhse,wiitem
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0028        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WK0026        KDIT03
     C     K0005         CHAIN     WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.ITMMast,F.ITMMAST,*eq,PrCOYNO,WiITEM
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     *BLANK        KTIT02
     C                   MOVEL     WK0026        KTIT02
     C     K0006         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   ITMC
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.STOKSEL1,F.STOKSEL1,*EQ,PRCOYNO,WIWHSE,WILOCN,WIITEM
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM001        KSCO01
     C                   MOVEL     *BLANK        KSWH02
     C                   MOVEL     WK0028        KSWH02
     C                   MOVEL     *BLANK        KSLO03
     C                   MOVEL     WK0027        KSLO03
     C                   MOVEL     *BLANK        KSIT04
     C                   MOVEL     WK0026        KSIT04
     C     K0007         CHAIN     STOKSEL1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.STOKSEL1
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.STOKSEL1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.WAREHED,F.WARELOC,*EQ,PRCOYNO,WIWHSE,WILOCN
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0028        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     WK0027        KLLO03
     C     K0008         CHAIN     WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - WRITE D.SToksel1,F.SToksel1
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   WRITE     FMT002                               90      ADD REC TO STOKSEL1
     C                   Z-ADD     STS09         STS06                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC09         REC06
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - UPDATE D.STOKREQ,F.STOKREQ
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   Z-ADD     HRC02         REC02
     C     HRC02         CHAIN     STOKREQX                           9091
     C                   Z-ADD     STS08         STS02                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0010        IFEQ      WK0002
     C     RN0011        ANDEQ     WK0003
     C     RN0012        ANDEQ     WK0004
     C     RN0013        ANDEQ     WK0005
     C     RN0014        ANDEQ     WK0006
     C     RN0015        ANDEQ     WK0007
     C     RN0016        ANDEQ     WK0008
     C     RN0017        ANDEQ     WK0009
     C     RN0018        ANDEQ     WK0010
     C     RN0019        ANDEQ     WK0011
     C     SRSEQ         ANDEQ     WRSEQ
     C     RN0020        ANDEQ     WK0012
     C     RN0021        ANDEQ     WK0013
     C     RN0022        ANDEQ     WK0014
     C     RN0023        ANDEQ     WK0015
     C     RN0024        ANDEQ     WK0016
     C     RN0025        ANDEQ     WK0017
     C     RN0026        ANDEQ     WK0018
     C     RN0027        ANDEQ     WK0019
     C                   UNLOCK    STOKREQX                             91      RLS LCK STOKREQX
     C                   ELSE
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    FMT001                               90      UPDATE STOKREQ
     C                   Z-ADD     STS08         STS02                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
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
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    STOKREQX                             91      STOKREQX  FILE0001
     C                   UNLOCK    FILE0001                             91      FILE0001  BSTOKREQO
     C                   READ      STOKREQX                               90
     C                   READ      FILE0001                               90
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
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            STOKREQ
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            WLOCITM
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            WAREDET
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            ITMMAST
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            STOKSEL1
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            WARELOC
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      8                                            STOKREQX
     C     STS08         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS08                          ASSET LOCK STATUS
     C                   ELSE
     C     STS08         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS08                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      9                                            FILE0001
     C     STS09         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS09                          ASSET LOCK STATUS
     C                   ELSE
     C     STS09         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS09                          TRIGGER TO EXEC NEXT
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
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0002        RN0010                         Batch Update flag
     C                   MOVEL     WK0003        RN0011                         Company number
     C                   MOVEL     WK0004        RN0012                         Item Class
     C                   MOVEL     WK0005        RN0013                         Item Number
     C                   MOVEL     WK0006        RN0014                         Location
     C                   MOVEL     WK0007        RN0015                         Branch Number
     C                   MOVEL     WK0008        RN0016                         Stock Group
     C                   MOVEL     WK0009        RN0017                         Stock Inventory Grou
     C                   MOVEL     WK0010        RN0018                         Supplier Number
     C                   MOVEL     WK0011        RN0019                         Warehouse
     C                   Z-ADD     WRSEQ         SRSEQ                          Sequence
     C                   MOVEL     WK0012        RN0020                         Item Class
     C                   MOVEL     WK0013        RN0021                         Item Number
     C                   MOVEL     WK0014        RN0022                         Location
     C                   MOVEL     WK0015        RN0023                         Branch Number
     C                   MOVEL     WK0016        RN0024                         Stock Group
     C                   MOVEL     WK0017        RN0025                         Stock Inventory Grou
     C                   MOVEL     WK0018        RN0026                         Supplier Number
     C                   MOVEL     WK0019        RN0027                         Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - STOKSEL1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     WK0020        RN0028                         Company number
     C                   MOVEL     WSITEM        SSITEM                         Item Number
     C                   MOVEL     WSLOCN        SSLOCN                         Location
     C                   MOVEL     WSPCKR        SSPCKR                         Picking Route
     C                   Z-ADD     WK0021        RN0029                         Quantity counted
     C                   Z-ADD     WSSEQ         SSSEQ                          Sequence
     C                   MOVEL     WSWHSE        SSWHSE                         Warehouse Number
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
     C                   MOVEL     RN0001        WK0001                         Company number
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKREQ
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0010        WK0002                         Batch Update flag
     C                   MOVEL     RN0011        WK0003                         Company number
     C                   MOVEL     RN0012        WK0004                         Item Class
     C                   MOVEL     RN0013        WK0005                         Item Number
     C                   MOVEL     RN0014        WK0006                         Location
     C                   MOVEL     RN0015        WK0007                         Branch Number
     C                   MOVEL     RN0016        WK0008                         Stock Group
     C                   MOVEL     RN0017        WK0009                         Stock Inventory Grou
     C                   MOVEL     RN0018        WK0010                         Supplier Number
     C                   MOVEL     RN0019        WK0011                         Warehouse
     C                   Z-ADD     SRSEQ         WRSEQ                          Sequence
     C                   MOVEL     RN0020        WK0012                         Item Class
     C                   MOVEL     RN0021        WK0013                         Item Number
     C                   MOVEL     RN0022        WK0014                         Location
     C                   MOVEL     RN0023        WK0015                         Branch Number
     C                   MOVEL     RN0024        WK0016                         Stock Group
     C                   MOVEL     RN0025        WK0017                         Stock Inventory Grou
     C                   MOVEL     RN0026        WK0018                         Supplier Number
     C                   MOVEL     RN0027        WK0019                         Warehouse
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0011        HD0003                         Company number
     C                   Z-ADD     SRSEQ         HRSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WIITEM        WK0026                         Item Number
     C                   MOVEL     WILOCN        WK0027                         Location
     C                   MOVEL     WIWHSE        WK0028                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0033        HD0007                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   MOVEL     WIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     WDSBRN        WK0022                         Branch Number
     C                   MOVEL     WDSTOG        WK0023                         Stock Turnover Group
     C                   MOVEL     RN0031        WK0024                         Supplier Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0030        HD0005                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     ITCLAS        WTCLAS                         Item Class
     C                   MOVEL     ITIGRP        WTIGRP                         Stock Group
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0008        HD0002                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKSEL1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0028        WK0020                         Company number
     C                   MOVEL     SSITEM        WSITEM                         Item Number
     C                   MOVEL     SSLOCN        WSLOCN                         Location
     C                   MOVEL     SSPCKR        WSPCKR                         Picking Route
     C                   Z-ADD     RN0029        WK0021                         Quantity counted
     C                   Z-ADD     SSSEQ         WSSEQ                          Sequence
     C                   MOVEL     SSWHSE        WSWHSE                         Warehouse Number
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0028        HD0004                         Company number
     C                   MOVEL     SSWHSE        HSWHSE                         Warehouse Number
     C                   MOVEL     SSLOCN        HSLOCN                         Location
     C                   MOVEL     SSITEM        HSITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     WLPCKR        WK0025                         Picking Route
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0032        HD0006                         Company number
     C                   MOVEL     WLWHSE        HLWHSE                         Warehouse Number
     C                   MOVEL     WLLOCN        HLLOCN                         Location
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
