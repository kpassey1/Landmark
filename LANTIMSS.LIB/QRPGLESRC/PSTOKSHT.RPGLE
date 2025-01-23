     F/TITLE PSTOKSHT     Stock Count Sheets
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PSTOKSHT
     F*  Application ID      -    PSTOKSHT
     F*  Application Name    -        Stock Count Sheets
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  STOKREQ     - (I/DISK   ) IMS Stock take request      SR
     F*  STOKSEL     - (I/DISK   ) IMS Stocktake items rqustd  SS
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  PSTOKSHTO   - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     F* S002   - GETREC D.STOKREQ,F.STOKREQ,*EQ,PRCOYNO,PRSEQ
     F* S003   - SETLL D.STOKREQ,F.STOKSEL,PRCOYNO,PRSEQ
     F* S004   - GETREC D.STOKREQ,F.STOKSEL,*NE,PRCOYNO,PRSEQ
     F* S005   - Process To Reset File Pointer(EOF) - STOKSEL
     F* S006   - GETREC D.STOKREQ,F.WAREHED,*EQ,PRCOYNO,SSWHSE
     F* S007   - GETREC D.STOKREQ,F.ITMMAST,*EQ,PRCOYNO,SSITEM
     F* S008   - GETREC D.STOKREQ,F.WARELOC,*EQ,PRCOYNO,SSWHSE,SSLOCN
     F* SFERR - File Exception Handler
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
     FSTOKSEL   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FFILE0001  O    E             PRINTER
     F                                     INFDS(FIDS07)
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
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                367    368B 0
     D  OLN07                188    189B 0
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
     I              CYCOYNO                     RN0003
     I              CYEMPCOL                    RN0004
     I              CYEMPHEAD                   RN0005
     I              CYPRDHEAD                   RN0006
     I              CYREFHEAD                   RN0007
     I              CYSDESC                     RN0008
     IITMSTRF
     I              ITALPHA                     RN0009
     I              ITCOYNO                     RN0010
     I              ITIDESC                     RN0011
     ISTOKREQF
     I              SRBFLAG                     RN0012
     I              SRCOYNO                     RN0013
     I              SRFCLAS                     RN0014
     I              SRFITEM                     RN0015
     I              SRFLOCN                     RN0016
     I              SRFSBRN                     RN0017
     I              SRFSGRP                     RN0018
     I              SRFSTIG                     RN0019
     I              SRFSUPPN                    RN0020
     I              SRFWHSE                     RN0021
     I              SRTCLAS                     RN0022
     I              SRTITEM                     RN0023
     I              SRTLOCN                     RN0024
     I              SRTSBRN                     RN0025
     I              SRTSGRP                     RN0026
     I              SRTSTIG                     RN0027
     I              SRTSUPPN                    RN0028
     I              SRTWHSE                     RN0029
     ISTOKSELF
     I              SSCOYNO                     RN0030
     I              SSQUANT                     RN0031
     IWAREHEDF
     I              WHCOYNO                     RN0032
     I              WHWDESC                     RN0033
     IWARELOCF
     I              WLCOYNO                     RN0034
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
     C                   KFLD                    KRCO01
     C                   KFLD                    KRFW02
     C*
     C     K0004         KLIST
     C                   KFLD                    KRCO01
     C                   KFLD                    KRFI02
     C*
     C     K0005         KLIST
     C                   KFLD                    KRCO01
     C                   KFLD                    KRFW02
     C                   KFLD                    KRFL03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0003        WK0001                         Company number
     C     *LIKE         DEFINE    RN0011        WK0002                         Item Description
     C     *LIKE         DEFINE    RN0013        WK0003                         Company number
     C     *LIKE         DEFINE    SSPCKR        WSPCKR                         Picking Route
     C     *LIKE         DEFINE    WLDESC        WK0021                         Location Description
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0003        HD0001
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0010        HD0002
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0013        HD0003
     C     *LIKE         DEFINE    SRSEQ         HRSEQ
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0030        HD0004
     C     *LIKE         DEFINE    SSSEQ         HSSEQ
     C     *LIKE         DEFINE    SSWHSE        HSWHSE
     C     *LIKE         DEFINE    SSPCKR        HSPCKR
     C     *LIKE         DEFINE    SSLOCN        HSLOCN
     C     *LIKE         DEFINE    SSITEM        HSITEM
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0032        HD0005
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0034        HD0006
     C     *LIKE         DEFINE    WLWHSE        HD0007
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
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
     C                   MOVE      *BLANKS       RN0001           30            DTIDSEC
     C                   MOVE      *BLANKS       RN0002           30            DTlDSEC
     C                   MOVE      *BLANKS       HLWHSE            3
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *BLANKS       ICDESC           40            Item Class Descripti
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          003
     C                   MOVE      *BLANKS       KRCO01            3            SRCOYNO
     C                   MOVE      *ZEROS        KRSE02            5 0          SRSEQ
     C                   MOVE      *BLANKS       KRFW02            3            SRFWHSE
     C                   MOVE      *BLANKS       KRFI02           20            SRFITEM
     C                   MOVE      *BLANKS       KRFL03           10            SRFLOCN
     C                   MOVE      *BLANKS       SAVIN            99            Save Indword
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        RN0035           30 9
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
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     C*
     C                   EXSR      S001
     C* GETREC D.STOKREQ,F.STOKREQ,*EQ,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S002
     C*                                                               *
     C* SETLL D.STOKREQ,F.STOKSEL,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S003
     C* GETREC D.STOKREQ,F.STOKSEL,*NE,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S004
     C* HLWHSE = sswhse
     C                   MOVE      WSWHSE        HLWHSE
     C* GETREC D.STOKREQ,F.WAREHED,*EQ,PRCOYNO,SSWHSE
     C*
     C                   EXSR      S006
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
     C*                                                               *
     C* DOW %STS(D.STOKREQ,F.STOKSEL)=*YES
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
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C*                                                               *
     C* GETREC D.STOKREQ,F.ITMMAST,*EQ,PRCOYNO,SSITEM
     C*
     C                   EXSR      S007
     C* DTIDSEC = itidesc
     C                   MOVE      *BLANKS       RN0001
     C                   MOVEL     WK0002        RN0001
     C* GETREC D.STOKREQ,F.WARELOC,*EQ,PRCOYNO,SSWHSE,SSLOCN
     C*
     C                   EXSR      S008
     C* DTLDSEC = wldesc
     C                   MOVE      *BLANKS       RN0002
     C                   MOVEL     WK0021        RN0002
     C*                                                               *
     C* IF %OVF(LAYOUT1)=*YES | hlwhse <> sswhse
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     HLWHSE        IFNE      WSWHSE
     C                   Z-ADD     1             RN0035
     C                   ELSE
     C                   Z-ADD     0             RN0035
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0035        OREQ      1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* GETREC D.STOKREQ,F.WAREHED,*EQ,PRCOYNO,SSWHSE
     C*
     C                   EXSR      S006
     C* PRINT LAYOUT1,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT LAYOUT1,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* HLWHSE = sswhse
     C                   MOVE      WSWHSE        HLWHSE
     C*                                                               *
     C* PRINT LAYOUT1,BD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* GETREC D.STOKREQ,F.STOKSEL,*NE,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S004
     C*                                                               *
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0035
     C                   ELSE
     C                   Z-ADD     0             RN0035
     C                   END
     C     RN0035        IFEQ      XYES
     C                   Z-ADD     1             RN0035
     C                   ELSE
     C                   Z-ADD     0             RN0035
     C                   END
     C                   Z-ADD     RN0035        RSLT01
     C                   END
     C*                                                               *
     C* PRINT LAYOUT1,BD2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
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
     C* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
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
     C* S003   - SETLL D.STOKREQ,F.STOKSEL,PRCOYNO,PRSEQ
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   MOVEL     *LOVAL        HSWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HSPCKR                         Picking Route
     C                   MOVEL     *LOVAL        HSLOCN                         Location
     C                   MOVEL     *LOVAL        HSITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KRCO01
     C                   MOVEL     PRM001        HD0004                         Company number
     C                   MOVEL     PRM001        RN0030                         Company number
     C                   Z-ADD     PRSEQ         KRSE02
     C                   Z-ADD     PRSEQ         HSSEQ                          Sequence
     C                   Z-ADD     PRSEQ         SSSEQ                          Sequence
     C*
     C     K0002         SETLL     STOKSEL                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.STOKREQ,F.STOKSEL,*NE,PRCOYNO,PRSEQ
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   Z-ADD     PRSEQ         KRSE02
     C     K0002         READE     STOKSEL                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S005                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - Process To Reset File Pointer(EOF) - STOKSEL
     C**************************************************************************
     C     S005          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.STOKSEL
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKSEL
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0030        KRCO01
     C                   Z-ADD     SSSEQ         KRSE02                         Sequence
     C     K0002         SETGT     STOKSEL
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.STOKREQ,F.WAREHED,*EQ,PRCOYNO,SSWHSE
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   MOVEL     *BLANK        KRFW02
     C                   MOVEL     WSWHSE        KRFW02
     C     K0003         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.STOKREQ,F.ITMMAST,*EQ,PRCOYNO,SSITEM
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   MOVEL     *BLANK        KRFI02
     C                   MOVEL     WSITEM        KRFI02
     C     K0004         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.STOKREQ,F.WARELOC,*EQ,PRCOYNO,SSWHSE,SSLOCN
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   MOVEL     *BLANK        KRFW02
     C                   MOVEL     WSWHSE        KRFW02
     C                   MOVEL     *BLANK        KRFL03
     C                   MOVEL     WSLOCN        KRFL03
     C     K0005         CHAIN     WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WARELOC   STOK
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WARELOC   STOK
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
     C     WFILE#        IFEQ      3                                            STOKSEL
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            WAREHED
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
     C     WFILE#        IFEQ      6                                            WARELOC
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
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
     C                   MOVEL     RN0003        WK0001                         Company number
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0003        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKREQ
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0013        WK0003                         Company number
     C                   MOVEL     RN0014        WK0004                         Item Class
     C                   MOVEL     RN0015        WK0005                         Item Number
     C                   MOVEL     RN0016        WK0006                         Location
     C                   MOVEL     RN0017        WK0007                         Branch Number
     C                   MOVEL     RN0018        WK0008                         Stock Group
     C                   MOVEL     RN0019        WK0009                         Stock Inventory Grou
     C                   MOVEL     RN0020        WK0010                         Supplier Number
     C                   MOVEL     RN0021        WK0011                         Warehouse
     C                   Z-ADD     SRSEQ         WRSEQ                          Sequence
     C                   MOVEL     RN0022        WK0012                         Item Class
     C                   MOVEL     RN0023        WK0013                         Item Number
     C                   MOVEL     RN0024        WK0014                         Location
     C                   MOVEL     RN0025        WK0015                         Branch Number
     C                   MOVEL     RN0026        WK0016                         Stock Group
     C                   MOVEL     RN0027        WK0017                         Stock Inventory Grou
     C                   MOVEL     RN0028        WK0018                         Supplier Number
     C                   MOVEL     RN0029        WK0019                         Warehouse
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0013        HD0003                         Company number
     C                   Z-ADD     SRSEQ         HRSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKSEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     SSITEM        WSITEM                         Item Number
     C                   MOVEL     SSLOCN        WSLOCN                         Location
     C                   MOVEL     SSPCKR        WSPCKR                         Picking Route
     C                   MOVEL     SSWHSE        WSWHSE                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0030        HD0004                         Company number
     C                   Z-ADD     SSSEQ         HSSEQ                          Sequence
     C                   MOVEL     SSWHSE        HSWHSE                         Warehouse Number
     C                   MOVEL     SSPCKR        HSPCKR                         Picking Route
     C                   MOVEL     SSLOCN        HSLOCN                         Location
     C                   MOVEL     SSITEM        HSITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0033        WK0020                         Warehouse Descriptio
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0032        HD0005                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0011        WK0002                         Item Description
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0010        HD0002                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     WLDESC        WK0021                         Location Description
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0034        HD0006                         Company number
     C                   MOVEL     WLWHSE        HD0007                         Warehouse Number
     C                   MOVEL     WLLOCN        HLLOCN                         Location
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
