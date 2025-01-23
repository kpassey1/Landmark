     F/TITLE PRECVR Stock Received Register
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PRECVR
     F*  Application ID      -    PRECVR
     F*  Application Name    -    Stock Received Register
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  IPSCPYD     - (U/DISK   ) IPS Company Details         CD
     F*  GRNHISL1    - (I/DISK   ) G.R.N.History By W/h Item
     F*  WAREDET     - (I/DISK   ) Warehouse Item Details      WD
     F*  PORDH       - (I/DISK   ) Purchase Order header       PH
     F*  FILE0001    - (U/DISK   ) G.R.N.History By W/h Item
     F*  PRECVRO     - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SPBACT - Performs all the program begin actions.
     F* SY0010 - Format Date
     F* SMSG - Error messages to job log.
     F* S001   - SETLL D.GRNHISL1,F.GRNHISL1,PRM001
     F* S002   - GETREC D.GRNHISL1,F.GRNHISL1,*NE,PRM001
     F* S003   - Process To Reset File Pointer(EOF) - GRNHISL1
     F* S004   - GETREC D.WAREDET,F.WAREDET,*EQ,PRM001,GRWHSE,GRITEM
     F* S005   - GETREC D.PORDH,F.PORDH,*EQ,PRM001,grpord
     F* S006   - UPDATE D.GRNHISL1,F.GRNHISL1
     F* S007   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     F* S008   - GETREC D.IPSCPYD,F.IPSCPYD,*LOCK,*EQ,PRM001
     F* S009   - UPDATE d.ipscpyd,f.ipscpyd
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
     FGRNHISL1  IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWAREDET   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FPORDH     IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FPRECVRO   O    E             PRINTER
     F                                     INFDS(FIDS07)
     FIPSCPYD   UF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FFILE0001  UF   E             DISK
     F                                     INFDS(FIDS06)
     F                                     RENAME(GRNHISF:GRNHISFX)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
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
     I              CYCOYNO                     RN0007
     I              CYEMPCOL                    RN0008
     I              CYEMPHEAD                   RN0009
     I              CYPRDHEAD                   RN0010
     I              CYREFHEAD                   RN0011
     I              CYSDESC                     RN0012
     IGRNHISF
     I              GRBRNBR                     RN0013
     I              GRCOYNO                     RN0014
     I              GRDLVDT                     RN0015
     I              GRGRNPR                     RN0016
     I              GRIDESC                     RN0017
     I              GRINVNUM                    RN0018
     I              GRNLALL                     RN0019
     I              GRPRICE                     RN0020
     I              GRQRCYC                     RN0021
     I              GRRCAUD                     RN0022
     I              GRRECBY                     RN0023
     I              GRRECPR                     RN0024
     I              GRSUPPN                     RN0025
     I              GRWNAME                     RN0026
     IIPSCPYDF
     I              CDAUDAM                     RN0027
     I              CDAUDGR                     RN0028
     I              CDAUDOR                     RN0029
     I              CDAUDPR                     RN0030
     I              CDAUDRE                     RN0031
     I              CDCOYNO                     RN0032
     IPORDHF
     I              PHBRNBR                     RN0033
     I              PHBUYER                     RN0034
     I              PHCMPDT                     RN0035
     I              PHCONNAM                    RN0036
     I              PHCOYNO                     RN0037
     I              PHCUSORD                    RN0038
     I              PHDLVDT                     RN0039
     I              PHENTDT                     RN0040
     I              PHLRCVDT                    RN0041
     I              PHNLALL                     RN0042
     I              PHNOPOS                     RN0043
     I              PHRLAUD                     RN0044
     I              PHSHIPV                     RN0045
     I              PHSLIN1                     RN0046
     I              PHSLIN2                     RN0047
     I              PHSLIN3                     RN0048
     I              PHSLIN4                     RN0049
     I              PHSLIN5                     RN0050
     I              PHSLIN6                     RN0051
     I              PHSNAME                     RN0052
     I              PHSPSTCD                    RN0053
     I              PHSUPPN                     RN0054
     I              PHWLIN1                     RN0055
     I              PHWLIN2                     RN0056
     I              PHWLIN3                     RN0057
     I              PHWLIN4                     RN0058
     I              PHWLIN5                     RN0059
     I              PHWLIN6                     RN0060
     I              PHWNAME                     RN0061
     I              PHWPSTCD                    RN0062
     IWDETAILF
     I              WDCOYNO                     RN0063
     I              WDSUPPN                     RN0064
     IGRNHISFX
     I              GRBRNBR                     RN0013
     I              GRCOYNO                     RN0014
     I              GRDLVDT                     RN0015
     I              GRGRNPR                     RN0016
     I              GRIDESC                     RN0017
     I              GRINVNUM                    RN0018
     I              GRNLALL                     RN0019
     I              GRPRICE                     RN0020
     I              GRQRCYC                     RN0021
     I              GRRCAUD                     RN0022
     I              GRRECBY                     RN0023
     I              GRRECPR                     RN0024
     I              GRSUPPN                     RN0025
     I              GRWNAME                     RN0026
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C                   PARM                    XDMY              6 0
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
     C*
     C     K0002         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C                   KFLD                    KDIT03
     C*
     C     K0003         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C*
     C     K0004         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0005         KLIST
     C                   KFLD                    KDCO02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    GRCCDE        WRCCDE                         Conversion Code
     C     *LIKE         DEFINE    GRCONV        WRCONV                         Conversion Qty
     C     *LIKE         DEFINE    RN0014        WK0002                         Company number
     C     *LIKE         DEFINE    RN0015        WK0003                         Delivery Date
     C     *LIKE         DEFINE    RN0016        WK0004                         Grn Printed Y/N
     C     *LIKE         DEFINE    RN0018        WK0006                         Invoice number
     C     *LIKE         DEFINE    RN0019        WK0007                         Allocated account
     C     *LIKE         DEFINE    GRPCDE        WRPCDE                         Pricing code
     C     *LIKE         DEFINE    RN0020        WK0008                         Price
     C     *LIKE         DEFINE    RN0023        WK0011                         Received By
     C     *LIKE         DEFINE    RN0024        WK0012                         Yes no
     C     *LIKE         DEFINE    GRREQ         WRREQ                          Date Requested yymmd
     C     *LIKE         DEFINE    GRUOM         WRUOM                          Unit of Measure
     C     *LIKE         DEFINE    RN0026        WK0014                         Wharehouse name
     C     *LIKE         DEFINE    PHOS09        WHOS09                         special order attent
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0007        HD0001
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0014        HD0002
     C     *LIKE         DEFINE    GRITEM        HRITEM
     C     *LIKE         DEFINE    GRPORD        HRPORD
     C     *LIKE         DEFINE    GRSEQ         HRSEQ
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0032        HD0003
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0037        HD0004
     C     *LIKE         DEFINE    PHPORD        HHPORD
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0063        HD0005
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
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
     C                   MOVE      *BLANKS       DATERC           10
     C                   MOVE      *BLANKS       DATERQ           10
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *BLANKS       LWHSE             3
     C                   MOVE      *BLANKS       SPEC              1
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0001            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0002            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           20
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
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       KRCO01            3            GRCOYNO
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO01            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH02            3            WDWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO01            3            PHCOYNO
     C                   MOVE      *BLANKS       KHPO02           10            PHPORD
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       KDCO02            3            CDCOYNO
     C                   MOVE      *BLANKS       RN0065           99
     C                   MOVE      *BLANKS       ARSLT0          256
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
     C                   EXSR      SPBACT
     C* *** stock received register ***
     C* *** read grn file ***
     C* SETLL D.GRNHISL1,F.GRNHISL1,PRM001
     C*
     C                   EXSR      S001
     C* GETREC D.GRNHISL1,F.GRNHISL1,*NE,PRM001
     C*
     C                   EXSR      S002
     C* *** 1st page ***
     C* PRINT rcvrg,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* DOW %sts(d.grnhisl1,f.grnhisl1)=*yes
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
     C* IF grgrnpr<>'Y'
     C     WK0004        IFNE      'Y'
     C* *** warehouse change print new page
     C* IF lwhse<>GRWHSE & FIRST='Y'
     C     LWHSE         IFNE      WRWHSE
     C     FIRST         ANDEQ     'Y'
     C* PRINT rcvrg,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C* *** get warehouse details ***
     C* GETREC D.WAREDET,F.WAREDET,*EQ,PRM001,GRWHSE,GRITEM
     C*
     C                   EXSR      S004
     C*                                                               *
     C* *** reverse daates
     C* SYDATI = :39
     C                   Z-ADD     WRREQ         RN0002
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* DATERQ = SYDATO
     C                   MOVE      *BLANKS       DATERQ
     C                   MOVEL     RN0003        DATERQ
     C*                                                               *
     C* SYDATI = :15
     C                   Z-ADD     WK0003        RN0002
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* DATERC = SYDATO
     C                   MOVE      *BLANKS       DATERC
     C                   MOVEL     RN0003        DATERC
     C*                                                               *
     C* *** set special order ***
     C* SPEC = ' '
     C                   MOVE      *BLANKS       SPEC
     C* GETREC D.PORDH,F.PORDH,*EQ,PRM001,grpord
     C*
     C                   EXSR      S005
     C* IF PHOS09='Y'
     C     WHOS09        IFEQ      'Y'
     C* SPEC = '@'
     C                   MOVE      '@'           SPEC
     C* END                                                           *
     C                   END
     C* *** check overflow ***
     C* IF %ovf(rcvrg)=*yes
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
     C     NRSLT0        IFEQ      1
     C* PRINT rcvrg,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** print details
     C* PRINT rcvrg,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* *** update printed records ***
     C* GRGRNPR = 'Y'
     C                   MOVE      'Y'           WK0004
     C* UPDATE D.GRNHISL1,F.GRNHISL1
     C*
     C                   EXSR      S006
     C* END                                                           *
     C                   END
     C* *** load next whse
     C* LWHSE = grwhse
     C                   MOVE      WRWHSE        LWHSE
     C* GETREC D.GRNHISL1,F.GRNHISL1,*NE,PRM001
     C*
     C                   EXSR      S002
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
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* *** end of report
     C* PRINT rcvrg,ccc
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
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
     C* SPBACT - Performs all the program begin actions.
     C*****************************************************************
     C     SPBACT        BEGSR
     C*
     C* PGMBEGACT                                                     *
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C*
     C                   EXSR      S007
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0004
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0005
     C* *** get audit number for report ***
     C* GETREC D.IPSCPYD,F.IPSCPYD,*LOCK,*EQ,PRM001
     C*
     C                   EXSR      S008
     C* CDAUDRE = cdaudre+1
     C     WK0015        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        WK0015
     C* UPDATE d.ipscpyd,f.ipscpyd
     C*
     C                   EXSR      S009
     C* END                                                           *
     C                   ENDSR
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
     C* S001   - SETLL D.GRNHISL1,F.GRNHISL1,PRM001
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.GRNHISL1
     C                   MOVEL     *LOVAL        HD0002                         Company number
     C                   MOVEL     *LOVAL        HRITEM                         Item Number
     C                   MOVEL     *LOVAL        HRPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HRSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KRCO01
     C                   MOVEL     PRM001        HD0002                         Company number
     C                   MOVEL     PRM001        RN0014                         Company number
     C*
     C     K0001         SETLL     GRNHISL1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.GRNHISL1,F.GRNHISL1,*NE,PRM001
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C     K0001         READE     GRNHISL1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.GRNHISL1
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.GRNHISL1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - GRNHISL1
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.GRNHISL1
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.GRNHISL1
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0014        KRCO01
     C     K0001         SETGT     GRNHISL1
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.WAREDET,F.WAREDET,*EQ,PRM001,GRWHSE,GRITEM
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WRWHSE        KDWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WRITEM        KDIT03
     C     K0002         CHAIN     WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREDET
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.PORDH,F.PORDH,*EQ,PRM001,grpord
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     WRPORD        KHPO02
     C     K0003         CHAIN     PORDH                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - UPDATE D.GRNHISL1,F.GRNHISL1
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   Z-ADD     HRC03         REC03
     C     HRC03         CHAIN     FILE0001                           9091
     C                   Z-ADD     STS06         STS03                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0013        IFEQ      WK0001
     C     GRCCDE        ANDEQ     WRCCDE
     C     GRCONV        ANDEQ     WRCONV
     C     RN0014        ANDEQ     WK0002
     C     RN0015        ANDEQ     WK0003
     C     RN0016        ANDEQ     WK0004
     C     RN0017        ANDEQ     WK0005
     C     RN0018        ANDEQ     WK0006
     C     GRITEM        ANDEQ     WRITEM
     C     RN0019        ANDEQ     WK0007
     C     GRPCDE        ANDEQ     WRPCDE
     C     GRPORD        ANDEQ     WRPORD
     C     RN0020        ANDEQ     WK0008
     C     GRQORD        ANDEQ     WRQORD
     C     RN0021        ANDEQ     WK0009
     C     RN0022        ANDEQ     WK0010
     C     RN0023        ANDEQ     WK0011
     C     RN0024        ANDEQ     WK0012
     C     GRREQ         ANDEQ     WRREQ
     C     GRSEQ         ANDEQ     WRSEQ
     C     RN0025        ANDEQ     WK0013
     C     GRUOM         ANDEQ     WRUOM
     C     GRWHSE        ANDEQ     WRWHSE
     C     RN0026        ANDEQ     WK0014
     C                   UNLOCK    FILE0001                             91      RLS LCK FILE0001
     C                   ELSE
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    GRNHISFX                             90      UPDATE GRNHISL1
     C                   Z-ADD     STS06         STS03                          SYNC STATUS
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
     C**************************************************************************
     C* S007   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0004         CHAIN     COMPANY                            9091
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
     C* S008   - GETREC D.IPSCPYD,F.IPSCPYD,*LOCK,*EQ,PRM001
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02
     C                   MOVEL     PRM001        KDCO02
     C     K0005         CHAIN     IPSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD02                         RD.SW.IPSCPYD
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.IPSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - UPDATE d.ipscpyd,f.ipscpyd
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     HD0003        KDCO02
     C     K0005         CHAIN     IPSCPYD                            9091      CHAIN  IPSCPYD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0031        IFEQ      WK0015
     C                   UNLOCK    IPSCPYD                              91      RLS LCK IPSCPYD
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    IPSCPYDF                             90      UPDATE IPSCPYD
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
     C                   UNLOCK    FILE0001                             91      FILE0001  PRECVRO
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
     C     WFILE#        IFEQ      2                                            IPSCPYD
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            GRNHISL1
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
     C     WFILE#        IFEQ      5                                            PORDH
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            FILE0001
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
     C* SMVTOF - Move Fields From Work Area To File(s)
     C*****************************************************************
     C     SMVTOF        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   Z-ADD     WK0015        RN0031                         Reconciliation Audit
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - GRNHISL1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WK0001        RN0013                         Branch Number
     C                   MOVEL     WRCCDE        GRCCDE                         Conversion Code
     C                   Z-ADD     WRCONV        GRCONV                         Conversion Qty
     C                   MOVEL     WK0002        RN0014                         Company number
     C                   Z-ADD     WK0003        RN0015                         Delivery Date
     C                   MOVEL     WK0004        RN0016                         Grn Printed Y/N
     C                   MOVEL     WK0005        RN0017                         Item Description
     C                   MOVEL     WK0006        RN0018                         Invoice number
     C                   MOVEL     WRITEM        GRITEM                         Item Number
     C                   MOVEL     WK0007        RN0019                         Allocated account
     C                   MOVEL     WRPCDE        GRPCDE                         Pricing code
     C                   MOVEL     WRPORD        GRPORD                         Purchase Order Numbe
     C                   Z-ADD     WK0008        RN0020                         Price
     C                   Z-ADD     WRQORD        GRQORD                         Quantity Ordered
     C                   Z-ADD     WK0009        RN0021                         Received this cycle
     C                   Z-ADD     WK0010        RN0022                         Goods Received Note
     C                   MOVEL     WK0011        RN0023                         Received By
     C                   MOVEL     WK0012        RN0024                         Yes no
     C                   Z-ADD     WRREQ         GRREQ                          Date Requested yymmd
     C                   Z-ADD     WRSEQ         GRSEQ                          Sequence
     C                   MOVEL     WK0013        RN0025                         Supplier Number
     C                   MOVEL     WRUOM         GRUOM                          Unit of Measure
     C                   MOVEL     WRWHSE        GRWHSE                         Warehouse Number
     C                   MOVEL     WK0014        RN0026                         Wharehouse name
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
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0007        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   Z-ADD     RN0031        WK0015                         Reconciliation Audit
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0032        HD0003                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - GRNHISL1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0013        WK0001                         Branch Number
     C                   MOVEL     GRCCDE        WRCCDE                         Conversion Code
     C                   Z-ADD     GRCONV        WRCONV                         Conversion Qty
     C                   MOVEL     RN0014        WK0002                         Company number
     C                   Z-ADD     RN0015        WK0003                         Delivery Date
     C                   MOVEL     RN0016        WK0004                         Grn Printed Y/N
     C                   MOVEL     RN0017        WK0005                         Item Description
     C                   MOVEL     RN0018        WK0006                         Invoice number
     C                   MOVEL     GRITEM        WRITEM                         Item Number
     C                   MOVEL     RN0019        WK0007                         Allocated account
     C                   MOVEL     GRPCDE        WRPCDE                         Pricing code
     C                   MOVEL     GRPORD        WRPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0020        WK0008                         Price
     C                   Z-ADD     GRQORD        WRQORD                         Quantity Ordered
     C                   Z-ADD     RN0021        WK0009                         Received this cycle
     C                   Z-ADD     RN0022        WK0010                         Goods Received Note
     C                   MOVEL     RN0023        WK0011                         Received By
     C                   MOVEL     RN0024        WK0012                         Yes no
     C                   Z-ADD     GRREQ         WRREQ                          Date Requested yymmd
     C                   Z-ADD     GRSEQ         WRSEQ                          Sequence
     C                   MOVEL     RN0025        WK0013                         Supplier Number
     C                   MOVEL     GRUOM         WRUOM                          Unit of Measure
     C                   MOVEL     GRWHSE        WRWHSE                         Warehouse Number
     C                   MOVEL     RN0026        WK0014                         Wharehouse name
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0014        HD0002                         Company number
     C                   MOVEL     GRITEM        HRITEM                         Item Number
     C                   MOVEL     GRPORD        HRPORD                         Purchase Order Numbe
     C                   Z-ADD     GRSEQ         HRSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     WDQOH         WK0016                         Quantity On Hand
     C                   Z-ADD     WDQOO         WK0017                         Quantity On Order
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0063        HD0005                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     PHOS09        WHOS09                         special order attent
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0037        HD0004                         Company number
     C                   MOVEL     PHPORD        HHPORD                         Purchase Order Numbe
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
