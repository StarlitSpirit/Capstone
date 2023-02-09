#include <formatio.h>
#include <ansi_c.h>
#include <advanlys.h>
#include <NIDAQmx.h>
#include <cvirte.h>		
#include <userint.h>
#include "lab 2 ui.h"

static int32 output;
static TaskHandle task_handle;
static double end;
static double timestep;
static int panelHandle;
static int arraysize;
static int i;
static double arraysize1;
static char savepath [300];
static double voltagedata[1000];
static double xdata[1000];
static double freqdata[1000];
static double oldvdata[1000];
static double results[1000];
static double frequency;


int main (int argc, char *argv[])
{
	if (InitCVIRTE (0, argv, 0) == 0)
		return -1;	/* out of memory */
	if ((panelHandle = LoadPanel (0, "lab 2 ui.uir", PANEL)) < 0)
		return -1;
	DisplayPanel (panelHandle);
	RunUserInterface ();
	DiscardPanel (panelHandle);
	return 0;
}

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

int CVICALLBACK Acquire (int panel, int control, int event,
						 void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			DeleteGraphPlot (panelHandle, PANEL_GRAPH, -1, VAL_IMMEDIATE_DRAW);
			DeleteGraphPlot (panelHandle, PANEL_GRAPH_2, -1, VAL_IMMEDIATE_DRAW);
			
			GetCtrlVal (panelHandle, PANEL_NUMERIC_2, &end);
			GetCtrlVal (panelHandle, PANEL_NUMERIC_3, &timestep);
			
			arraysize1=end/timestep;
			arraysize = (int)arraysize1;
			frequency = 1/timestep;
			
			for(i=0;i<=arraysize; i++){
				xdata[i]=i*timestep;
				}
			
			DAQmxCreateTask ("data collect", &task_handle);
			DAQmxCreateAIVoltageChan (task_handle, "Dev1/ai0", "Input Channel", DAQmx_Val_Diff, -10, 10, DAQmx_Val_Volts, "");
			DAQmxCfgSampClkTiming (task_handle, NULL, frequency, DAQmx_Val_Rising, DAQmx_Val_FiniteSamps, arraysize);
			DAQmxStartTask (task_handle);
			DAQmxReadAnalogF64 (task_handle, DAQmx_Val_Auto, 20, DAQmx_Val_GroupByChannel, voltagedata, arraysize, &output, 0);
			DAQmxStopTask (task_handle);
			DAQmxClearTask (task_handle);
			
			PlotXY (panelHandle, PANEL_GRAPH, xdata, voltagedata, arraysize, VAL_DOUBLE, VAL_DOUBLE, VAL_THIN_LINE, VAL_EMPTY_SQUARE, VAL_SOLID, 1, VAL_RED);
			
			for(i=0;i<arraysize;i++){
				oldvdata[i] = voltagedata[i];
				
				}
			
			
			for(i=0;i<arraysize;i++){
				freqdata[i] = i/end;
				
				}
			Spectrum (voltagedata, arraysize);
			PlotXY (panelHandle, PANEL_GRAPH_2, freqdata, voltagedata, arraysize, VAL_DOUBLE, VAL_DOUBLE, VAL_THIN_LINE, VAL_EMPTY_SQUARE,VAL_SOLID, 1, VAL_RED);
		
			break;
	}
	return 0;
}


int CVICALLBACK Save (int panel, int control, int event,
					  void *callbackData, int eventData1, int eventData2)
{
	switch (event)
	{
		case EVENT_COMMIT:
			
			FileSelectPopup ("C:\\Users\\Public\\Audrey and Kevin", "*.txt*", ".", "Save File", VAL_SAVE_BUTTON, 0, 0, 1, 0, savepath);

			for(i=0; i<arraysize; i++){
				results[i]=xdata[i];
				results[i+arraysize]= oldvdata[i];
				results[i+2*arraysize]= freqdata[i];
				results[i+3*arraysize]= voltagedata[i];
				
				}
		
			ArrayToFile (savepath, results, VAL_DOUBLE, 4*arraysize, 4, VAL_GROUPS_TOGETHER, VAL_GROUPS_AS_COLUMNS, VAL_SEP_BY_TAB, 10, VAL_ASCII, VAL_TRUNCATE);
			break;
	}
	return 0;
}
