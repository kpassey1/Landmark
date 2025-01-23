     F/TITLE PSTOKORD Stock Ordered Register
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PSTOKORD
     F*  Application ID      -    PSTOKORD
     F*  Application Name    -    Stock Ordered Register
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  IPSCPYD     - (U/DISK   ) IPS Company Details         CD
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  PORDDL1     - (I/DISK   ) P.O. Detail By Whs/Item/PO/Seq
     F*  PORDH       - (I/DISK   ) Purchase Order header       PH
     F*  PSTOKORDO   - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SY0010 - Format Date
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.IPSCPYD,F.IPSCPYD,*EQ,PRM001
     F* S002   - UPDATE D.IPSCPYD,F.IPSCPYD
     F* S003   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     F* S004   - SETLL D.PORDDL1,F.PORDDL1,PRM001
     F* S005   - GETREC D.PORDDL1,F.PORDDL1,*NE,PRM001
     F* S006   - Process To Reset File Pointer(EOF) - PORDDL1
     F* S007   - GETREC D.PORDH,F.PORDH,*EQ,PRM001,POPORD
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPORDDL1   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FPORDH     IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FFILE0001  O    E             PRINTER
     F                                     INFDS(FIDS05)
     FIPSCPYD   UF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
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
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                367    368B 0
     D  OLN05                188    189B 0
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
     I              CYCOYNO                     RN0008
     I              CYEMPCOL                    RN0009
     I              CYEMPHEAD                   RN0010
     I              CYPRDHEAD                   RN0011
     I              CYREFHEAD                   RN0012
     I              CYSDESC                     RN0013
     IIPSCPYDF
     I              CDAUDAM                     RN0014
     I              CDAUDGR                     RN0015
     I              CDAUDOR                     RN0016
     I              CDAUDPR                     RN0017
     I              CDAUDRE                     RN0018
     I              CDCOYNO                     RN0019
     IPORDDF
     I              POCOYNO                     RN0020
     I              PODLVDT                     RN0021
     I              POIDESC                     RN0022
     I              PONLALL                     RN0023
     I              POPRICE                     RN0024
     I              POQRCVD                     RN0025
     I              POQRCYC                     RN0026
     IPORDHF
     I              PHBRNBR                     RN0027
     I              PHBUYER                     RN0028
     I              PHCMPDT                     RN0029
     I              PHCONNAM                    RN0030
     I              PHCOYNO                     RN0031
     I              PHCUSORD                    RN0032
     I              PHDLVDT                     RN0033
     I              PHENTDT                     RN0034
     I              PHLRCVDT                    RN0035
     I              PHNLALL                     RN0036
     I              PHNOPOS                     RN0037
     I              PHRLAUD                     RN0038
     I              PHSHIPV                     RN0039
     I              PHSLIN1                     RN0040
     I              PHSLIN2                     RN0041
     I              PHSLIN3                     RN0042
     I              PHSLIN4                     RN0043
     I              PHSLIN5                     RN0044
     I              PHSLIN6                     RN0045
     I              PHSNAME                     RN0046
     I              PHSPSTCD                    RN0047
     I              PHSUPPN                     RN0048
     I              PHWLIN1                     RN0049
     I              PHWLIN2                     RN0050
     I              PHWLIN3                     RN0051
     I              PHWLIN4                     RN0052
     I              PHWLIN5                     RN0053
     I              PHWLIN6                     RN0054
     I              PHWNAME                     RN0055
     I              PHWPSTCD                    RN0056
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
     C                   KFLD                    KDCO01
     C*
     C     K0002         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0003         KLIST
     C                   KFLD                    KOCO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0008        WK0001                         Company number
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    RN0019        WK0003                         Company number
     C     *LIKE         DEFINE    POCCDE        WOCCDE                         Conversion Code
     C     *LIKE         DEFINE    POCONV        WOCONV                         Conversion Qty
     C     *LIKE         DEFINE    RN0020        WK0004                         Company number
     C     *LIKE         DEFINE    RN0021        WK0005                         Delivery Date
     C     *LIKE         DEFINE    RN0022        WK0006                         Item Description
     C     *LIKE         DEFINE    POPCDE        WOPCDE                         Pricing code
     C     *LIKE         DEFINE    POPORD        WOPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    RN0025        WK0009                         Quantity received
     C     *LIKE         DEFINE    RN0026        WK0010                         Received this cycle
     C     *LIKE         DEFINE    POSEQ         WOSEQ                          Sequence
     C     *LIKE         DEFINE    POUOM         WOUOM                          Unit of Measure
     C     *LIKE         DEFINE    POWHSE        WOWHSE                         Warehouse Number
     C     *LIKE         DEFINE    RN0031        WK0012                         Company number
     C     *LIKE         DEFINE    PHOS01        WHOS01                         New Order
     C     *LIKE         DEFINE    PHOS09        WHOS09                         special order attent
     C     *LIKE         DEFINE    PHPORD        WHPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    RN0055        WK0014                         Wharehouse Name
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0008        HD0001
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0019        HD0002
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0020        HD0003
     C     *LIKE         DEFINE    POWHSE        HOWHSE
     C     *LIKE         DEFINE    POITEM        HOITEM
     C     *LIKE         DEFINE    POPORD        HOPORD
     C     *LIKE         DEFINE    POSEQ         HOSEQ
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0031        HD0004
     C     *LIKE         DEFINE    PHPORD        HHPORD
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
     C                   MOVE      *BLANKS       RN0001           10            ##DLVDT
     C                   MOVE      *BLANKS       AST               1
     C                   MOVE      *BLANKS       DESC             30
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *ZEROS        LTOT             11 4
     C                   MOVE      *BLANKS       SWHS              3
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0002            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0003            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0004           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0005            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0006            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0007            4            SYMMDDA
     C                   MOVE      *BLANKS       TDSC             30
     C                   MOVE      *ZEROS        TTOT             13 4
     C                   MOVE      *ZEROS        WTOT             13 4
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KDCO01            3            CDCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO01            3            PHCOYNO
     C                   MOVE      *BLANKS       KHPO02           10            PHPORD
     C                   MOVE      *BLANKS       RN0058           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       SAVIN            99            Save Indword
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        RN0057           30 9
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
     C* *** Update Audit Number
     C* GETREC D.IPSCPYD,F.IPSCPYD,*EQ,PRM001
     C*
     C                   EXSR      S001
     C* IF %STS(D.IPSCPYD,F.IPSCPYD)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* CDAUDOR = CDAUDOR + 1
     C     WK0002        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        WK0002
     C* UPDATE D.IPSCPYD,F.IPSCPYD
     C*
     C                   EXSR      S002
     C* END                                                           *
     C                   END
     C* *** Get company name and print headings
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C*
     C                   EXSR      S003
     C* SYDFMT = cydfmt
     C                   MOVE      WYDFMT        RN0005
     C* SYDSEP = cydsep
     C                   MOVE      WYDSEP        RN0006
     C*                                                               *
     C* *** Find the first detail record
     C* FIRST = 'N'
     C                   MOVE      'N'           FIRST
     C* SETLL D.PORDDL1,F.PORDDL1,PRM001
     C*
     C                   EXSR      S004
     C* GETREC D.PORDDL1,F.PORDDL1,*NE,PRM001
     C*
     C                   EXSR      S005
     C* SWHS = POWHSE
     C                   MOVE      WOWHSE        SWHS
     C* GETREC D.PORDH,F.PORDH,*EQ,PRM001,POPORD
     C*
     C                   EXSR      S007
     C*                                                               *
     C* *** Program control loop
     C* DOW %STS(D.PORDDL1,F.PORDDL1) = *YES
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
     C* *** New Order
     C* IF PHOS01='Y'
     C     WHOS01        IFEQ      'Y'
     C*                                                               *
     C* *** Change of warehouse
     C* IF SWHS<>POWHSE
     C     SWHS          IFNE      WOWHSE
     C* PRINT LAYOUT1,WD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT LAYOUT1,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* SWHS = POWHSE
     C                   MOVE      WOWHSE        SWHS
     C* WTOT = *ZEROS
     C                   Z-ADD     *ZEROS        WTOT
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Over flow or first time through
     C* IF %OVF(LAYOUT1)=*YES *OR FIRST = 'N'
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
     C     FIRST         IFEQ      'N'
     C                   Z-ADD     1             RN0057
     C                   ELSE
     C                   Z-ADD     0             RN0057
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0057        OREQ      1
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
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Line Value and totals
     C* LTOT = POQORD * POPRICE
     C     WOQORD        MULT      WK0008        RN0057
     C                   Z-ADD     RN0057        LTOT
     C* WTOT = WTOT + LTOT
     C     WTOT          ADD       LTOT          RN0057
     C                   Z-ADD     RN0057        WTOT
     C* TTOT = TTOT + LTOT
     C     TTOT          ADD       LTOT          RN0057
     C                   Z-ADD     RN0057        TTOT
     C*                                                               *
     C* ** Special attention asterix
     C* IF PHOS09='Y'
     C     WHOS09        IFEQ      'Y'
     C* AST = '*'
     C                   MOVE      '*'           AST
     C* ELSE                                                          *
     C                   ELSE
     C* AST = ' '
     C                   MOVE      *BLANKS       AST
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Detail Line
     C* DESC = POIDESC
     C                   MOVE      *BLANKS       DESC
     C                   MOVEL     WK0006        DESC
     C* *** Format the date
     C* SYDATI = PODLVDT
     C                   Z-ADD     WK0005        RN0003
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0004
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* ##DLVDT = SYDATO
     C                   MOVE      RN0004        RN0001
     C*                                                               *
     C* PRINT LAYOUT1,DD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* GETREC D.PORDDL1,F.PORDDL1,*NE,PRM001
     C*
     C                   EXSR      S005
     C* IF %STS(D.PORDDL1,F.PORDDL1) = *YES
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* GETREC D.PORDH,F.PORDH,*EQ,PRM001,POPORD
     C*
     C                   EXSR      S007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0057
     C                   ELSE
     C                   Z-ADD     0             RN0057
     C                   END
     C     RN0057        IFEQ      XYES
     C                   Z-ADD     1             RN0057
     C                   ELSE
     C                   Z-ADD     0             RN0057
     C                   END
     C                   Z-ADD     RN0057        RSLT01
     C                   END
     C* *** Report totals line
     C* IF FIRST = 'Y'
     C     FIRST         IFEQ      'Y'
     C* PRINT LAYOUT1,WD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT LAYOUT1,ZD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
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
     C                   MOVEL     *BLANKS       RN0004
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0006        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0006
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0003        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0003        SYMMDD
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
     C                   MOVE      *BLANK        RN0002
     C                   MOVEL     SYCCYY        RN0002
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0007
     C                   MOVEL     SYMMDD        RN0007
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
     C     RN0005        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0002:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0005        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0002:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0003        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0004
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0003        RN0003
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0006        RN0006
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0005        RN0005
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
     C* S001   - GETREC D.IPSCPYD,F.IPSCPYD,*EQ,PRM001
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C     K0001         CHAIN(N)  IPSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSCPYD
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - UPDATE D.IPSCPYD,F.IPSCPYD
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     HD0002        KDCO01
     C     K0001         CHAIN     IPSCPYD                            9091      CHAIN  IPSCPYD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0016        IFEQ      WK0002
     C     RN0019        ANDEQ     WK0003
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
     C**************************************************************************
     C* S003   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C**************************************************************************
     C     S003          BEGSR
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
     C* S004   - SETLL D.PORDDL1,F.PORDDL1,PRM001
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDDL1
     C                   MOVEL     *LOVAL        HD0003                         Company number
     C                   MOVEL     *LOVAL        HOWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HOITEM                         Item Number
     C                   MOVEL     *LOVAL        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     PRM001        HD0003                         Company number
     C                   MOVEL     PRM001        RN0020                         Company number
     C*
     C     K0003         SETLL     PORDDL1                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.PORDDL1,F.PORDDL1,*NE,PRM001
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     PRM001        KOCO01
     C     K0003         READE     PORDDL1                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDDL1
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDDL1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S006                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - Process To Reset File Pointer(EOF) - PORDDL1
     C**************************************************************************
     C     S006          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDDL1
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDDL1
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0020        KOCO01
     C     K0003         SETGT     PORDDL1
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.PORDH,F.PORDH,*EQ,PRM001,POPORD
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     WOPORD        KHPO02
     C     K0004         CHAIN     PORDH                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.PORDH
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
     C     WFILE#        IFEQ      1                                            IPSCPYD
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
     C     WFILE#        IFEQ      3                                            PORDDL1
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            PORDH
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
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
     C*          | Move Fields From Work Area To File - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   Z-ADD     WK0002        RN0016                         Ordered Report Audit
     C                   MOVEL     WK0003        RN0019                         Company number
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   Z-ADD     RN0016        WK0002                         Ordered Report Audit
     C                   MOVEL     RN0019        WK0003                         Company number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0019        HD0002                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0008        WK0001                         Company number
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0008        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDDL1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     POCCDE        WOCCDE                         Conversion Code
     C                   Z-ADD     POCONV        WOCONV                         Conversion Qty
     C                   MOVEL     RN0020        WK0004                         Company number
     C                   Z-ADD     RN0021        WK0005                         Delivery Date
     C                   MOVEL     RN0022        WK0006                         Item Description
     C                   MOVEL     POITEM        WOITEM                         Item Number
     C                   MOVEL     RN0023        WK0007                         Allocated account
     C                   MOVEL     POPCDE        WOPCDE                         Pricing code
     C                   MOVEL     POPORD        WOPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0024        WK0008                         Price
     C                   Z-ADD     POQORD        WOQORD                         Quantity ordered
     C                   Z-ADD     RN0025        WK0009                         Quantity received
     C                   Z-ADD     RN0026        WK0010                         Received this cycle
     C                   Z-ADD     POSEQ         WOSEQ                          Sequence
     C                   MOVEL     POUOM         WOUOM                          Unit of Measure
     C                   MOVEL     POWHSE        WOWHSE                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0020        HD0003                         Company number
     C                   MOVEL     POWHSE        HOWHSE                         Warehouse Number
     C                   MOVEL     POITEM        HOITEM                         Item Number
     C                   MOVEL     POPORD        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     POSEQ         HOSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0027        WK0011                         Branch Number
     C                   MOVEL     RN0031        WK0012                         Company number
     C                   MOVEL     PHOS01        WHOS01                         New Order
     C                   MOVEL     PHOS09        WHOS09                         special order attent
     C                   MOVEL     PHPORD        WHPORD                         Purchase Order Numbe
     C                   MOVEL     RN0048        WK0013                         Supplier Account
     C                   MOVEL     PHWHSE        WHWHSE                         Warehouse
     C                   MOVEL     RN0055        WK0014                         Wharehouse Name
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0031        HD0004                         Company number
     C                   MOVEL     PHPORD        HHPORD                         Purchase Order Numbe
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
