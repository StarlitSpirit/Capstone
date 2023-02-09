/**************************************************************************/
/* LabWindows/CVI User Interface Resource (UIR) Include File              */
/*                                                                        */
/* WARNING: Do not add to, delete from, or otherwise modify the contents  */
/*          of this include file.                                         */
/**************************************************************************/

#include <userint.h>

#ifdef __cplusplus
    extern "C" {
#endif

     /* Panels and Controls: */

#define  PANEL                            1
#define  PANEL_COMMANDBUTTON              2       /* control type: command, callback function: Bye */
#define  PANEL_COMMANDBUTTON_2            3       /* control type: command, callback function: Acquire */
#define  PANEL_NUMERIC_2                  4       /* control type: numeric, callback function: (none) */
#define  PANEL_NUMERIC_3                  5       /* control type: numeric, callback function: (none) */
#define  PANEL_GRAPH                      6       /* control type: graph, callback function: (none) */
#define  PANEL_GRAPH_2                    7       /* control type: graph, callback function: (none) */
#define  PANEL_STRING                     8       /* control type: string, callback function: (none) */
#define  PANEL_COMMANDBUTTON_3            9       /* control type: command, callback function: Save */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */

int  CVICALLBACK Acquire(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Bye(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Save(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif