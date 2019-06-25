/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_23(char*, char *);
extern void execute_24(char*, char *);
extern void execute_26(char*, char *);
extern void execute_38447(char*, char *);
extern void execute_38448(char*, char *);
extern void execute_38449(char*, char *);
extern void execute_38450(char*, char *);
extern void execute_38451(char*, char *);
extern void execute_38452(char*, char *);
extern void execute_38453(char*, char *);
extern void execute_38454(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_31(char*, char *);
extern void execute_32(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_35(char*, char *);
extern void execute_1920(char*, char *);
extern void execute_1921(char*, char *);
extern void execute_1922(char*, char *);
extern void execute_1923(char*, char *);
extern void execute_1924(char*, char *);
extern void execute_1925(char*, char *);
extern void execute_1926(char*, char *);
extern void execute_1927(char*, char *);
extern void execute_1928(char*, char *);
extern void execute_1929(char*, char *);
extern void execute_1930(char*, char *);
extern void execute_1931(char*, char *);
extern void execute_1932(char*, char *);
extern void execute_1933(char*, char *);
extern void execute_1934(char*, char *);
extern void execute_1935(char*, char *);
extern void execute_1936(char*, char *);
extern void execute_1937(char*, char *);
extern void execute_1938(char*, char *);
extern void execute_1939(char*, char *);
extern void execute_1940(char*, char *);
extern void execute_1941(char*, char *);
extern void execute_1942(char*, char *);
extern void execute_54(char*, char *);
extern void execute_42(char*, char *);
extern void execute_198(char*, char *);
extern void execute_398(char*, char *);
extern void execute_404(char*, char *);
extern void execute_405(char*, char *);
extern void execute_406(char*, char *);
extern void execute_407(char*, char *);
extern void execute_408(char*, char *);
extern void execute_409(char*, char *);
extern void execute_410(char*, char *);
extern void execute_1337(char*, char *);
extern void execute_1338(char*, char *);
extern void execute_1282(char*, char *);
extern void execute_1283(char*, char *);
extern void execute_1284(char*, char *);
extern void execute_1285(char*, char *);
extern void execute_1286(char*, char *);
extern void execute_1778(char*, char *);
extern void execute_1779(char*, char *);
extern void execute_1780(char*, char *);
extern void execute_1781(char*, char *);
extern void execute_38428(char*, char *);
extern void execute_38429(char*, char *);
extern void execute_38446(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[69] = {(funcp)execute_23, (funcp)execute_24, (funcp)execute_26, (funcp)execute_38447, (funcp)execute_38448, (funcp)execute_38449, (funcp)execute_38450, (funcp)execute_38451, (funcp)execute_38452, (funcp)execute_38453, (funcp)execute_38454, (funcp)execute_28, (funcp)execute_29, (funcp)execute_30, (funcp)execute_31, (funcp)execute_32, (funcp)execute_33, (funcp)execute_34, (funcp)execute_35, (funcp)execute_1920, (funcp)execute_1921, (funcp)execute_1922, (funcp)execute_1923, (funcp)execute_1924, (funcp)execute_1925, (funcp)execute_1926, (funcp)execute_1927, (funcp)execute_1928, (funcp)execute_1929, (funcp)execute_1930, (funcp)execute_1931, (funcp)execute_1932, (funcp)execute_1933, (funcp)execute_1934, (funcp)execute_1935, (funcp)execute_1936, (funcp)execute_1937, (funcp)execute_1938, (funcp)execute_1939, (funcp)execute_1940, (funcp)execute_1941, (funcp)execute_1942, (funcp)execute_54, (funcp)execute_42, (funcp)execute_198, (funcp)execute_398, (funcp)execute_404, (funcp)execute_405, (funcp)execute_406, (funcp)execute_407, (funcp)execute_408, (funcp)execute_409, (funcp)execute_410, (funcp)execute_1337, (funcp)execute_1338, (funcp)execute_1282, (funcp)execute_1283, (funcp)execute_1284, (funcp)execute_1285, (funcp)execute_1286, (funcp)execute_1778, (funcp)execute_1779, (funcp)execute_1780, (funcp)execute_1781, (funcp)execute_38428, (funcp)execute_38429, (funcp)execute_38446, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 69;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/test_modules_behav/xsim.reloc",  (void **)funcTab, 69);
	iki_vhdl_file_variable_register(dp + 1327552);
	iki_vhdl_file_variable_register(dp + 1327608);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/test_modules_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/test_modules_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/test_modules_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/test_modules_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/test_modules_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
