     F/TITLE MITMKV Validate Module
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MITMKV
     F*  Application ID      -    MITMKV
     F*  Application Name    -    Validate Module
     F*  Date Generated      -    Jan 12, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  MITMKVD     - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCFAIL     - Display if check failed
     F*
     F* N79     - SCR001 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - Display if check failed
     F* SCMD - Processes OS/400 Commands
     F* SMSG - calls message handling program to either clear, add, or
     F* *PSSR - Program Execution Errors Handler
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMITMKVD   CF   E             WORKSTN
     F                                     INFDS(DSPFDS)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D CST             S              1    DIM(2560)                            Command string
     D @DS001          DS
     D  #RCVL                  1      4B 0
     D @DS002          DS
     D  #SYSV                  1      4B 0
     D*
     D* API Error structure
     D*
     D #ERRC           DS
     D  #BYTP                  1      4B 0
     D  #BYTA                  5      8B 0
     D  #EXCP                  9     15
     D  #RSVD                 16     16
     D  #DATA                 17     66
     D*
     D* KDPKEY
     D*
     D KDPKEY          DS
     D  DSSE01                 1      1  0
     D  SECKEY                 1     27
     D  DSSE02                 2      2  0
     D  DSSE03                 3      3  0
     D  DSSE04                 4      4  0
     D  DSSE05                 5      5  0
     D  DSSE06                 6      6  0
     D  DSSE07                 7      7  0
     D  DSSE08                 8      8  0
     D  DSSE09                 9      9  0
     D  DSSE10                10     10  0
     D  DSSE11                11     11  0
     D  DSSE12                12     12  0
     D  DSSE13                13     13  0
     D  DSSE14                14     14  0
     D  DSSE15                15     15  0
     D  DSSE16                16     16  0
     D  DSSE17                17     17  0
     D  DSSE18                18     18  0
     D  DSSE19                19     19  0
     D  DSSE20                20     20  0
     D  DSSE21                21     21  0
     D  DSSE22                22     22  0
     D  DSSE23                23     23  0
     D  DSSE24                24     24  0
     D  DSSE25                25     25  0
     D  DSSE26                26     26  0
     D  DSSE27                27     27  0
     D*
     D* NUMBER
     D*
     D NUMBER          DS
     D  WK0101                 1      1  0
     D  WK0901                 1      9  0
     D  WK0102                 2      2  0
     D  WK0103                 3      3  0
     D  WK0104                 4      4  0
     D  WK0105                 5      5  0
     D  WK0106                 6      6  0
     D  WK0107                 7      7  0
     D  WK0108                 8      8  0
     D  WK0109                 9      9  0
     D  DTSRNL                10     17  0
     D  DTSR01                10     10  0
     D  DTSR02                11     11  0
     D  DTSR03                12     12  0
     D  DTSR04                13     13  0
     D  DTSR05                14     14  0
     D  DTSR06                15     15  0
     D  DTSR07                16     16  0
     D  DTSR08                17     17  0
     D*
     D* INFDS for cursor location
     D*
     D DSPFDS          DS
     D  ROW                  370    370
     D  COL                  371    371
     D  SFLRRN               378    379B 0
     D*
     D* Work Data Structure for cursor
     D*
     D @DS003          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
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
     D* Message data structure
     D*
     D @DS004          DS
     D  MSGDTA                 1    132
     D  UMESG1                 1     51
     D  UMESG2                52    102
     D  UMESG3               103    132
     D*
     D* Program status data structure
     D*
     D SDS            SDS
     D  WSID                 244    253
     D  USER                 254    263
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
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    #RECV
     C                   PARM                    #RCVL             9 0
     C                   PARM                    #SYSV             9 0
     C                   PARM                    #SNAM
     C                   PARM                    #ERRC
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRGO              3
     C                   PARM                    PRM001           27
     C                   PARM                    XYMD              6 0
     C*
     C     PMSGCL        PLIST
     C                   PARM                    MSGACT            1
     C                   PARM                    MSGID
     C                   PARM                    MSGF             10
     C                   PARM                    MSGFL            10
     C                   PARM                    MSGDTA
     C*
     C     PHELP         PLIST
     C                   PARM                    APPSET
     C                   PARM                    APPTYP
     C                   PARM                    APPPGM
     C                   PARM                    APPSCR
     C                   PARM                    APPROW
     C                   PARM                    APPCOL
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
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
     C                   MOVE      *BLANKS       #RECV            36
     C                   MOVE      *BLANKS       #SNAM            10
     C                   MOVE      *BLANKS       #SRNLA            8
     C                   MOVE      *ZEROS        #SRNL2            8 0
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *ZEROS        SERIAN            8 0
     C                   MOVE      *ZEROS        SERNUM            8 0
     C                   MOVE      *ZEROS        WKTEST            1 0
     C                   MOVE      *ZEROS        WK0201            2 0
     C                   MOVE      *ZEROS        WK0601            6 0
     C                   MOVE      *ZEROS        WK0801            8 0
     C                   MOVE      *ZEROS        WK0802            8 0
     C                   MOVE      *ZEROS        #BYTP                          Init DS/*DTA flds
     C                   MOVE      *ZEROS        #BYTA                          Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE01                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE02                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE03                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE04                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE05                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE06                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE07                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE08                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE09                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE10                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE11                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE12                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE13                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE14                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE15                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE16                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE17                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE18                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE19                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE20                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE21                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE22                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE23                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE24                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE25                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE26                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE27                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0101                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0901                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0102                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0103                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0104                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0105                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0106                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0107                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0108                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0109                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSRNL                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR01                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR02                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR03                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR04                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR05                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR06                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR07                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR08                         Init DS/*DTA flds
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       CMDERR            1
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      '  '          APPSET
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVEL     'LANDXAPP'    APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     1             C3                5 0          *CST INDEX
     C                   Z-ADD     1             CALLST            1 0          CALL STSEX
     C                   Z-ADD     *ZEROS        LEN              15 5
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
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
     C*
     C* Clear Message Subfile.
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C*      *------------------------------------------*
     C*      *  Process all screens.                    *
     C*      *------------------------------------------*
     C                   MOVEL     'SCFAIL'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SCFAIL'      S001
     C     SCRNID        CASEQ     'SEND'        SEND
     C                   END
     C                   END
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
     C                   MOVE      *BLANK        SCRNID
     C                   RETURN
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* S001 - Display if check failed
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* KDPKEY = KDPKEY3 ; load the key passed
     C                   MOVEL     PRM001        KDPKEY
     C*         ; so far its Landmark from
     C*         ; CKDPKEY - QCLNAT/KDPUTIL
     C* WK0901 = 0
     C                   Z-ADD     *ZERO         WK0901
     C* DTSRNL = 0
     C                   Z-ADD     *ZERO         DTSRNL
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C*                                                               *
     C* DTSR01 = dsse24
     C                   Z-ADD     DSSE24        DTSR01
     C* DTSR02 = dsse19
     C                   Z-ADD     DSSE19        DTSR02
     C* DTSR03 = dsse06
     C                   Z-ADD     DSSE06        DTSR03
     C* DTSR04 = dsse13
     C                   Z-ADD     DSSE13        DTSR04
     C* DTSR05 = dsse04
     C                   Z-ADD     DSSE04        DTSR05
     C* DTSR06 = dsse08
     C                   Z-ADD     DSSE08        DTSR06
     C* DTSR07 = dsse10
     C                   Z-ADD     DSSE10        DTSR07
     C* DTSR08 = dsse25
     C                   Z-ADD     DSSE25        DTSR08
     C* WK0101 = dsse11
     C                   Z-ADD     DSSE11        WK0101
     C* WK0102 = dsse12
     C                   Z-ADD     DSSE12        WK0102
     C* WK0103 = dsse18
     C                   Z-ADD     DSSE18        WK0103
     C* WK0104 = dsse14
     C                   Z-ADD     DSSE14        WK0104
     C* WK0105 = dsse16
     C                   Z-ADD     DSSE16        WK0105
     C* WK0106 = dsse17
     C                   Z-ADD     DSSE17        WK0106
     C* WK0107 = dsse20
     C                   Z-ADD     DSSE20        WK0107
     C* WK0108 = dsse21
     C                   Z-ADD     DSSE21        WK0108
     C* WK0109 = dsse23
     C                   Z-ADD     DSSE23        WK0109
     C* WKTEST = wk0102 + dtsr06
     C     WK0102        ADD       DTSR06        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse01 <> wktest
     C     DSSE01        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0101 + dtsr08
     C     WK0101        ADD       DTSR08        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse02 <> wktest
     C     DSSE02        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0105 + dtsr01
     C     WK0105        ADD       DTSR01        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse03 <> wktest
     C     DSSE03        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0106 + dtsr02
     C     WK0106        ADD       DTSR02        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse05 <> wktest
     C     DSSE05        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0107 + dtsr03
     C     WK0107        ADD       DTSR03        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse07 <> wktest
     C     DSSE07        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0108 + dtsr04
     C     WK0108        ADD       DTSR04        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse09 <> wktest
     C     DSSE09        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0103 + dtsr07
     C     WK0103        ADD       DTSR07        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse15 <> wktest
     C     DSSE15        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0104 + dtsr05
     C     WK0104        ADD       DTSR05        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse22 <> wktest
     C     DSSE22        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0109 + dsse26
     C     WK0109        ADD       DSSE26        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse27 <> wktest
     C     DSSE27        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Get the serial number, Use API
     C* #RECV = *BLANKS
     C                   MOVEL     *BLANKS       #RECV
     C* #RCVL = 36
     C                   Z-ADD     36            #RCVL
     C* #SYSV = 1
     C                   Z-ADD     1             #SYSV
     C* #SNAM = 'QSRLNBR'
     C                   MOVE      *BLANKS       #SNAM
     C                   MOVEL     'QSRLNBR'     #SNAM
     C* #EXCP = *BLANKS
     C                   MOVEL     *BLANKS       #EXCP
     C* #BYTP = 66
     C                   Z-ADD     66            #BYTP
     C* #DATA = *BLANKS
     C                   MOVEL     *BLANKS       #DATA
     C* CALL 'QWCRSVAL',#RECV,#RCVL,#SYSV,#SNAM,#ERRC
     C                   Z-ADD     1             CALLST
     C                   CALL      'QWCRSVAL'    P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF #EXCP <> *BLANKS
     C     #EXCP         IFNE      *BLANKS
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* #SRNLA = %RJF(#RECV)
     C*  Right Justify field into result field
     C                   MOVE      #RECV         #SRNLA
     C* SERNUM = %CTN(#SRNLA)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        SERNUM
     C                   MOVE      #SRNLA        SERNUM
     C* IF SERNUM < *ZEROS
     C     SERNUM        IFLT      *ZEROS
     C* SERNUM = SERNUM * 1-
     C     SERNUM        MULT      -1            NRSLT0
     C                   Z-ADD     NRSLT0        SERNUM
     C* END                                                           *
     C                   END
     C* IF sernum <> dtsrnl
     C     SERNUM        IFNE      DTSRNL
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WK0601 = wk0901 - sernum
     C     WK0901        SUB       SERNUM        NRSLT0
     C                   Z-ADD     NRSLT0        WK0601
     C* IF WK0601 = 999999
     C     WK0601        IFEQ      999999
     C* WK0801 = 20999999
     C                   Z-ADD     20999999      WK0801
     C* ELSE                                                          *
     C                   ELSE
     C* WK0201 = %LJF(WK0601)
     C*  Left Justify field into result field
     C                   MOVEL     WK0601        WK0201
     C* IF WK0201 > 80
     C     WK0201        IFGT      80
     C* WK0801 = 19000000 + WK0601
     C     19000000      ADD       WK0601        NRSLT0
     C                   Z-ADD     NRSLT0        WK0801
     C* ELSE                                                          *
     C                   ELSE
     C* WK0801 = 20000000 + WK0601
     C     20000000      ADD       WK0601        NRSLT0
     C                   Z-ADD     NRSLT0        WK0801
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF wk0601 < *ymd
     C* ERROR 'Y'
     C* END                                                           *
     C* WK0201 = %LJF(*YMD)
     C*  Left Justify field into result field
     C                   MOVEL     XYMD          WK0201
     C* IF WK0201 > 80
     C     WK0201        IFGT      80
     C* WK0802 = 19000000 + *YMD
     C     19000000      ADD       XYMD          NRSLT0
     C                   Z-ADD     NRSLT0        WK0802
     C* ELSE                                                          *
     C                   ELSE
     C* WK0802 = 20000000 + *YMD
     C     20000000      ADD       XYMD          NRSLT0
     C                   Z-ADD     NRSLT0        WK0802
     C* END                                                           *
     C                   END
     C* IF WK0801 < WK0802
     C     WK0801        IFLT      WK0802
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* no error continue
     C* PRGO = ' '
     C                   MOVEL     *BLANKS       PRGO
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* PRGO = '@@*'
     C                   MOVE      '@@*'         PRGO
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C* END                                                           *
     C                   END
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   EXFMT     SCR001
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Help
     C*
     C     *INKA         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SIGNOFF                                                       *
     C                   MOVEA     *BLANKS       CST
     C                   MOVEA     'SIGNOFF '    CST
     C                   EXSR      SCMD
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SIGNOFF                                                       *
     C                   MOVEA     *BLANKS       CST
     C                   MOVEA     'SIGNOFF '    CST
     C                   EXSR      SCMD
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* SIGNOFF                                                       *
     C                   MOVEA     *BLANKS       CST
     C                   MOVEA     'SIGNOFF '    CST
     C                   EXSR      SCMD
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* SCMD - Processes OS/400 Commands
     C*****************************************************************
     C     SCMD          BEGSR
     C*
     C                   MOVE      'N'           CMDERR                         Error flag
     C                   Z-ADD     2560          LEN
     C                   MOVE      '1'           *IN79
     C* Validate command syntax
     C*
     C                   CALL      'QCMDCHK'                            92
     C                   PARM                    CST                            CMD string
     C                   PARM                    LEN                            Length
     C* Check command syntax failure
     C*
     C     *IN92         IFEQ      '1'
     C                   MOVE      'Y'           CMDERR
     C                   END
     C* Execute command
     C*
     C     CMDERR        IFEQ      'N'
     C                   CALL      'QCMDEXC'                            92
     C                   PARM                    CST
     C                   PARM                    LEN
     C* Check command failure
     C*
     C     *IN92         IFEQ      '1'
     C                   MOVE      'Y'           CMDERR
     C                   END
     C                   END
     C*
     C                   MOVEA     *BLANKS       CST
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMSG - calls message handling program to either clear, add, or
     C*        remove messages from message subfile or extracts
     C*        messages from message files.
     C*****************************************************************
     C     SMSG          BEGSR
     C*
     C* Add message to message subfile
     C*
     C     MSGACT        IFEQ      'A'
     C     MSGACT        OREQ      'R'
     C                   MOVE      'Y'           MSGFLG
     C                   ELSE
     C* Clear message subfile or extract message from message file.
     C*
     C     MSGACT        IFEQ      'C'
     C                   MOVE      'N'           MSGFLG
     C                   END
     C                   END
     C*
     C     MSGACT        IFEQ      'C'
     C     MSGACT        OREQ      'A'
     C     MSGACT        OREQ      'E'
     C                   CALL      'CLMSG'       PMSGCL
     C                   MOVE      *BLANK        MSGID
     C                   MOVE      *BLANK        MSGF
     C                   MOVE      *BLANK        MSGFL
     C* Do not clear the message data field if message is extracted
     C* from message file
     C     MSGACT        IFNE      'E'
     C                   MOVE      *BLANK        MSGDTA
     C                   END
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* *PSSR - Program Execution Errors Handler
     C*****************************************************************
     C     *PSSR         BEGSR
     C     UERCNT        IFNE      *ZERO
     C                   MOVEL     '*CANCL'      URSUME
     C                   ELSE
     C                   Z-ADD     1             UERCNT
     C                   MOVE      'R'           MSGACT
     C                   MOVE      *BLANKS       MSGF
     C                   MOVEL     'QCPFMSG'     MSGF
     C                   MOVE      *BLANKS       MSGFL
     C                   MOVEL     'QSYS'        MSGFL
     C                   MOVE      *BLANKS       MSGDTA
     C     UMSGTX        IFNE      *BLANKS
     C                   MOVEL     UMSGTX        MSGDTA
     C                   ELSE
     C                   MOVEL     UROUTN        MSGDTA
     C                   END
     C*
     C     USTAT         IFEQ      *ZEROS
     C                   MOVE      UFSTAT        USTAT
     C                   MOVE      UFSRCL        USRCLN
     C                   END
     C                   MOVE      USTAT         USTAT4
     C*
     C     MSGID         IFEQ      *BLANKS
     C                   MOVE      USTAT4        MSGID
     C                   MOVEL     'RPG'         MSGID
     C                   MOVEL     'QRPGMSGE'    MSGF
     C                   END
     C*
     C                   CALL      'CLMSG'       PMSGCL                   93
     C*
     C                   MOVEL     '1'           UEROPT
     C                   EXFMT     PSSR0001
     C*
     C     UEROPT        IFEQ      '1'
     C                   MOVEL     '*GETIN  '    URSUME
     C                   ELSE
     C     UEROPT        IFEQ      '2'
     C                   MOVEL     '*CANCL  '    URSUME
     C                   ELSE
     C     UEROPT        IFEQ      '3'
     C                   MOVE      '        '    URSUME
     C                   END
     C                   END
     C                   END
     C                   END
     C*
     C                   MOVEL     *BLANK        MSGID
     C                   MOVE      *ZERO         UERCNT
     C*
     C                   ENDSR     URSUME
