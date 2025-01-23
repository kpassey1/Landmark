     F/TITLE IPSPRC Find Price for item
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    IPSPRC
     F*  Application ID      -    IPSPRC
     F*  Application Name    -    Find Price for item
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  IPSITEM     - (I/DISK   ) IPS Supplied Items
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  ITMCLAS     - (I/DISK   ) IMS Item class parameters   IC
     F*  ITMTYP      - (I/DISK   ) IMS Item Type               TP
     F*  STANYS      - (I/DISK   ) IMS Stock analysis codes    SA
     F*  STIGRP      - (I/DISK   ) IMS Stock Inventory group   SI
     F*  STOKGRP     - (I/DISK   ) IMS Stock group codes       SG
     F*  STVGRP      - (I/DISK   ) IMS Stock value group       VG
     F*  UOM         - (I/DISK   ) IMS Unit of measure         UM
     F*  VATCOD      - (I/DISK   ) IMS VAT code
     F*  WAREDET     - (I/DISK   ) Warehouse Item Details      WD
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.IPSITEM,*EQ,PRMCOYNO,PRMSUPP,PRMBRNBR,PRMITEM
     F* S002   - GETREC D.itmmast,*EQ,PRMCOYNO,PRMITEM
     F* S003   - GETREC D.WAREDET,*EQ,PRMCOYNO,PRMWHSE,PRMITEM
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FIPSITEM   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FITMCLAS   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FITMTYP    IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FSTANYS    IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FSTIGRP    IF   E           K DISK
     F                                     RENAME(STIGRP:FMT001)
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FSTOKGRP   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FSTVGRP    IF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FUOM       IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FVATCOD    IF   E           K DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FWAREDET   IF   E           K DISK
     F                                     INFDS(FIDS11)
     F                                     INFSR(SFERR)
     F*
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
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
     IIPSITEMF
     I              PIBRNBR                     RN0002
     I              PICNVCDE                    RN0003
     I              PICOYNO                     RN0004
     I              PIPBRK1                     RN0005
     I              PIPBRK2                     RN0006
     I              PIPBRK3                     RN0007
     I              PIPBRK4                     RN0008
     I              PIPRCOD                     RN0009
     I              PIQBRK1                     RN0010
     I              PIQBRK2                     RN0011
     I              PIQBRK3                     RN0012
     I              PIQBRK4                     RN0013
     I              PISDESC                     RN0014
     I              PISPITM                     RN0015
     I              PISUPPN                     RN0016
     IITMCLASF
     I              ICCOYNO                     RN0017
     IITMSTRF
     I              ITALPHA                     RN0018
     I              ITCOYNO                     RN0019
     I              ITIDESC                     RN0020
     IITMTYPF
     I              BACOYNO                     RN0021
     ISTANYSF
     I              SACOYNO                     RN0022
     IFMT001
     I              SICOYNO                     RN0023
     ISTOKGRPF
     I              SGCOYNO                     RN0024
     I              SGSDESC                     RN0025
     ISTVGRPF
     I              VGCOYNO                     RN0026
     I              VGSVALG                     RN0027
     IUOMF
     I              UMCOYNO                     RN0028
     IVATCODF
     I              VCCOYNO                     RN0029
     IWDETAILF
     I              WDCOYNO                     RN0030
     I              WDSUPPN                     RN0031
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM002            3
     C                   PARM                    PRM004            6
     C                   PARM                    PRM001            3
     C                   PARM                    PRM006            3
     C                   PARM                    PRM003           20
     C                   PARM                    PRMQTY            9 0
     C                   PARM                    PRM005           12 5
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
     C                   KFLD                    KICO01
     C                   KFLD                    KISU02
     C                   KFLD                    KIBR03
     C                   KFLD                    KIIT04
     C*
     C     K0002         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIT02
     C*
     C     K0003         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTCL02
     C*
     C     K0004         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIT03
     C*
     C     K0005         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTSA02
     C*
     C     K0006         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTSI02
     C*
     C     K0007         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIG02
     C*
     C     K0008         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTSV02
     C*
     C     K0009         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTUO02
     C*
     C     K0010         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTVA02
     C*
     C     K0011         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C                   KFLD                    KDIT03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    PICOST        WICOST                         Cost Price
     C     *LIKE         DEFINE    RN0005        WK0001                         Break Price 1
     C     *LIKE         DEFINE    RN0006        WK0002                         Break Price 2
     C     *LIKE         DEFINE    RN0007        WK0003                         Break Price 3
     C     *LIKE         DEFINE    RN0008        WK0004                         Break Price 4
     C     *LIKE         DEFINE    RN0010        WK0005                         Qty Break 1
     C     *LIKE         DEFINE    RN0011        WK0006                         Qty Break 2
     C     *LIKE         DEFINE    RN0012        WK0007                         Qty Break 3
     C     *LIKE         DEFINE    RN0013        WK0008                         Qty break 4
     C     *LIKE         DEFINE    ITSTUC        WTSTUC                         Standard unit cost
     C     *LIKE         DEFINE    WDLCST        WK0009                         Cost at Last Receipt
     C     *LIKE         DEFINE    WDUCST        WK0010                         Unit Cost / Calc / w
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0004        HD0002
     C     *LIKE         DEFINE    RN0016        HD0003
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    PIITEM        HIITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0017        HD0004
     C     *LIKE         DEFINE    ICCLAS        HCCLAS
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0019        HD0005
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0021        HD0006
     C     *LIKE         DEFINE    BAITYP        HAITYP
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0022        HD0007
     C     *LIKE         DEFINE    SASANL        HASANL
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0023        HD0008
     C     *LIKE         DEFINE    SISTIG        HISTIG
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0024        HD0009
     C     *LIKE         DEFINE    SGSGRP        HGSGRP
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0026        HD0010
     C     *LIKE         DEFINE    RN0027        HD0011
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0028        HD0012
     C     *LIKE         DEFINE    UMUOM         HMUOM
     C     *LIKE         DEFINE    REC10         HRC10
     C     *LIKE         DEFINE    RN0029        HD0013
     C     *LIKE         DEFINE    VCVATC        HCVATC
     C     *LIKE         DEFINE    REC11         HRC11
     C     *LIKE         DEFINE    RN0030        HD0014
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
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
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KICO01            3            PICOYNO
     C                   MOVE      *BLANKS       KISU02            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR03            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT04           20            PIITEM
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD08            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD09            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD10            1            RD STS          0030
     C                   MOVE      *BLANKS       KTCO01            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT02           20            ITITEM
     C                   MOVE      *BLANKS       KTCL02            3            ITCLAS
     C                   MOVE      *BLANKS       KTIT03            1            ITITYP
     C                   MOVE      *BLANKS       KTSA02            1            ITSANL
     C                   MOVE      *BLANKS       KTSI02            2            ITSIG
     C                   MOVE      *BLANKS       KTIG02            3            ITIGRP
     C                   MOVE      *BLANKS       KTSV02            1            ITSVG
     C                   MOVE      *BLANKS       KTUO02            5            ITUOM
     C                   MOVE      *BLANKS       KTVA02            2            ITVATC
     C                   MOVE      *BLANKS       SWRD11            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO01            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH02            3            WDWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     1             XYES              1 0          *YES keyword
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
     C* *** Find record on supplier item file
     C* PRMUCST = 0
     C                   Z-ADD     *ZERO         PRM005
     C* GETREC D.IPSITEM,*EQ,PRMCOYNO,PRMSUPP,PRMBRNBR,PRMITEM
     C*
     C                   EXSR      S001
     C* IF %sts(d.ipsitem,f.ipsitem)=*yes
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* IF prmqty >= piqbrk1 & pipbrk1 <> 0
     C     PRMQTY        IFGE      WK0005
     C     WK0001        ANDNE     *ZERO
     C* PRMUCST = pipbrk1
     C                   Z-ADD     WK0001        PRM005
     C* END                                                           *
     C                   END
     C* IF prmqty >= piqbrk2 & pipbrk2 <> 0
     C     PRMQTY        IFGE      WK0006
     C     WK0002        ANDNE     *ZERO
     C* PRMUCST = pipbrk2
     C                   Z-ADD     WK0002        PRM005
     C* END                                                           *
     C                   END
     C* IF prmqty >= piqbrk3 & pipbrk3 <> 0
     C     PRMQTY        IFGE      WK0007
     C     WK0003        ANDNE     *ZERO
     C* PRMUCST = pipbrk3
     C                   Z-ADD     WK0003        PRM005
     C* END                                                           *
     C                   END
     C* IF prmqty >= piqbrk4 & pipbrk4 <> 0
     C     PRMQTY        IFGE      WK0008
     C     WK0004        ANDNE     *ZERO
     C* PRMUCST = pipbrk4
     C                   Z-ADD     WK0004        PRM005
     C* END                                                           *
     C                   END
     C* IF prmucst = 0
     C     PRM005        IFEQ      *ZERO
     C* PRMUCST = picost
     C                   Z-ADD     WICOST        PRM005
     C* END                                                           *
     C                   END
     C* *** record not found on supplier item
     C* END                                                           *
     C                   END
     C* IF prmucst <> 0
     C     PRM005        IFNE      *ZERO
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C* *** Find record on item master file
     C* GETREC D.itmmast,*EQ,PRMCOYNO,PRMITEM
     C*
     C                   EXSR      S002
     C* IF %sts(d.itmmast,f.itmmast)=*yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* PRMUCST = itstuc
     C                   Z-ADD     WTSTUC        PRM005
     C* END                                                           *
     C                   END
     C* IF prmucst <> 0
     C     PRM005        IFNE      *ZERO
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C* *** Find record on warehouse item file
     C* GETREC D.WAREDET,*EQ,PRMCOYNO,PRMWHSE,PRMITEM
     C*
     C                   EXSR      S003
     C* IF %sts(d.waredet,f.waredet)=*yes
     C*  Status of last file I/O
     C     STS11         IFEQ      *ZERO
     C* PRMUCST = wdlcst
     C                   Z-ADD     WK0009        PRM005
     C* END                                                           *
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
     C* S001   - GETREC D.IPSITEM,*EQ,PRMCOYNO,PRMSUPP,PRMBRNBR,PRMITEM
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     PRM002        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     PRM004        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     PRM001        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     PRM003        KIIT04
     C     K0001         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.itmmast,*EQ,PRMCOYNO,PRMITEM
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM002        KTCO01
     C                   MOVEL     *BLANK        KTIT02
     C                   MOVEL     PRM003        KTIT02
     C     K0002         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   ITMC
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTCL02
     C                   MOVEL     ITCLAS        KTCL02
     C     K0003         CHAIN     ITMCLAS                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.ITMCLAS   ITMT
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.ITMCLAS   ITMT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTIT03
     C                   MOVEL     ITITYP        KTIT03
     C     K0004         CHAIN     ITMTYP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMTYP    STAN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMTYP    STAN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTSA02
     C                   MOVEL     ITSANL        KTSA02
     C     K0005         CHAIN     STANYS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.STANYS    STIG
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.STANYS    STIG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTSI02
     C                   MOVEL     ITSIG         KTSI02
     C     K0006         CHAIN     STIGRP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.STIGRP    STOK
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.STIGRP    STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTIG02
     C                   MOVEL     ITIGRP        KTIG02
     C     K0007         CHAIN     STOKGRP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.STOKGRP   STVG
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.STOKGRP   STVG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTSV02
     C                   MOVEL     ITSVG         KTSV02
     C     K0008         CHAIN     STVGRP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.STVGRP    UOM
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.STVGRP    UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTUO02
     C                   MOVEL     ITUOM         KTUO02
     C     K0009         CHAIN     UOM                                9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.UOM       VATC
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.UOM       VATC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTVA02
     C                   MOVEL     ITVATC        KTVA02
     C     K0010         CHAIN     VATCOD                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.VATCOD
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.VATCOD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC D.WAREDET,*EQ,PRMCOYNO,PRMWHSE,PRMITEM
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM002        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     PRM006        KDWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     PRM003        KDIT03
     C     K0011         CHAIN     WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.WAREDET
     C                   Z-ADD     *ZERO         HRC11                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.WAREDET
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            IPSITEM
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            ITMMAST
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            ITMCLAS
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            ITMTYP
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            STANYS
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            STIGRP
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            STOKGRP
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      8                                            STVGRP
     C     STS08         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS08                          ASSET LOCK STATUS
     C                   ELSE
     C     STS08         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS08                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      9                                            UOM
     C     STS09         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS09                          ASSET LOCK STATUS
     C                   ELSE
     C     STS09         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS09                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      10                                           VATCOD
     C     STS10         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS10                          ASSET LOCK STATUS
     C                   ELSE
     C     STS10         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS10                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      11                                           WAREDET
     C     STS11         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS11                          ASSET LOCK STATUS
     C                   ELSE
     C     STS11         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS11                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From File To Work Area - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   Z-ADD     PICOST        WICOST                         Cost Price
     C                   Z-ADD     RN0005        WK0001                         Break Price 1
     C                   Z-ADD     RN0006        WK0002                         Break Price 2
     C                   Z-ADD     RN0007        WK0003                         Break Price 3
     C                   Z-ADD     RN0008        WK0004                         Break Price 4
     C                   Z-ADD     RN0010        WK0005                         Qty Break 1
     C                   Z-ADD     RN0011        WK0006                         Qty Break 2
     C                   Z-ADD     RN0012        WK0007                         Qty Break 3
     C                   Z-ADD     RN0013        WK0008                         Qty break 4
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0004        HD0002                         Company number
     C                   MOVEL     RN0016        HD0003                         Supplier Number
     C                   MOVEL     RN0002        HD0001                         Branch Number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   Z-ADD     ITSTUC        WTSTUC                         Standard unit cost
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0019        HD0005                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMCLAS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0017        HD0004                         Company number
     C                   MOVEL     ICCLAS        HCCLAS                         Item Class
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0021        HD0006                         Company number
     C                   MOVEL     BAITYP        HAITYP                         Item Type - business
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STANYS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0022        HD0007                         Company number
     C                   MOVEL     SASANL        HASANL                         Stock Analysis Code
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STIGRP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0023        HD0008                         Company number
     C                   MOVEL     SISTIG        HISTIG                         Stock Inventory Grou
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKGRP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0024        HD0009                         Company number
     C                   MOVEL     SGSGRP        HGSGRP                         Stock Group
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STVGRP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0026        HD0010                         Company number
     C                   MOVEL     RN0027        HD0011                         Stock Value Group
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - UOM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0028        HD0012                         Company number
     C                   MOVEL     UMUOM         HMUOM                          Unit of Measure
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - VATCOD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   Z-ADD     REC10         HRC10
     C                   MOVEL     RN0029        HD0013                         Company number
     C                   MOVEL     VCVATC        HCVATC                         VAT Code
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   Z-ADD     WDLCST        WK0009                         Cost at Last Receipt
     C                   Z-ADD     WDUCST        WK0010                         Unit Cost / Calc / w
     C                   Z-ADD     REC11         HRC11
     C                   MOVEL     RN0030        HD0014                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
