     F/TITLE BCMMVSM M/E Reset Movement Summary
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BCMMVSM
     F*  Application ID      -    BCMMVSM
     F*  Application Name    -    M/E Reset Movement Summary
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  WRITTYP     - (U/DISK   ) IMS Warehouse Item Types    WT
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - SETLL D.WAREHED,F.WRITTYP,PRCOYN
     F* S002   - GETREC D.WAREHED,F.WRITTYP,*NE,PRCOYN
     F* S003   - Process To Reset File Pointer(EOF) - WRITTYP
     F* S004   - UPDATE D.WAREHED,F.WRITTYP
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FWRITTYP   UF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A1              S             80    DIM(3) CTDATA PERRCD(1)              Alpha constants i
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
     IWRITTYPF
     I              WTCOYNO                     RN0001
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRCOYN            3
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
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C                   KFLD                    KTTR04
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0001        WK0001                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0002                         Item Number
     C     *LIKE         DEFINE    WTTRNC        WK0003                         Transaction Type
     C     *LIKE         DEFINE    WTTRPQ        WK0004                         Trans Period Quantit
     C     *LIKE         DEFINE    WTTRPV        WK0005                         Trans Period Value
     C     *LIKE         DEFINE    WTWHSE        WK0006                         Warehouse Number
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    WTWHSE        HTWHSE
     C     *LIKE         DEFINE    WTITEM        HTITEM
     C     *LIKE         DEFINE    WTTRNC        HTTRNC
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
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KTTR04            2            WTTRNC
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
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
     C* *** Start read of Movements Summary file.
     C* SETLL D.WAREHED,F.WRITTYP,PRCOYN
     C*
     C                   EXSR      S001
     C* GETREC D.WAREHED,F.WRITTYP,*NE,PRCOYN
     C*
     C                   EXSR      S002
     C*                                                               *
     C* *** Read all records
     C* DOW %STS(D.WAREHED,F.WRITTYP)=*YES
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
     C*                                                               *
     C* *** Zeroise period to date figures.
     C* WTTRPQ = 0
     C                   Z-ADD     *ZERO         WK0004
     C* WTTRPV = 0
     C                   Z-ADD     *ZERO         WK0005
     C*                                                               *
     C* *** Update summary record.
     C* UPDATE D.WAREHED,F.WRITTYP
     C*
     C                   EXSR      S004
     C*                                                               *
     C* *** Read next summary record.
     C* GETREC D.WAREHED,F.WRITTYP,*NE,PRCOYN
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
     C* S001   - SETLL D.WAREHED,F.WRITTYP,PRCOYN
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRITTYP   WLOC
     C                   MOVEL     *LOVAL        HTTRNC                         Transaction Type
     C*
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     PRCOYN        HD0001                         Company number
     C                   MOVEL     PRCOYN        RN0001                         Company number
     C*
     C     K0001         SETLL     WRITTYP                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.WAREHED,F.WRITTYP,*NE,PRCOYN
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C     K0001         READE(N)  WRITTYP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - WRITTYP
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.WRITTYP   WLOC
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0001        KHCO01
     C     K0001         SETGT     WRITTYP
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - UPDATE D.WAREHED,F.WRITTYP
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0001        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HTWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     HTITEM        KDIT03
     C                   MOVEL     *BLANK        KTTR04                         Transaction Type
     C                   MOVEL     HTTRNC        KTTR04
     C     K0002         CHAIN     WRITTYP                            9091      CHAIN  WRITTYP
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0001        IFEQ      WK0001
     C     WTITEM        ANDEQ     WK0002
     C     WTTRNC        ANDEQ     WK0003
     C     WTTRPQ        ANDEQ     WK0004
     C     WTTRPV        ANDEQ     WK0005
     C     WTWHSE        ANDEQ     WK0006
     C                   UNLOCK    WRITTYP                              91      RLS LCK WRITTYP
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WRITTYPF                             90      UPDATE WRITTYP
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(2)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(3)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            WRITTYP
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0001        RN0001                         Company number
     C                   MOVEL     WK0002        WTITEM                         Item Number
     C                   MOVEL     WK0003        WTTRNC                         Transaction Type
     C                   Z-ADD     WK0004        WTTRPQ                         Trans Period Quantit
     C                   Z-ADD     WK0005        WTTRPV                         Trans Period Value
     C                   MOVEL     WK0006        WTWHSE                         Warehouse Number
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0001        WK0001                         Company number
     C                   MOVEL     WTITEM        WK0002                         Item Number
     C                   MOVEL     WTTRNC        WK0003                         Transaction Type
     C                   Z-ADD     WTTRPQ        WK0004                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        WK0005                         Trans Period Value
     C                   MOVEL     WTWHSE        WK0006                         Warehouse Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   MOVEL     WTWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     WTITEM        HTITEM                         Item Number
     C                   MOVEL     WTTRNC        HTTRNC                         Transaction Type
     C                   END
     C                   ENDSR
     C/EJECT
     C********************************************************************
     C*            C o m p i l e   T i m e   A r r a y
     C*               I n i t i a l i z a t i o n
     C********************************************************************
**   Alpha Constant Array - A1
The end of the file was reached
Record update for file IMS Warehouse Item Types    WT
Unable to update record for file IMS Warehouse Item Types    WT
