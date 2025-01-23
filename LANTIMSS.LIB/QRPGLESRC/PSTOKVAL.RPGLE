     F/TITLE PSTOKVAL  Theoretical Stock Valuation
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PSTOKVAL
     F*  Application ID      -    PSTOKVAL
     F*  Application Name    -     Theoretical Stock Valuation
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  WAREDET     - (I/DISK   ) IMS Warehouse Item Details  WD
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  PSTOKVALO   - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     F* S002   - SETLL D.WAREHED,F.WAREDET,PRCOYN,PRFWHS,PRFITM
     F* S003   - GETREC D.WAREHED,F.WAREDET,*NE,PRCOYN
     F* S004   - Process To Reset File Pointer(EOF) - WAREDET
     F* S005   - GETREC D.WAREHED,F.WAREHED,*EQ,PRCOYN,WDWHSE
     F* S006   - GETREC D.WAREHED,F.ITMMAST,*EQ,PRCOYN,WDITEM
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FWAREDET   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FFILE0001  O    E             PRINTER
     F                                     INFDS(FIDS05)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D A1              S             80    DIM(1) CTDATA PERRCD(1)              Alpha constants i
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                367    368B 0
     D  OLN05                188    189B 0
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('99999999999999999999')
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
     IWDETAILF
     I              WDCOYNO                     RN0010
     I              WDSUPPN                     RN0011
     IWAREHEDF
     I              WHCOYNO                     RN0012
     I              WHWDESC                     RN0013
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRCOYN            3
     C                   PARM                    PRFWHS            3
     C                   PARM                    PRTWHS            3
     C                   PARM                    PRFITM           20
     C                   PARM                    PRTITM           20
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
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C*
     C     K0003         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KDIT02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    ITSTUC        WTSTUC                         Standard unit cost
     C     *LIKE         DEFINE    RN0010        WK0002                         Company number
     C     *LIKE         DEFINE    WDLCST        WK0004                         Cost at last receipt
     C     *LIKE         DEFINE    WDQOR         WK0006                         Quantity on reserve
     C     *LIKE         DEFINE    WDUCST        WK0007                         Unit Cost
     C     *LIKE         DEFINE    WHCTYP        WK0010                         Costing Type
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0008        HD0002
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0010        HD0003
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0012        HD0004
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
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
     C                   MOVE      *ZEROS        COST             12 5
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *ZEROS        LVAL             11 2
     C                   MOVE      *BLANKS       SVWHSE            3
     C                   MOVE      *ZEROS        WQNTY             9 0
     C                   MOVE      *ZEROS        WTOT             13 2
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KDIT02           20            WDITEM
     C                   MOVE      *BLANKS       SAVIN            99            Save Indword
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
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
     C*                                                               *
     C* *** Get Company Name.
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     C*
     C                   EXSR      S001
     C*                                                               *
     C* *** Check if 'To' parameters blank.
     C* IF PRTWHS = ' '
     C     PRTWHS        IFEQ      *BLANKS
     C* IF PRFWHS <> ' '
     C     PRFWHS        IFNE      *BLANKS
     C* PRTWHS = PRFWHS
     C                   MOVE      PRFWHS        PRTWHS
     C* ELSE                                                          *
     C                   ELSE
     C* PRTWHS = '999'
     C                   MOVE      '999'         PRTWHS
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check if 'To' parameters blank.
     C* IF PRTITM = ' '
     C     PRTITM        IFEQ      *BLANKS
     C* IF PRFITM <> ' '
     C     PRFITM        IFNE      *BLANKS
     C* PRTITM = PRFITM
     C                   MOVE      PRFITM        PRTITM
     C* ELSE                                                          *
     C                   ELSE
     C* PRTITM = '99999999999999999999'
     C                   MOVE      *BLANKS       PRTITM
     C                   MOVEL     C0001         PRTITM
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Print Headings
     C* PRINT STKVAL,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT STKVAL,AH2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT STKVAL,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* *** Set limits on Warehouse details.
     C* SETLL D.WAREHED,F.WAREDET,PRCOYN,PRFWHS,PRFITM
     C*
     C                   EXSR      S002
     C* GETREC D.WAREHED,F.WAREDET,*NE,PRCOYN
     C*
     C                   EXSR      S003
     C*                                                               *
     C* *** Set Read loop.
     C* DOW %STS(D.WAREHED,F.WAREDET)=*YES
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
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C*                                                               *
     C* *** Check item is in range selected.
     C* IF WDWHSE >= PRFWHS & WDWHSE <= PRTWHS
     C     WK0009        IFGE      PRFWHS
     C     WK0009        ANDLE     PRTWHS
     C* IF WDITEM >= PRFITM & WDITEM <= PRTITM
     C     WK0003        IFGE      PRFITM
     C     WK0003        ANDLE     PRTITM
     C*                                                               *
     C* *** Check for change of warehouse if not 1st cycle.
     C* IF SVWHSE <> ' ' & WDWHSE <> SVWHSE
     C     SVWHSE        IFNE      *BLANKS
     C     WK0009        ANDNE     SVWHSE
     C*                                                               *
     C* *** Output previous warehouse totals.
     C* PRINT STKVAL,TL1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* *** Zeroise warehouse total fields.
     C* WTOT = 0
     C                   Z-ADD     *ZERO         WTOT
     C* WQNTY = 0
     C                   Z-ADD     *ZERO         WQNTY
     C*                                                               *
     C* *** Get new warehouse description & costing type.
     C* GETREC D.WAREHED,F.WAREHED,*EQ,PRCOYN,WDWHSE
     C*
     C                   EXSR      S005
     C*                                                               *
     C* *** Output headings for new warehouse.
     C* PRINT STKVAL,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT STKVAL,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* SVWHSE = WDWHSE
     C                   MOVE      WK0009        SVWHSE
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If First cycle.
     C* IF FIRST = ' '
     C     FIRST         IFEQ      *BLANKS
     C* SVWHSE = WDWHSE
     C                   MOVE      WK0009        SVWHSE
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C*                                                               *
     C* *** Get new warehouse description & costing type.
     C* GETREC D.WAREHED,F.WAREHED,*EQ,PRCOYN,WDWHSE
     C*
     C                   EXSR      S005
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Get Item record.
     C* GETREC D.WAREHED,F.ITMMAST,*EQ,PRCOYN,WDITEM
     C*
     C                   EXSR      S006
     C*                                                               *
     C* *** Set up cost according to whse costing type.
     C* *** Standard unit cost.
     C* *** Default STD Cost
     C* COST = ITSTUC
     C                   Z-ADD     WTSTUC        COST
     C* *** Cost at last receipt.
     C* IF WHCTYP = 2  *and WDLCST <> 0
     C     WK0010        IFEQ      2
     C     WK0004        ANDNE     *ZERO
     C* COST = WDLCST
     C                   Z-ADD     WK0004        COST
     C* END                                                           *
     C                   END
     C* *** Calculated average cost.
     C* IF WHCTYP = 3  *and WDUCST <> 0
     C     WK0010        IFEQ      3
     C     WK0007        ANDNE     *ZERO
     C* COST = WDUCST
     C                   Z-ADD     WK0007        COST
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Calculate & accumulate line value.
     C* WDQOH = WDQOH + WDQOR
     C     WK0005        ADD       WK0006        NRSLT0
     C                   Z-ADD     NRSLT0        WK0005
     C* LVAL = WDQOH * COST
     C     WK0005        MULT      COST          NRSLT0
     C                   Z-ADD     NRSLT0        LVAL
     C*                                                               *
     C* *** Warehouse totals.
     C* WTOT = WTOT + LVAL
     C     WTOT          ADD       LVAL          NRSLT0
     C                   Z-ADD     NRSLT0        WTOT
     C* WQNTY = WQNTY + WDQOH
     C     WQNTY         ADD       WK0005        NRSLT0
     C                   Z-ADD     NRSLT0        WQNTY
     C*                                                               *
     C* *** Check for report overflow.
     C* IF %OVF(STKVAL)=*YES
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
     C* PRINT STKVAL,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT STKVAL,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Output Detail line.
     C* PRINT STKVAL,DD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* GETREC D.WAREHED,F.WAREDET,*NE,PRCOYN
     C*
     C                   EXSR      S003
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
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C*                                                               *
     C* *** Print End of Report narrative
     C* PRINT STKVAL,XXX
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
     C* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRCOYN        KYCO01
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
     C* S002   - SETLL D.WAREHED,F.WAREDET,PRCOYN,PRFWHS,PRFITM
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.WAREDET   WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST   STOV
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     PRCOYN        HD0003                         Company number
     C                   MOVEL     PRCOYN        RN0010                         Company number
     C                   MOVEL     PRFWHS        KHWH02
     C                   MOVEL     PRFWHS        HDWHSE                         Warehouse Number
     C                   MOVEL     PRFWHS        WDWHSE                         Warehouse Number
     C                   MOVEL     PRFITM        KDIT03
     C                   MOVEL     PRFITM        HDITEM                         Item Number
     C                   MOVEL     PRFITM        WDITEM                         Item Number
     C*
     C     K0002         SETLL     WAREDET                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC D.WAREHED,F.WAREDET,*NE,PRCOYN
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C     K0003         READE     WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S004                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - Process To Reset File Pointer(EOF) - WAREDET
     C**************************************************************************
     C     S004          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0010        KHCO01
     C     K0003         SETGT     WAREDET
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.WAREHED,F.WAREHED,*EQ,PRCOYN,WDWHSE
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0009        KHWH02
     C     K0004         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.WAREHED,F.ITMMAST,*EQ,PRCOYN,WDITEM
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     *BLANK        KDIT02
     C                   MOVEL     WK0003        KDIT02
     C     K0005         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST   STOV
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
     C     WFILE#        IFEQ      2                                            WAREDET
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            WAREHED
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            ITMMAST
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
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0010        WK0002                         Company number
     C                   MOVEL     WDITEM        WK0003                         Item Number
     C                   Z-ADD     WDLCST        WK0004                         Cost at last receipt
     C                   Z-ADD     WDQOH         WK0005                         Quantity on hand
     C                   Z-ADD     WDQOR         WK0006                         Quantity on reserve
     C                   Z-ADD     WDUCST        WK0007                         Unit Cost
     C                   MOVEL     WDUOM         WK0008                         Unit of Measure
     C                   MOVEL     WDWHSE        WK0009                         Warehouse Number
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0010        HD0003                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     WHCTYP        WK0010                         Costing Type
     C                   MOVEL     RN0013        WK0011                         Warehouse Descriptio
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0012        HD0004                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0009        WK0001                         Item Description
     C                   Z-ADD     ITSTUC        WTSTUC                         Standard unit cost
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0008        HD0002                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
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
The end of the file was reached
