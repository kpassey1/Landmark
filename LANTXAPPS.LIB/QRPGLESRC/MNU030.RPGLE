     F/TITLE MNU030 Copy User Details
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MNU030
     F*  Application ID      -    MNU030
     F*  Application Name    -    Copy User Details
     F*  Date Generated      -    Jan 11, 2012
     F* project-task        -    LM1SQL-38 13/02/2025
     F********************************************************************
     F*  Files Usage
     F*
     F*  MNUUSR      - (U/DISK   ) Menu Users                  MA
     F*  MNUHED      - (U/DISK   ) Menu Heading file           MB
     F*  MNUOPT      - (U/DISK   ) Menu Options                MC
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - SETLL D.MENU,F.MNUUSR,PRTUSR
     F* S002   - WRITE D.MENU,F.MNUUSR
     F* S003   - SETLL D.MENU,F.MNUHED,prfusr
     F* S004   - GETREC D.MENU,F.MNUHED,*NE,prfusr
     F* S005   - Process To Reset File Pointer(EOF) - MNUHED
     F* S006   - WRITE d.menu,f.mnuhed
     F* S007   - GETREC D.MENU,F.MNUHED,*eq,prfusr,wkmnuc
     F* S008   - SETLL D.MENU,F.MNUopt,prfusr
     F* S009   - GETREC D.MENU,F.MNUOPT,*NE,PRFUSR
     F* S010   - Process To Reset File Pointer(EOF) - MNUOPT
     F* S011   - WRITE d.menu,f.mnuopt
     F* S012   - GETREC D.MENU,F.MNUOPt,*eq,prfusr,wkmnuc,wkoptc
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMNUUSR    UF A E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FMNUHED    UF A E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FMNUOPT    UF A E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A1              S             80    DIM(7) CTDATA PERRCD(1)              Alpha constants i
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
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
     IMNUUSRF
     I              MAGUSER                     RN0001
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRFUSR           10
     C                   PARM                    PRCMNU            1
     C                   PARM                    PRCOPT            1
     C                   PARM                    PRTUSR           10
     C                   PARM                    PRREC             1
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
     C                   KFLD                    KAUS01
     C*
     C     K0002         KLIST
     C                   KFLD                    KAGU01
     C*
     C     K0003         KLIST
     C                   KFLD                    KAGU01
     C                   KFLD                    KBMN02
     C*
     C     K0004         KLIST
     C                   KFLD                    KAGU01
     C                   KFLD                    KBMN02
     C                   KFLD                    KCOP03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    MBMNUC        WBMNUC                         Menu
     C     *LIKE         DEFINE    MBMNUD        WBMNUD                         Menu Description
     C     *LIKE         DEFINE    MBSTRT        WBSTRT                         Start Menu
     C     *LIKE         DEFINE    MBUSER        WBUSER                         User
     C     *LIKE         DEFINE    MCACTA        WCACTA                         Add
     C     *LIKE         DEFINE    MCACTD        WCACTD                         Delete
     C     *LIKE         DEFINE    MCACTR        WCACTR                         Revise
     C     *LIKE         DEFINE    MCMNUC        WCMNUC                         Menu
     C     *LIKE         DEFINE    MCOPTC        WCOPTC                         Option
     C     *LIKE         DEFINE    MCOPTD        WCOPTD                         Option Description
     C     *LIKE         DEFINE    MCPGMN        WCPGMN                         Program Name
     C     *LIKE         DEFINE    MCPGMT        WCPGMT                         Program Type
     C     *LIKE         DEFINE    MCPRM1        WCPRM1                         Parameter
     C     *LIKE         DEFINE    MCPRM2        WCPRM2                         Parameter
     C     *LIKE         DEFINE    MCPRM3        WCPRM3                         Parameter
     C     *LIKE         DEFINE    MCPRM4        WCPRM4                         Parameter
     C     *LIKE         DEFINE    MCSPGM        WCSPGM                         Secondary Program Na
     C     *LIKE         DEFINE    MCUSER        WCUSER                         User
     C     *LIKE         DEFINE    MAACTA        WAACTA                         Add
     C     *LIKE         DEFINE    MAACTD        WAACTD                         Delete
     C     *LIKE         DEFINE    MAACTR        WAACTR                         Revise
     C     *LIKE         DEFINE    MACHG         WACHG                          Allow Change of Loca
     C     *LIKE         DEFINE    MADFV1        WADFV1                         Default Value for Le
     C     *LIKE         DEFINE    MADFV2        WADFV2                         Default Value for Le
     C     *LIKE         DEFINE    MADFV3        WADFV3                         Default Value for Le
     C     *LIKE         DEFINE    MAFORN        WAFORN                         Forename
     C     *LIKE         DEFINE    RN0001        WK0001                         Group User
     C     *LIKE         DEFINE    MASURN        WASURN                         Surname
     C     *LIKE         DEFINE    MAUSER        WAUSER                         User
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    MBUSER        HBUSER
     C     *LIKE         DEFINE    MBMNUC        HBMNUC
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    MCUSER        HCUSER
     C     *LIKE         DEFINE    MCMNUC        HCMNUC
     C     *LIKE         DEFINE    MCOPTC        HCOPTC
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    MAUSER        HAUSER
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
     C                   MOVE      *BLANKS       WKMNUC            5
     C                   MOVE      *BLANKS       WKOPTC            5
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *BLANKS       MDMNUC            5            Menu
     C                   MOVE      *BLANKS       MDOPTC            5            Option
     C                   MOVE      *ZEROS        MDSEQN            5 0          Sequence Number
     C                   MOVE      *BLANKS       MDTEXT           60            Text
     C                   MOVE      *BLANKS       MPPGMD           50            Program Description
     C                   MOVE      *BLANKS       MPPGMN           10            Program Name
     C                   MOVE      *BLANKS       MPPGMT            1            Program Type
     C                   MOVE      *BLANKS       MPPRM1           50            Parameter
     C                   MOVE      *BLANKS       MPPRM2           50            Parameter
     C                   MOVE      *BLANKS       MPPRM3           50            Parameter
     C                   MOVE      *BLANKS       MPPRM4           50            Parameter
     C                   MOVE      *BLANKS       MPSPGM           10            Secondary Program Na
     C                   MOVE      *BLANKS       RN0002            1            Add
     C                   MOVE      *BLANKS       RN0003            1            Delete
     C                   MOVE      *BLANKS       RN0004            1            Revise
     C                   MOVE      *BLANKS       RN0005            1            Allow Change of Loca
     C                   MOVE      *BLANKS       RN0006           10            Default Value for Le
     C                   MOVE      *BLANKS       RN0007           10            Default Value for Le
     C                   MOVE      *BLANKS       RN0008           10            Default Value for Le
     C                   MOVE      *BLANKS       RN0009           20            Forename
     C                   MOVE      *BLANKS       RN0010           10            Group User
     C                   MOVE      *BLANKS       RN0011           20            Surname
     C                   MOVE      *BLANKS       RN0012           10            User
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       KAUS01           10            MAUSER
     C                   MOVE      *BLANKS       KAGU01           10            MAGUSER
     C                   MOVE      *BLANKS       KBMN02            5            MBMNUC
     C                   MOVE      *BLANKS       KCOP03            5            MCOPTC
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
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
     C*                                                               *
     C* *** Add User to User file If a new user
     C* SETLL D.MENU,F.MNUUSR,PRTUSR
     C*
     C                   EXSR      S001
     C* IF %sts(d.menu,f.mnuusr) = *NO
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* MAUSER = PRTUSR
     C                   MOVE      PRTUSR        WAUSER
     C* MAACTA = ' '
     C                   MOVE      *BLANKS       WAACTA
     C* MAACTD = ' '
     C                   MOVE      *BLANKS       WAACTD
     C* MAACTR = ' '
     C                   MOVE      *BLANKS       WAACTR
     C* MAGUSER = ' '
     C                   MOVEL     *BLANKS       WK0001
     C* MAFORN = ' '
     C                   MOVEL     *BLANKS       WAFORN
     C* MASURN = ' '
     C                   MOVEL     *BLANKS       WASURN
     C* WRITE D.MENU,F.MNUUSR
     C*
     C                   EXSR      S002
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Copy Menu Details
     C* IF prcmnu = 'Y'
     C     PRCMNU        IFEQ      'Y'
     C* SETLL D.MENU,F.MNUHED,prfusr
     C*
     C                   EXSR      S003
     C* GETREC D.MENU,F.MNUHED,*NE,prfusr
     C*
     C                   EXSR      S004
     C* PRREC = 'N' ; Records to copy = No
     C                   MOVE      'N'           PRREC
     C*                                                               *
     C* DOW %sts(d.menu,f.mnuhed) = *yes
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
     C* PRREC = 'Y'
     C                   MOVE      'Y'           PRREC
     C*                                                               *
     C* Save Key fields to re-position file after write
     C* WKMNUC = mbmnuc
     C                   MOVE      WBMNUC        WKMNUC
     C*                                                               *
     C* MBUSER = prtusr
     C                   MOVE      PRTUSR        WBUSER
     C* WRITE d.menu,f.mnuhed
     C*
     C                   EXSR      S006
     C*                                                               *
     C* Re-Position File
     C* GETREC D.MENU,F.MNUHED,*eq,prfusr,wkmnuc
     C*
     C                   EXSR      S007
     C*                                                               *
     C* GETREC D.MENU,F.MNUHED,*NE,prfusr
     C*
     C                   EXSR      S004
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
     C* *** Copy Option Details
     C* IF (prcopt = 'Y') & (prrec = 'Y')
     C     PRCOPT        IFEQ      'Y'
     C     PRREC         ANDEQ     'Y'
     C* SETLL D.MENU,F.MNUopt,prfusr
     C*
     C                   EXSR      S008
     C* GETREC D.MENU,F.MNUOPT,*NE,PRFUSR
     C*
     C                   EXSR      S009
     C*                                                               *
     C* DOW %sts(d.menu,f.mnuopt) = *yes
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
     C* Save Key fields to re-position file after write
     C* WKMNUC = mcmnuc
     C                   MOVE      WCMNUC        WKMNUC
     C* WKOPTC = mcoptc
     C                   MOVE      WCOPTC        WKOPTC
     C*                                                               *
     C* MCUSER = prtusr
     C                   MOVE      PRTUSR        WCUSER
     C* WRITE d.menu,f.mnuopt
     C*
     C                   EXSR      S011
     C*                                                               *
     C* Re-Position File
     C* GETREC D.MENU,F.MNUOPt,*eq,prfusr,wkmnuc,wkoptc
     C*
     C                   EXSR      S012
     C*                                                               *
     C* GETREC D.MENU,F.MNUOPT,*NE,prfusr
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
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* END                                                           *
     C                   END
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
     C* S001   - SETLL D.MENU,F.MNUUSR,PRTUSR
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   MOVE      'N'           SWRD02                         RD.SW.MNUHED    MNUO
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUOPT    MNUP
     C*
     C                   MOVEL     PRTUSR        KAUS01
     C                   MOVEL     PRTUSR        HAUSER                         User
     C                   MOVEL     PRTUSR        MAUSER                         User
     C*
     C     K0001         SETLL     MNUUSR                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - WRITE D.MENU,F.MNUUSR
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     MNUUSRF                              90      ADD REC TO MNUUSR
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(1)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(2)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - SETLL D.MENU,F.MNUHED,prfusr
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.MNUHED    MNUO
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUOPT    MNUP
     C                   MOVEL     *LOVAL        HBMNUC                         Menu
     C*
     C                   MOVEL     PRFUSR        KAGU01
     C                   MOVEL     PRFUSR        HBUSER                         User
     C                   MOVEL     PRFUSR        MBUSER                         User
     C*
     C     K0002         SETLL     MNUHED                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.MENU,F.MNUHED,*NE,prfusr
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     PRFUSR        KAGU01
     C     K0002         READE(N)  MNUHED                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.MNUHED    MNUO
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S005                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - Process To Reset File Pointer(EOF) - MNUHED
     C**************************************************************************
     C     S005          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.MNUHED    MNUO
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KAGU01                         User
     C                   MOVEL     MBUSER        KAGU01
     C     K0002         SETGT     MNUHED
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(3)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - WRITE d.menu,f.mnuhed
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     MNUHEDF                              90      ADD REC TO MNUHED
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(4)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(5)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.MENU,F.MNUHED,*eq,prfusr,wkmnuc
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     PRFUSR        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     WKMNUC        KBMN02
     C     K0003         CHAIN(N)  MNUHED                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.MNUHED    MNUO
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - SETLL D.MENU,F.MNUopt,prfusr
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUOPT    MNUP
     C                   MOVEL     *LOVAL        HCOPTC                         Option
     C*
     C                   MOVEL     PRFUSR        KAGU01
     C                   MOVEL     PRFUSR        HCUSER                         User
     C                   MOVEL     PRFUSR        MCUSER                         User
     C*
     C     K0002         SETLL     MNUOPT                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.MENU,F.MNUOPT,*NE,PRFUSR
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     PRFUSR        KAGU01
     C     K0002         READE(N)  MNUOPT                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUOPT    MNUP
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUOPT    MNUP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S010                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - Process To Reset File Pointer(EOF) - MNUOPT
     C**************************************************************************
     C     S010          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.MNUOPT    MNUP
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUOPT    MNUP
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KAGU01                         User
     C                   MOVEL     MCUSER        KAGU01
     C     K0002         SETGT     MNUOPT
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(3)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - WRITE d.menu,f.mnuopt
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     MNUOPTF                              90      ADD REC TO MNUOPT
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(6)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(7)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.MENU,F.MNUOPt,*eq,prfusr,wkmnuc,wkoptc
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     PRFUSR        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     WKMNUC        KBMN02
     C                   MOVEL     *BLANK        KCOP03
     C                   MOVEL     WKOPTC        KCOP03
     C     K0004         CHAIN(N)  MNUOPT                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUOPT    MNUP
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUOPT    MNUP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    MNUUSR                               91      MNUUSR    MNUHED
     C                   UNLOCK    MNUHED                               91      MNUHED    MNUOPT
     C                   UNLOCK    MNUOPT                               91      MNUOPT
     C                   READ      MNUUSR                                 90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            MNUUSR
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            MNUHED
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            MNUOPT
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - MNUUSR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WAACTA        MAACTA                         Add
     C                   MOVEL     WAACTD        MAACTD                         Delete
     C                   MOVEL     WAACTR        MAACTR                         Revise
     C                   MOVEL     WACHG         MACHG                          Allow Change of Loca
     C                   MOVEL     WADFV1        MADFV1                         Default Value for Le
     C                   MOVEL     WADFV2        MADFV2                         Default Value for Le
     C                   MOVEL     WADFV3        MADFV3                         Default Value for Le
     C                   MOVEL     WAFORN        MAFORN                         Forename
     C                   MOVEL     WK0001        RN0001                         Group User
     C                   MOVEL     WASURN        MASURN                         Surname
     C                   MOVEL     WAUSER        MAUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - MNUHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WBMNUC        MBMNUC                         Menu
     C                   MOVEL     WBMNUD        MBMNUD                         Menu Description
     C                   MOVEL     WBSTRT        MBSTRT                         Start Menu
     C                   MOVEL     WBUSER        MBUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - MNUOPT
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WCACTA        MCACTA                         Add
     C                   MOVEL     WCACTD        MCACTD                         Delete
     C                   MOVEL     WCACTR        MCACTR                         Revise
     C                   MOVEL     WCMNUC        MCMNUC                         Menu
     C                   MOVEL     WCOPTC        MCOPTC                         Option
     C                   MOVEL     WCOPTD        MCOPTD                         Option Description
     C                   MOVEL     WCPGMN        MCPGMN                         Program Name
     C                   MOVEL     WCPGMT        MCPGMT                         Program Type
     C                   MOVEL     WCPRM1        MCPRM1                         Parameter
     C                   MOVEL     WCPRM2        MCPRM2                         Parameter
     C                   MOVEL     WCPRM3        MCPRM3                         Parameter
     C                   MOVEL     WCPRM4        MCPRM4                         Parameter
     C                   MOVEL     WCSPGM        MCSPGM                         Secondary Program Na
     C                   MOVEL     WCUSER        MCUSER                         User
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
     C*          | Move Fields From File To Work Area - MNUUSR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     MAACTA        WAACTA                         Add
     C                   MOVEL     MAACTD        WAACTD                         Delete
     C                   MOVEL     MAACTR        WAACTR                         Revise
     C                   MOVEL     MACHG         WACHG                          Allow Change of Loca
     C                   MOVEL     MADFV1        WADFV1                         Default Value for Le
     C                   MOVEL     MADFV2        WADFV2                         Default Value for Le
     C                   MOVEL     MADFV3        WADFV3                         Default Value for Le
     C                   MOVEL     MAFORN        WAFORN                         Forename
     C                   MOVEL     RN0001        WK0001                         Group User
     C                   MOVEL     MASURN        WASURN                         Surname
     C                   MOVEL     MAUSER        WAUSER                         User
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     MAUSER        HAUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     MBMNUC        WBMNUC                         Menu
     C                   MOVEL     MBMNUD        WBMNUD                         Menu Description
     C                   MOVEL     MBSTRT        WBSTRT                         Start Menu
     C                   MOVEL     MBUSER        WBUSER                         User
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     MBUSER        HBUSER                         User
     C                   MOVEL     MBMNUC        HBMNUC                         Menu
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUOPT
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     MCACTA        WCACTA                         Add
     C                   MOVEL     MCACTD        WCACTD                         Delete
     C                   MOVEL     MCACTR        WCACTR                         Revise
     C                   MOVEL     MCMNUC        WCMNUC                         Menu
     C                   MOVEL     MCOPTC        WCOPTC                         Option
     C                   MOVEL     MCOPTD        WCOPTD                         Option Description
     C                   MOVEL     MCPGMN        WCPGMN                         Program Name
     C                   MOVEL     MCPGMT        WCPGMT                         Program Type
     C                   MOVEL     MCPRM1        WCPRM1                         Parameter
     C                   MOVEL     MCPRM2        WCPRM2                         Parameter
     C                   MOVEL     MCPRM3        WCPRM3                         Parameter
     C                   MOVEL     MCPRM4        WCPRM4                         Parameter
     C                   MOVEL     MCSPGM        WCSPGM                         Secondary Program Na
     C                   MOVEL     MCUSER        WCUSER                         User
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     MCUSER        HCUSER                         User
     C                   MOVEL     MCMNUC        HCMNUC                         Menu
     C                   MOVEL     MCOPTC        HCOPTC                         Option
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
Record added to file Menu Users                  MA
Unable to add record to file Menu Users                  MA
The end of the file was reached
Record added to file Menu Heading file           MB
Unable to add record to file Menu Heading file           MB
Record added to file Menu Options                MC
Unable to add record to file Menu Options                MC
