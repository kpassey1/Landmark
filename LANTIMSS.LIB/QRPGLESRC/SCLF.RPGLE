      /Free
         // ****************************************************************
         // SCLF   - CLF : Cursor Location On Field Handler
         // ****************************************************************
         begsr sclf;

            // FIND TABLE OFFSET BY SCREEN ID AND FIELD NAME AND FIELD INDEX

            x0 = 1;
            x0 = %lookup(#map:da4);
            if x0 > 3;
               // ***               move      da5(x0)       #clf
               #clf = %dec(da5(x0):8:0);
               // ------------------------------------------------------
               // | CALCULATE CURRENT SCREEN OFFSET
               // ------------------------------------------------------
               // Get row
               halfwd = 0;
               byte2 = row;
               approw = halfwd;
               // Get column
               halfwd = 0;
               byte2 = col;
               appcol = halfwd;

               offset = approw - 1;
               offset = (offset * 80) + appcol;
               // ------------------------------------------------------
               // | CHECK OFFSET BOUNDARY
               // ------------------------------------------------------
               if offset >= #from  and
                  offset <= #to;
                  nrslt = 1;
                  else;
                  nrslt = 0;
               endif;

               #atrib = *blanks;
            endif;
         endsr;
      /End-free
