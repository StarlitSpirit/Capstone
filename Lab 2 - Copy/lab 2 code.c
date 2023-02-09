#include <userint.h>
#include "lab 2 ui.h"

int CVICALLBACK Bye (int panel, int control, int event,
					 void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
		QuitUserInterface(0);
			break;
	}
	return 0;
}
