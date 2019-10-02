Rename five hundred variables                                                                           
                                                                                                        
    Problem                                                                                             
                                                                                                        
        var1 = var1_chg                                                                                 
        var2 = var2_chg                                                                                 
        var3 = var3_chg                                                                                 
        ...                                                                                             
        var550 = var550_chg                                                                             
                                                                                                        
You should use macros, utlnops and utlopts to supress                                                   
symbolgen.                                                                                              
                                                                                                        
github                                                                                                  
https://tinyurl.com/y2bmebgp                                                                            
https://github.com/rogerjdeangelis/utl-rename-five-hundred-variables                                    
                                                                                                        
macros                                                                                                  
https://tinyurl.com/y9nfugth                                                                            
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories              
                                                                                                        
SAS Forum                                                                                               
https://tinyurl.com/yxhovcyg                                                                            
https://communities.sas.com/t5/New-SAS-User/Rename-all-550-variables/m-p/593201                         
                                                                                                        
*_                   _                                                                                  
(_)_ __  _ __  _   _| |_                                                                                
| | '_ \| '_ \| | | | __|                                                                               
| | | | | |_) | |_| | |_                                                                                
|_|_| |_| .__/ \__,_|\__|                                                                               
        |_|                                                                                             
;                                                                                                       
                                                                                                        
* make input;                                                                                           
data have;                                                                                              
 array vars[550] var1-var550 (550*1);                                                                   
run;quit;                                                                                               
                                                                                                        
Observation(1 ) of have - Total Obs 1                                                                   
                                                                                                        
 -- NUMERIC --                                                                                          
                                                                                                        
Name         Type    Value                                                                              
                                                                                                        
VAR1          N8       1                                                                                
VAR2          N8       1                                                                                
VAR3          N8       1                                                                                
....                                                                                                    
VAR550        N8       1                                                                                
                                                                                                        
*            _               _                                                                          
  ___  _   _| |_ _ __  _   _| |_                                                                        
 / _ \| | | | __| '_ \| | | | __|                                                                       
| (_) | |_| | |_| |_) | |_| | |_                                                                        
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                       
                |_|                                                                                     
;                                                                                                       
                                                                                                        
Observation(1 ) of have - Total Obs 1                                                                   
                                                                                                        
 -- NUMERIC --                                                                                          
                                                                                                        
Name         Type    Value                                                                              
                                                                                                        
VAR1_chg      N8       1                                                                                
VAR2_chg      N8       1                                                                                
VAR3_chg      N8       1                                                                                
....                                                                                                    
VAR550        N8       1                                                                                
                                                                                                        
*                                                                                                       
 _ __  _ __ ___   ___ ___  ___ ___                                                                      
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                     
| |_) | | | (_) | (_|  __/\__ \__ \                                                                     
| .__/|_|  \___/ \___\___||___/___/                                                                     
|_|                                                                                                     
;                                                                                                       
                                                                                                        
%utlnopts; * turn off sybolgen;                                                                         
                                                                                                        
%array(old,values=var1-var550);                                                                         
                                                                                                        
proc datasets lib=work;                                                                                 
  modify have;                                                                                          
    rename                                                                                              
      %do_over(old,phrase=? = ?_chg)                                                                    
    ;                                                                                                   
run;quit;                                                                                               
                                                                                                        
%utlopts;                                                                                               
                                                                                                        
                                                                                                        
