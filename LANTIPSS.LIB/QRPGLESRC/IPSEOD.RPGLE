     F/TITLE IPSEOD Purchasing End Of Cycle
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    IPSEOD
     F*  Application ID      -    IPSEOD
     F*  Application Name    -    Purchasing End Of Cycle
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Program Narrative
     F*
     F*  This program 1. clears any fully received orders
     F*               2. resets relevant header flags
     F*               3. resets the received this cycle qty on the detail
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  PORDH       - (U/DISK   ) Purchase Order header       PH
     F*  PORDD       - (U/DISK   ) Purchase Order Header       PO
     F*  IPSTXTH     - (U/DISK   ) Purchase Order Text header  TH
     F*  IPSTXTD     - (U/DISK   ) Purchase Order Detail Text  TD
     F*  GRNHIS      - (I/DISK   ) G.R.N. History              GR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - SETLL D.PORDH,F.PORDH,PRM001
     F* S002   - GETREC D.PORDH,F.PORDH,*LOCK,*NE,PRM001
     F* S003   - Process To Reset File Pointer(EOF) - PORDH
     F* S004   - SETLL d.pordd,f.pordd,prm001,phpord
     F* S005   - GETREC D.PORDD,F.PORDD,*LOCK,*ne,PRM001,PHPORD
     F* S006   - Process To Reset File Pointer(EOF) - PORDD
     F* S007   - DELETE d.pordd,f.pordd
     F* S008   - SETLL d.ipstxth,f.ipstxth,prm001,phpord
     F* S009   - GETREC D.ipstxth,*ne,PRM001,PHPORD
     F* S010   - Process To Reset File Pointer(EOF) - IPSTXTH
     F* S011   - DELETE d.ipstxth,f.ipstxth
     F* S012   - SETLL d.ipstxtd,f.ipstxtd,prm001,phpord
     F* S013   - GETREC D.ipstxtd,*ne,PRM001,PHPORD
     F* S014   - Process To Reset File Pointer(EOF) - IPSTXTD
     F* S015   - DELETE d.ipstxtd,f.ipstxtd
     F* S016   - DELETE d.pordh,f.pordh
     F* S017   - UPDATE d.pordd,f.pordd
     F* S018   - UPDATE d.pordh,f.pordh
     F* S019   - SETLL d.grnhis,f.grnhis,prm001
     F* S020   - GETREC d.grnhis,*ne,prm001
     F* S021   - Process To Reset File Pointer(EOF) - GRNHIS
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FGRNHIS    IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FPORDH     UF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FPORDD     UF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FIPSTXTH   UF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIPSTXTD   UF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     F*
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
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
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     IGRNHISF
     I              GRBRNBR                     RN0001
     I              GRCOYNO                     RN0002
     I              GRDLVDT                     RN0003
     I              GRGRNPR                     RN0004
     I              GRIDESC                     RN0005
     I              GRINVNUM                    RN0006
     I              GRNLALL                     RN0007
     I              GRPRICE                     RN0008
     I              GRQRCYC                     RN0009
     I              GRRCAUD                     RN0010
     I              GRRECBY                     RN0011
     I              GRRECPR                     RN0012
     I              GRSUPPN                     RN0013
     I              GRWNAME                     RN0014
     IIPSTXTDF
     I              TDCOYNO                     RN0015
     I              TDPOSEQ                     RN0016
     IIPSTXTHF
     I              THCOYNO                     RN0017
     IPORDDF
     I              POCOYNO                     RN0018
     I              PODLVDT                     RN0019
     I              POIDESC                     RN0020
     I              PONLALL                     RN0021
     I              POPRICE                     RN0022
     I              POQRCVD                     RN0023
     I              POQRCYC                     RN0024
     IPORDHF
     I              PHBRNBR                     RN0025
     I              PHBUYER                     RN0026
     I              PHCMPDT                     RN0027
     I              PHCONNAM                    RN0028
     I              PHCOYNO                     RN0029
     I              PHCUSORD                    RN0030
     I              PHDLVDT                     RN0031
     I              PHENTDT                     RN0032
     I              PHLRCVDT                    RN0033
     I              PHNLALL                     RN0034
     I              PHNOPOS                     RN0035
     I              PHRLAUD                     RN0036
     I              PHSHIPV                     RN0037
     I              PHSLIN1                     RN0038
     I              PHSLIN2                     RN0039
     I              PHSLIN3                     RN0040
     I              PHSLIN4                     RN0041
     I              PHSLIN5                     RN0042
     I              PHSLIN6                     RN0043
     I              PHSNAME                     RN0044
     I              PHSPSTCD                    RN0045
     I              PHSUPPN                     RN0046
     I              PHWLIN1                     RN0047
     I              PHWLIN2                     RN0048
     I              PHWLIN3                     RN0049
     I              PHWLIN4                     RN0050
     I              PHWLIN5                     RN0051
     I              PHWLIN6                     RN0052
     I              PHWNAME                     RN0053
     I              PHWPSTCD                    RN0054
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
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
     C                   KFLD                    KHCO01
     C*
     C     K0002         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C*
     C     K0003         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C                   KFLD                    KOSE03
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO02
     C                   KFLD                    KHPO03
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO02
     C                   KFLD                    KHPO03
     C                   KFLD                    KHSE04
     C*
     C     K0006         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDPO02
     C*
     C     K0007         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDPO02
     C                   KFLD                    KDPO03
     C                   KFLD                    KDSE04
     C*
     C     K0008         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C*
     C     K0009         KLIST
     C                   KFLD                    KRCO01
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0004        WK0001                         Grn Printed Y/N
     C     *LIKE         DEFINE    RN0012        WK0002                         Yes no
     C     *LIKE         DEFINE    RN0018        WK0003                         Company number
     C     *LIKE         DEFINE    RN0020        WK0004                         Item Description
     C     *LIKE         DEFINE    POPORD        WOPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    POQORD        WOQORD                         Quantity ordered
     C     *LIKE         DEFINE    RN0023        WK0005                         Quantity received
     C     *LIKE         DEFINE    RN0024        WK0006                         Received this cycle
     C     *LIKE         DEFINE    RN0029        WK0007                         Company number
     C     *LIKE         DEFINE    PHOPNL        WHOPNL                         Open Lines on order
     C     *LIKE         DEFINE    PHOS01        WHOS01                         New Order
     C     *LIKE         DEFINE    PHOS02        WHOS02                         Updated Order/Line s
     C     *LIKE         DEFINE    PHOS03        WHOS03                         No action since last
     C     *LIKE         DEFINE    PHOS04        WHOS04                         P.O. Pending
     C     *LIKE         DEFINE    PHOS05        WHOS05                         Some receiving since
     C     *LIKE         DEFINE    PHOS06        WHOS06                         Print P.O.Requested
     C     *LIKE         DEFINE    PHOS07        WHOS07                         Print Receiving List
     C     *LIKE         DEFINE    PHOS08        WHOS08                         Order fully recd
     C     *LIKE         DEFINE    PHOS09        WHOS09                         special order attent
     C     *LIKE         DEFINE    PHOS10        WHOS10                         P.O. has been printe
     C     *LIKE         DEFINE    PHOS11        WHOS11                         P.O. has been adjust
     C     *LIKE         DEFINE    PHPORD        WHPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    RN0010        HD0002
     C     *LIKE         DEFINE    GRPORD        HRPORD
     C     *LIKE         DEFINE    GRSEQ         HRSEQ
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0015        HD0003
     C     *LIKE         DEFINE    TDPORD        HDPORD
     C     *LIKE         DEFINE    RN0016        HD0004
     C     *LIKE         DEFINE    TDSEQ         HDSEQ
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0017        HD0005
     C     *LIKE         DEFINE    THPORD        HHPORD
     C     *LIKE         DEFINE    THSEQ         HHSEQ
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0018        HD0006
     C     *LIKE         DEFINE    POPORD        HOPORD
     C     *LIKE         DEFINE    POSEQ         HOSEQ
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0029        HD0007
     C     *LIKE         DEFINE    PHPORD        HD0008
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
     C                   MOVE      *BLANKS       WKOS08            1
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KHCO01            3            PHCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          0030
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       KOPO02           10            POPORD
     C                   MOVE      *ZEROS        KOSE03            5 0          POSEQ
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO02            3            THCOYNO
     C                   MOVE      *BLANKS       KHPO03           10            THPORD
     C                   MOVE      *ZEROS        KHSE04            5 0          THSEQ
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO01            3            TDCOYNO
     C                   MOVE      *BLANKS       KDPO02           10            TDPORD
     C                   MOVE      *ZEROS        KDPO03            5 0          TDPOSEQ
     C                   MOVE      *ZEROS        KDSE04            5 0          TDSEQ
     C                   MOVE      *BLANKS       KHPO02           10            PHPORD
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          0030
     C                   MOVE      *BLANKS       KRCO01            3            GRCOYNO
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        RSLT02            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
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
     C* *** purchasing end of cycle ***
     C*                                                               *
     C* SETLL D.PORDH,F.PORDH,PRM001
     C*
     C                   EXSR      S001
     C* GETREC D.PORDH,F.PORDH,*LOCK,*NE,PRM001
     C*
     C                   EXSR      S002
     C*                                                               *
     C* DOW %sts(d.pordh,f.pordh)=*yes
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* *** ignore any orders pending printing
     C* *** ignore any new orders this cycle
     C* IF PHOS06<>'Y' | PHOS07<>'Y' | PHOS01<>'Y'
     C     WHOS06        IFNE      'Y'
     C     WHOS07        ORNE      'Y'
     C     WHOS01        ORNE      'Y'
     C*                                                               *
     C* *** ignore pending orders and last order
     C* IF phos04<>'Y'
     C     WHOS04        IFNE      'Y'
     C*                                                               *
     C* *** clear fully received orders ***
     C* IF PhOS08='Y'
     C     WHOS08        IFEQ      'Y'
     C* *** delete detail records
     C* SETLL d.pordd,f.pordd,prm001,phpord
     C*
     C                   EXSR      S004
     C* GETREC D.PORDD,F.PORDD,*LOCK,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S005
     C* DOW %sts(d.pordd,f.pordd)=*yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C     RSLT02        DOWEQ     1
     C* DELETE d.pordd,f.pordd
     C*
     C                   EXSR      S007
     C* GETREC D.PORDD,F.PORDD,*LOCK,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S005
     C* END                                                           *
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C                   END
     C* *** delete txt header info
     C* SETLL d.ipstxth,f.ipstxth,prm001,phpord
     C*
     C                   EXSR      S008
     C* GETREC D.ipstxth,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S009
     C* DOW %sts(d.ipstxth,f.ipstxth)=*yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C     RSLT02        DOWEQ     1
     C* DELETE d.ipstxth,f.ipstxth
     C*
     C                   EXSR      S011
     C* GETREC D.ipstxth,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S009
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C                   END
     C* *** delete text detail records
     C* SETLL d.ipstxtd,f.ipstxtd,prm001,phpord
     C*
     C                   EXSR      S012
     C* GETREC D.ipstxtd,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S013
     C* DOW %sts(d.ipstxth,f.ipstxth)=*yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C     RSLT02        DOWEQ     1
     C* DELETE d.ipstxtd,f.ipstxtd
     C*
     C                   EXSR      S015
     C* GETREC D.ipstxtd,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S013
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C                   END
     C* *** delete header ***
     C* DELETE d.pordh,f.pordh
     C*
     C                   EXSR      S016
     C*                                                               *
     C* END                                                           *
     C                   END
     C* IF phos08<>'Y'
     C     WHOS08        IFNE      'Y'
     C* WKOS08 = 'Y'
     C                   MOVE      'Y'           WKOS08
     C* *** reset detail/header records
     C* SETLL d.pordd,f.pordd,prm001,phpord
     C*
     C                   EXSR      S004
     C* GETREC D.PORDD,F.PORDD,*LOCK,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S005
     C* DOW %sts(d.pordd,f.pordd)=*yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C     RSLT02        DOWEQ     1
     C* *** reset recvd this cycle ***
     C* POQRCYC = 0
     C                   Z-ADD     *ZERO         WK0006
     C* *** Check for outstanding receipts
     C* IF POQORD > POQRCVD
     C     WOQORD        IFGT      WK0005
     C* WKOS08 = 'N'
     C                   MOVE      'N'           WKOS08
     C* END                                                           *
     C                   END
     C*                                                               *
     C* UPDATE d.pordd,f.pordd
     C*
     C                   EXSR      S017
     C* *** next detail ***
     C* GETREC D.PORDD,F.PORDD,*LOCK,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S005
     C* END                                                           *
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C                   END
     C* *** update header ***
     C* PHOS01 = 'N'
     C                   MOVE      'N'           WHOS01
     C* PHOS02 = 'N'
     C                   MOVE      'N'           WHOS02
     C* PHOS03 = 'Y'
     C                   MOVE      'Y'           WHOS03
     C* PHOS05 = 'N'
     C                   MOVE      'N'           WHOS05
     C* *** If all items received re-set header as such
     C* IF WKOS08 = 'Y'
     C     WKOS08        IFEQ      'Y'
     C* PHOS08 = WKOS08
     C                   MOVE      WKOS08        WHOS08
     C* END                                                           *
     C                   END
     C*                                                               *
     C* UPDATE d.pordh,f.pordh
     C*
     C                   EXSR      S018
     C*                                                               *
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** get next header
     C* GETREC D.PORDH,F.PORDH,*LOCK,*NE,PRM001
     C*
     C                   EXSR      S002
     C* END                                                           *
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* *** Set grn printed flag
     C* SETLL d.grnhis,f.grnhis,prm001
     C*
     C                   EXSR      S019
     C* DOU %sts(d.grnhis,f.grnhis)=*no
     C     RSLT01        DOUEQ     1
     C* GETREC d.grnhis,*ne,prm001
     C*
     C                   EXSR      S020
     C* IF %sts(d.grnhis,f.grnhis)=*yes
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* GRGRNPR = 'Y'
     C                   MOVE      'Y'           WK0001
     C* GRRECPR = 'Y'
     C                   MOVE      'Y'           WK0002
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XNO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C                   EXSR      SEND
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
     C                   RETURN
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
     C* S001   - SETLL D.PORDH,F.PORDH,PRM001
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.PORDH
     C                   MOVEL     *LOVAL        HD0007                         Company number
     C                   MOVEL     *LOVAL        HD0008                         Purchase Order Numbe
     C*
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     PRM001        HD0007                         Company number
     C                   MOVEL     PRM001        RN0029                         Company number
     C*
     C     K0001         SETLL     PORDH                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.PORDH,F.PORDH,*LOCK,*NE,PRM001
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C     K0001         READE     PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD01                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - PORDH
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.PORDH
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.PORDH
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0029        KHCO01
     C     K0001         SETGT     PORDH
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - SETLL d.pordd,f.pordd,prm001,phpord
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDD
     C                   MOVEL     *LOVAL        HD0006                         Company number
     C                   MOVEL     *LOVAL        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     PRM001        HD0006                         Company number
     C                   MOVEL     PRM001        RN0018                         Company number
     C                   MOVEL     WHPORD        KOPO02
     C                   MOVEL     WHPORD        HOPORD                         Purchase Order Numbe
     C                   MOVEL     WHPORD        POPORD                         Purchase Order Numbe
     C*
     C     K0002         SETLL     PORDD                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.PORDD,F.PORDD,*LOCK,*ne,PRM001,PHPORD
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     WHPORD        KOPO02
     C     K0002         READE     PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S006                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S006          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDD
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDD
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0018        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0002         SETGT     PORDD
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - DELETE d.pordd,f.pordd
     C**************************************************************************
     C     S007          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS02
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     WK0003        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     WOPORD        KOPO02
     C                   Z-ADD     HOSEQ         KOSE03
     C     K0003         SETLL     PORDD                                        SETLL  PORDD
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - PORDD
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0003         READE     PORDD                                9190    READE  PORDD
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    PORDD                                91      DELETE PORDD
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
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
     C     K0003         SETLL     PORDD                                        RESUME FILE POINTER
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - SETLL d.ipstxth,f.ipstxth,prm001,phpord
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.IPSTXTH
     C                   MOVEL     *LOVAL        HD0005                         Company number
     C                   MOVEL     *LOVAL        HHPORD                         P.O. Number
     C                   Z-ADD     *LOVAL        HHSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KHCO02
     C                   MOVEL     PRM001        HD0005                         Company number
     C                   MOVEL     PRM001        RN0017                         Company number
     C                   MOVEL     WHPORD        KHPO03
     C                   MOVEL     WHPORD        HHPORD                         P.O. Number
     C                   MOVEL     WHPORD        THPORD                         P.O. Number
     C*
     C     K0004         SETLL     IPSTXTH                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.ipstxth,*ne,PRM001,PHPORD
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO02
     C                   MOVEL     PRM001        KHCO02
     C                   MOVEL     *BLANK        KHPO03
     C                   MOVEL     WHPORD        KHPO03
     C     K0004         READE(N)  IPSTXTH                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.IPSTXTH
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.IPSTXTH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S010                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - Process To Reset File Pointer(EOF) - IPSTXTH
     C**************************************************************************
     C     S010          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.IPSTXTH
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.IPSTXTH
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO02                         Company number
     C                   MOVEL     RN0017        KHCO02
     C                   MOVEL     *BLANK        KHPO03                         P.O. Number
     C                   MOVEL     THPORD        KHPO03
     C     K0004         SETGT     IPSTXTH
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - DELETE d.ipstxth,f.ipstxth
     C**************************************************************************
     C     S011          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS03
     C                   MOVEL     *BLANK        KHCO02
     C                   MOVEL     HD0005        KHCO02
     C                   MOVEL     *BLANK        KHPO03
     C                   MOVEL     HHPORD        KHPO03
     C                   Z-ADD     HHSEQ         KHSE04
     C     K0005         SETLL     IPSTXTH                                      SETLL  IPSTXTH
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - IPSTXTH
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0005         READE     IPSTXTH                              9190    READE  IPSTXTH
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    IPSTXTH                              91      DELETE IPSTXTH
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
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
     C     K0005         SETLL     IPSTXTH                                      RESUME FILE POINTER
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - SETLL d.ipstxtd,f.ipstxtd,prm001,phpord
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.IPSTXTD
     C                   MOVEL     *LOVAL        HD0003                         Company number
     C                   MOVEL     *LOVAL        HDPORD                         P.O. Number
     C                   Z-ADD     *LOVAL        HD0004                         Purchase order line
     C                   Z-ADD     *LOVAL        HDSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     PRM001        HD0003                         Company number
     C                   MOVEL     PRM001        RN0015                         Company number
     C                   MOVEL     WHPORD        KDPO02
     C                   MOVEL     WHPORD        HDPORD                         P.O. Number
     C                   MOVEL     WHPORD        TDPORD                         P.O. Number
     C*
     C     K0006         SETLL     IPSTXTD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETREC D.ipstxtd,*ne,PRM001,PHPORD
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDPO02
     C                   MOVEL     WHPORD        KDPO02
     C     K0006         READE(N)  IPSTXTD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IPSTXTD
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IPSTXTD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S014                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - Process To Reset File Pointer(EOF) - IPSTXTD
     C**************************************************************************
     C     S014          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.IPSTXTD
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.IPSTXTD
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0015        KDCO01
     C                   MOVEL     *BLANK        KDPO02                         P.O. Number
     C                   MOVEL     TDPORD        KDPO02
     C     K0006         SETGT     IPSTXTD
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - DELETE d.ipstxtd,f.ipstxtd
     C**************************************************************************
     C     S015          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS04
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     HD0003        KDCO01
     C                   MOVEL     *BLANK        KDPO02
     C                   MOVEL     HDPORD        KDPO02
     C                   Z-ADD     HD0004        KDPO03
     C                   Z-ADD     HDSEQ         KDSE04
     C     K0007         SETLL     IPSTXTD                                      SETLL  IPSTXTD
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - IPSTXTD
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0007         READE     IPSTXTD                              9190    READE  IPSTXTD
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    IPSTXTD                              91      DELETE IPSTXTD
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
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
     C     K0007         SETLL     IPSTXTD                                      RESUME FILE POINTER
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - DELETE d.pordh,f.pordh
     C**************************************************************************
     C     S016          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0007        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     WHPORD        KHPO02
     C     K0008         SETLL     PORDH                                        SETLL  PORDH
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - PORDH
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0008         READE     PORDH                                9190    READE  PORDH
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    PORDH                                91      DELETE PORDH
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
     C     K0008         SETLL     PORDH                                        RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - UPDATE d.pordd,f.pordd
     C**************************************************************************
     C     S017          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     HD0006        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     HOPORD        KOPO02
     C                   Z-ADD     HOSEQ         KOSE03                         Sequence
     C     K0003         CHAIN     PORDD                              9091      CHAIN  PORDD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0018        IFEQ      WK0003
     C     RN0020        ANDEQ     WK0004
     C     POPORD        ANDEQ     WOPORD
     C     POQORD        ANDEQ     WOQORD
     C     RN0023        ANDEQ     WK0005
     C     RN0024        ANDEQ     WK0006
     C                   UNLOCK    PORDD                                91      RLS LCK PORDD
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    PORDDF                               90      UPDATE PORDD
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
     C* S018   - UPDATE d.pordh,f.pordh
     C**************************************************************************
     C     S018          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0007        KHCO01
     C                   MOVEL     *BLANK        KHPO02                         Purchase Order Numbe
     C                   MOVEL     HD0008        KHPO02
     C     K0008         CHAIN     PORDH                              9091      CHAIN  PORDH
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0029        IFEQ      WK0007
     C     PHOPNL        ANDEQ     WHOPNL
     C     PHOS01        ANDEQ     WHOS01
     C     PHOS02        ANDEQ     WHOS02
     C     PHOS03        ANDEQ     WHOS03
     C     PHOS04        ANDEQ     WHOS04
     C     PHOS05        ANDEQ     WHOS05
     C     PHOS06        ANDEQ     WHOS06
     C     PHOS07        ANDEQ     WHOS07
     C     PHOS08        ANDEQ     WHOS08
     C     PHOS09        ANDEQ     WHOS09
     C     PHOS10        ANDEQ     WHOS10
     C     PHOS11        ANDEQ     WHOS11
     C     PHPORD        ANDEQ     WHPORD
     C                   UNLOCK    PORDH                                91      RLS LCK PORDH
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    PORDHF                               90      UPDATE PORDH
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
     C* S019   - SETLL d.grnhis,f.grnhis,prm001
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.GRNHIS
     C                   MOVEL     *LOVAL        HD0001                         Company number
     C                   Z-ADD     *LOVAL        HD0002                         Goods Received Note
     C                   MOVEL     *LOVAL        HRPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HRSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KRCO01
     C                   MOVEL     PRM001        HD0001                         Company number
     C                   MOVEL     PRM001        RN0002                         Company number
     C*
     C     K0009         SETLL     GRNHIS                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - GETREC d.grnhis,*ne,prm001
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C     K0009         READE     GRNHIS                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.GRNHIS
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.GRNHIS
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S021                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - Process To Reset File Pointer(EOF) - GRNHIS
     C**************************************************************************
     C     S021          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.GRNHIS
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.GRNHIS
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0002        KRCO01
     C     K0009         SETGT     GRNHIS
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            PORDH
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            PORDD
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            IPSTXTH
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            IPSTXTD
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            GRNHIS
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0007        RN0029                         Company number
     C                   Z-ADD     WHOPNL        PHOPNL                         Open Lines on order
     C                   MOVEL     WHOS01        PHOS01                         New Order
     C                   MOVEL     WHOS02        PHOS02                         Updated Order/Line s
     C                   MOVEL     WHOS03        PHOS03                         No action since last
     C                   MOVEL     WHOS04        PHOS04                         P.O. Pending
     C                   MOVEL     WHOS05        PHOS05                         Some receiving since
     C                   MOVEL     WHOS06        PHOS06                         Print P.O.Requested
     C                   MOVEL     WHOS07        PHOS07                         Print Receiving List
     C                   MOVEL     WHOS08        PHOS08                         Order fully recd
     C                   MOVEL     WHOS09        PHOS09                         special order attent
     C                   MOVEL     WHOS10        PHOS10                         P.O. has been printe
     C                   MOVEL     WHOS11        PHOS11                         P.O. has been adjust
     C                   MOVEL     WHPORD        PHPORD                         Purchase Order Numbe
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0003        RN0018                         Company number
     C                   MOVEL     WK0004        RN0020                         Item Description
     C                   MOVEL     WOPORD        POPORD                         Purchase Order Numbe
     C                   Z-ADD     WOQORD        POQORD                         Quantity ordered
     C                   Z-ADD     WK0005        RN0023                         Quantity received
     C                   Z-ADD     WK0006        RN0024                         Received this cycle
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0029        WK0007                         Company number
     C                   Z-ADD     PHOPNL        WHOPNL                         Open Lines on order
     C                   MOVEL     PHOS01        WHOS01                         New Order
     C                   MOVEL     PHOS02        WHOS02                         Updated Order/Line s
     C                   MOVEL     PHOS03        WHOS03                         No action since last
     C                   MOVEL     PHOS04        WHOS04                         P.O. Pending
     C                   MOVEL     PHOS05        WHOS05                         Some receiving since
     C                   MOVEL     PHOS06        WHOS06                         Print P.O.Requested
     C                   MOVEL     PHOS07        WHOS07                         Print Receiving List
     C                   MOVEL     PHOS08        WHOS08                         Order fully recd
     C                   MOVEL     PHOS09        WHOS09                         special order attent
     C                   MOVEL     PHOS10        WHOS10                         P.O. has been printe
     C                   MOVEL     PHOS11        WHOS11                         P.O. has been adjust
     C                   MOVEL     PHPORD        WHPORD                         Purchase Order Numbe
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0029        HD0007                         Company number
     C                   MOVEL     PHPORD        HD0008                         Purchase Order Numbe
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0018        WK0003                         Company number
     C                   MOVEL     RN0020        WK0004                         Item Description
     C                   MOVEL     POPORD        WOPORD                         Purchase Order Numbe
     C                   Z-ADD     POQORD        WOQORD                         Quantity ordered
     C                   Z-ADD     RN0023        WK0005                         Quantity received
     C                   Z-ADD     RN0024        WK0006                         Received this cycle
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0018        HD0006                         Company number
     C                   MOVEL     POPORD        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     POSEQ         HOSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0017        HD0005                         Company number
     C                   MOVEL     THPORD        HHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         HHSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0015        HD0003                         Company number
     C                   MOVEL     TDPORD        HDPORD                         P.O. Number
     C                   Z-ADD     RN0016        HD0004                         Purchase order line
     C                   Z-ADD     TDSEQ         HDSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - GRNHIS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0004        WK0001                         Grn Printed Y/N
     C                   MOVEL     RN0012        WK0002                         Yes no
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0002        HD0001                         Company number
     C                   Z-ADD     RN0010        HD0002                         Goods Received Note
     C                   MOVEL     GRPORD        HRPORD                         Purchase Order Numbe
     C                   Z-ADD     GRSEQ         HRSEQ                          Sequence
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
