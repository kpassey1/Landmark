     F/TITLE PSTOKVAR   Stock Take Variance Report
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PSTOKVAR
     F*  Application ID      -    PSTOKVAR
     F*  Application Name    -      Stock Take Variance Report
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  STOKREQ     - (I/DISK   ) IMS Stock take request      SR
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  STOKSEL     - (I/DISK   ) IMS Stocktake items rqustd  SS
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WLOCITM     - (I/DISK   ) IMS Warehouse Location Item WI
     F*  PSTOKVARO   - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.STOKREQ,F.STOKREQ,*EQ,PRcoyno,prseq
     F* S002   - GETREC D.COMPANY,F.COMPANY,*EQ,PRcoyno
     F* S003   - SETLL D.STokreq,F.SToksel,PRcoyno,prseq
     F* S004   - GETREC D.STokreq,F.SToksel,*NE,PRcoyno,prseq
     F* S005   - Process To Reset File Pointer(EOF) - STOKSEL
     F* S006   - GETREC d.warehed,f.warehed,*eq,prcoyno,sswhse
     F* S007   - GETREC D.stokreq,F.ITMMAST,*EQ,PRcoyno,SSITEM
     F* S008   - GETREC D.WAREHED,F.WLOCITM,*EQ,PRCOYNO,SSWHSE,SSLOCN,SSITEM
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FSTOKREQ   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FCOMPANY   IF   E           K DISK
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
     FWLOCITM   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FFILE0001  O    E             PRINTER
     F                                     INFDS(FIDS07)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
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
     I              CYCOYNO                     RN0002
     I              CYEMPCOL                    RN0003
     I              CYEMPHEAD                   RN0004
     I              CYPRDHEAD                   RN0005
     I              CYREFHEAD                   RN0006
     I              CYSDESC                     RN0007
     IITMSTRF
     I              ITALPHA                     RN0008
     I              ITCOYNO                     RN0009
     I              ITIDESC                     RN0010
     ISTOKREQF
     I              SRBFLAG                     RN0011
     I              SRCOYNO                     RN0012
     I              SRFCLAS                     RN0013
     I              SRFITEM                     RN0014
     I              SRFLOCN                     RN0015
     I              SRFSBRN                     RN0016
     I              SRFSGRP                     RN0017
     I              SRFSTIG                     RN0018
     I              SRFSUPPN                    RN0019
     I              SRFWHSE                     RN0020
     I              SRTCLAS                     RN0021
     I              SRTITEM                     RN0022
     I              SRTLOCN                     RN0023
     I              SRTSBRN                     RN0024
     I              SRTSGRP                     RN0025
     I              SRTSTIG                     RN0026
     I              SRTSUPPN                    RN0027
     I              SRTWHSE                     RN0028
     ISTOKSELF
     I              SSCOYNO                     RN0029
     I              SSQUANT                     RN0030
     IWAREHEDF
     I              WHCOYNO                     RN0031
     I              WHWDESC                     RN0032
     IWLOCITMF
     I              WICOYNO                     RN0033
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
     C                   KFLD                    KRCO01
     C                   KFLD                    KRSE02
     C*
     C     K0002         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0003         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0004         KLIST
     C                   KFLD                    KRCO01
     C                   KFLD                    KRFI02
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KLLO03
     C                   KFLD                    KDIT04
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0010        WK0001                         Item Description
     C     *LIKE         DEFINE    WHCTYP        WK0019                         Costing Type
     C     *LIKE         DEFINE    WIQOR         WK0022                         Quantity on reserve
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0009        HD0002
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0012        HD0003
     C     *LIKE         DEFINE    SRSEQ         HRSEQ
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0029        HD0004
     C     *LIKE         DEFINE    SSSEQ         HSSEQ
     C     *LIKE         DEFINE    SSWHSE        HSWHSE
     C     *LIKE         DEFINE    SSPCKR        HSPCKR
     C     *LIKE         DEFINE    SSLOCN        HSLOCN
     C     *LIKE         DEFINE    SSITEM        HSITEM
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0031        HD0005
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0033        HD0006
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
     C                   MOVE      *BLANKS       HLWHSE            3
     C                   MOVE      *BLANKS       IDESC            20
     C                   MOVE      *ZEROS        LSHTOT           11 2
     C                   MOVE      *ZEROS        LSUTOT           11 2
     C                   MOVE      *ZEROS        RN0001           11 2          Shortage Value
     C                   MOVE      *ZEROS        SHTOT            11 2
     C                   MOVE      *ZEROS        SURVAL           11 2
     C                   MOVE      *ZEROS        SUTOT            11 2
     C                   MOVE      *ZEROS        VARIAN            9 0
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        WDLCST           12 5          Cost at last receipt
     C                   MOVE      *ZEROS        WDQOH             9 0          Quantity on hand
     C                   MOVE      *ZEROS        WDQOR             9 0          Quantity on reserve
     C                   MOVE      *ZEROS        WDUCST           12 5          Unit Cost
     C                   MOVE      *BLANKS       WDWHSE            3            Warehouse Number
     C                   MOVE      *BLANKS       WLDESC           40            Location Description
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       SWRD04            1            RD STS
     C                   MOVE      *BLANKS       KRCO01            3            SRCOYNO
     C                   MOVE      *ZEROS        KRSE02            5 0          SRSEQ
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          0030
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KRFI02           20            SRFITEM
     C                   MOVE      *BLANKS       KLLO03           10            WLLOCN
     C                   MOVE      *BLANKS       KDIT04           20            WDITEM
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
     C                   Z-ADD     *ZEROS        RN0034           30 9
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
     C*                                                               *
     C* *** Stock Request Record
     C* GETREC D.STOKREQ,F.STOKREQ,*EQ,PRcoyno,prseq
     C*
     C                   EXSR      S001
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRcoyno
     C*
     C                   EXSR      S002
     C*                                                               *
     C*                                                               *
     C* SETLL D.STokreq,F.SToksel,PRcoyno,prseq
     C*
     C                   EXSR      S003
     C* GETREC D.STokreq,F.SToksel,*NE,PRcoyno,prseq
     C*
     C                   EXSR      S004
     C* HLWHSE = sswhse
     C                   MOVE      WSWHSE        HLWHSE
     C* GETREC d.warehed,f.warehed,*eq,prcoyno,sswhse
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
     C* *** Read all stock select items for the
     C* *** Stock Request serial number.
     C* DOW %STS(D.STokreq,F.SToksel)=*YES
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
     C* *** Get the Item Record
     C* GETREC D.stokreq,F.ITMMAST,*EQ,PRcoyno,SSITEM
     C*
     C                   EXSR      S007
     C* IDESC = ITIDESC
     C                   MOVE      *BLANKS       IDESC
     C                   MOVEL     WK0001        IDESC
     C* *** Location item details
     C* GETREC D.WAREHED,F.WLOCITM,*EQ,PRCOYNO,SSWHSE,SSLOCN,SSITEM
     C*
     C                   EXSR      S008
     C* *** Print Report
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
     C* IF hlwhse <> sswhse
     C     HLWHSE        IFNE      WSWHSE
     C* PRINT layout1,tt1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
     C* SHTOT = 0
     C                   Z-ADD     *ZERO         SHTOT
     C* SUTOT = 0
     C                   Z-ADD     *ZERO         SUTOT
     C* END                                                           *
     C                   END
     C* GETREC d.warehed,f.warehed,*eq,prcoyno,sswhse
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
     C* HLWHSE = sswhse
     C                   MOVE      WSWHSE        HLWHSE
     C* *** Variance
     C* WIQOH = wiqoh + wiqor
     C     WK0021        ADD       WK0022        RN0034
     C                   Z-ADD     RN0034        WK0021
     C* VARIAN = SSQUANT - WIQOH
     C     WK0018        SUB       WK0021        RN0034
     C                   Z-ADD     RN0034        VARIAN
     C* *** Surplus Value
     C* SURVAL = ITSTUC * VARIAN
     C     WTSTUC        MULT      VARIAN        RN0034
     C                   Z-ADD     RN0034        SURVAL
     C* SHRTVAL = 0
     C                   Z-ADD     *ZERO         RN0001
     C* *** Shortage Value
     C* IF VARIAN < 0
     C     VARIAN        IFLT      *ZERO
     C* SHRTVAL = surval
     C                   Z-ADD     SURVAL        RN0001
     C* SURVAL = 0
     C                   Z-ADD     *ZERO         SURVAL
     C* END                                                           *
     C                   END
     C* SUTOT = SUTOT + SURVAL
     C     SUTOT         ADD       SURVAL        RN0034
     C                   Z-ADD     RN0034        SUTOT
     C* SHTOT = SHTOT + SHRTVAL
     C     SHTOT         ADD       RN0001        RN0034
     C                   Z-ADD     RN0034        SHTOT
     C* LSUTOT = LSUTOT + SURVAL
     C     LSUTOT        ADD       SURVAL        RN0034
     C                   Z-ADD     RN0034        LSUTOT
     C* LSHTOT = LSHTOT + SHRTVAL
     C     LSHTOT        ADD       RN0001        RN0034
     C                   Z-ADD     RN0034        LSHTOT
     C* *** Detail Lines
     C* PRINT LAYOUT1,BD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* GETREC D.STokreq,F.SToksel,*NE,PRcoyno,prseq
     C*
     C                   EXSR      S004
     C*                                                               *
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0034
     C                   ELSE
     C                   Z-ADD     0             RN0034
     C                   END
     C     RN0034        IFEQ      XYES
     C                   Z-ADD     1             RN0034
     C                   ELSE
     C                   Z-ADD     0             RN0034
     C                   END
     C                   Z-ADD     RN0034        RSLT01
     C                   END
     C* *** Total Lines
     C* PRINT LAYOUT1,zzz
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
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
     C* S001   - GETREC D.STOKREQ,F.STOKREQ,*EQ,PRcoyno,prseq
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   Z-ADD     PRSEQ         KRSE02
     C     K0001         CHAIN     STOKREQ                            9091
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
     C* S002   - GETREC D.COMPANY,F.COMPANY,*EQ,PRcoyno
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0002         CHAIN     COMPANY                            9091
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
     C* S003   - SETLL D.STokreq,F.SToksel,PRcoyno,prseq
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
     C                   MOVEL     PRM001        RN0029                         Company number
     C                   Z-ADD     PRSEQ         KRSE02
     C                   Z-ADD     PRSEQ         HSSEQ                          Sequence
     C                   Z-ADD     PRSEQ         SSSEQ                          Sequence
     C*
     C     K0001         SETLL     STOKSEL                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.STokreq,F.SToksel,*NE,PRcoyno,prseq
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   Z-ADD     PRSEQ         KRSE02
     C     K0001         READE     STOKSEL                              9190
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
     C                   MOVEL     RN0029        KRCO01
     C                   Z-ADD     SSSEQ         KRSE02                         Sequence
     C     K0001         SETGT     STOKSEL
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC d.warehed,f.warehed,*eq,prcoyno,sswhse
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
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
     C* S007   - GETREC D.stokreq,F.ITMMAST,*EQ,PRcoyno,SSITEM
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
     C* S008   - GETREC D.WAREHED,F.WLOCITM,*EQ,PRCOYNO,SSWHSE,SSLOCN,SSITEM
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     WSLOCN        KLLO03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     WSITEM        KDIT04
     C     K0005         CHAIN     WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WLOCITM
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
     C     WFILE#        IFEQ      1                                            STOKREQ
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
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
     C     WFILE#        IFEQ      6                                            WLOCITM
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
     C*          | Move Fields From File To Work Area - STOKREQ
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0013        WK0002                         From Item Class
     C                   MOVEL     RN0014        WK0003                         From Item Number
     C                   MOVEL     RN0015        WK0004                         From Location
     C                   MOVEL     RN0016        WK0005                         From Branch Number
     C                   MOVEL     RN0017        WK0006                         FromStock Group
     C                   MOVEL     RN0018        WK0007                         From Stock Inventory
     C                   MOVEL     RN0019        WK0008                         From Supplier Number
     C                   MOVEL     RN0020        WK0009                         From Warehouse Numbe
     C                   Z-ADD     SRSEQ         WRSEQ                          Sequence
     C                   MOVEL     RN0021        WK0010                         To Item Class
     C                   MOVEL     RN0022        WK0011                         To Item Number
     C                   MOVEL     RN0023        WK0012                         To Location
     C                   MOVEL     RN0024        WK0013                         To Branch Number
     C                   MOVEL     RN0025        WK0014                         To Stock Group
     C                   MOVEL     RN0026        WK0015                         To Stock Inventory G
     C                   MOVEL     RN0027        WK0016                         To Supplier Number
     C                   MOVEL     RN0028        WK0017                         To Warehouse Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0012        HD0003                         Company number
     C                   Z-ADD     SRSEQ         HRSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0002        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKSEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     SSITEM        WSITEM                         Item Number
     C                   MOVEL     SSLOCN        WSLOCN                         Location
     C                   Z-ADD     RN0030        WK0018                         Quantity counted
     C                   MOVEL     SSWHSE        WSWHSE                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0029        HD0004                         Company number
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
     C                   Z-ADD     WHCTYP        WK0019                         Costing Type
     C                   MOVEL     RN0032        WK0020                         Warehouse Descriptio
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0031        HD0005                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0010        WK0001                         Item Description
     C                   Z-ADD     ITSTUC        WTSTUC                         Standard unit cost
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0009        HD0002                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   Z-ADD     WIQOH         WK0021                         Quantity on hand
     C                   Z-ADD     WIQOR         WK0022                         Quantity on reserve
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0033        HD0006                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   MOVEL     WIITEM        HIITEM                         Item Number
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
