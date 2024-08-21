config ctr_hier_cfg;
   design glib.ctr;
   default liblist glib;
endconfig

config ctr_tb_cfg;   
   design work.ctr_tb;
   default liblist work glib;
   instance ctr_tb.DUT use work.ctr_hier_cfg:config;
   instance ctr_tb.REF use work.ctr;
endconfig


