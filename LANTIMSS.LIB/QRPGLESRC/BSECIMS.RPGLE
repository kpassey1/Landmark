     F/TITLE BSECIMS Check user security
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BSECIMS
     F*  Application ID      -    BSECIMS
     F*  Application Name    -    Check user security
     F*  Date Generated      -    Jan 11, 2020 test8
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  SECIMS      - (I/DISK   ) IMS User Security           US
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,PRUSER
     F* S002   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USUGRP
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FSECIMS    IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     F*
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
     ISECIMSF
     I              USCOYNO                     RN0001
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM002            3
     C                   PARM                    PRUSER           10
     C                   PARM                    PRACTN            1
     C                   PARM                    PRM001            1
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
     C                   KFLD                    KSCO01
     C                   KFLD                    KSUS02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    USADD         WSADD                          Add
     C     *LIKE         DEFINE    USDEL         WSDEL                          Delete
     C     *LIKE         DEFINE    USENQ         WSENQ                          Enquiry
     C     *LIKE         DEFINE    USMAIN        WSMAIN                         Amend
     C     *LIKE         DEFINE    USSTKU        WSSTKU                         Stock take Update
     C     *LIKE         DEFINE    USUGRP        WSUGRP                         Group User
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    USUSER        HSUSER
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
     C                   MOVE      *BLANKS       KSCO01            3            USCOYNO
     C                   MOVE      *BLANKS       KSUS02           10            USUSER
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
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
     C*                                                               *
     C* *** Initialise user allowed option.
     C* PRALWD = 'N'
     C                   MOVE      'N'           PRM001
     C*                                                               *
     C* *** Get user security record.
     C* GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,PRUSER
     C*
     C                   EXSR      S001
     C*                                                               *
     C* *** If record exists continue.
     C* IF %STS(D.SECURTY,F.SECIMS)=*NO
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If group code not blank get group record.
     C* IF USUGRP <> ' '
     C     WSUGRP        IFNE      *BLANKS
     C* GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USUGRP
     C*
     C                   EXSR      S002
     C* IF %STS(D.SECURTY,F.SECIMS)=*NO
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If edit requested check allowed.
     C* IF PRACTN = '2' & USMAIN = 'N'
     C     PRACTN        IFEQ      '2'
     C     WSMAIN        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If delete requested check allowed.
     C* IF PRACTN = '4' & USDEL = 'N'
     C     PRACTN        IFEQ      '4'
     C     WSDEL         ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If enquire requested check allowed.
     C* IF PRACTN = '5' & USENQ = 'N'
     C     PRACTN        IFEQ      '5'
     C     WSENQ         ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If add requested check allowed.
     C* IF PRACTN = '6' & USADD = 'N'
     C     PRACTN        IFEQ      '6'
     C     WSADD         ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If stock update requested check allowed.
     C* IF PRACTN = 'A' & USSTKU = 'N'
     C     PRACTN        IFEQ      'A'
     C     WSSTKU        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* PRALWD = 'Y'
     C                   MOVE      'Y'           PRM001
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
     C* S001   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,PRUSER
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM002        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     PRUSER        KSUS02
     C     K0001         CHAIN     SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USUGRP
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM002        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     WSUGRP        KSUS02
     C     K0001         CHAIN     SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
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
     C     WFILE#        IFEQ      1                                            SECIMS
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
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SECIMS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     USADD         WSADD                          Add
     C                   MOVEL     USDEL         WSDEL                          Delete
     C                   MOVEL     USENQ         WSENQ                          Enquiry
     C                   MOVEL     USMAIN        WSMAIN                         Amend
     C                   MOVEL     USSTKU        WSSTKU                         Stock take Update
     C                   MOVEL     USUGRP        WSUGRP                         Group User
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   MOVEL     USUSER        HSUSER                         User
     C                   END
     C                   ENDSR
