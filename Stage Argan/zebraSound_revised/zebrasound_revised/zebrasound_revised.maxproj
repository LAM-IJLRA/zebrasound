{
	"name" : "zebrasound_revised",
	"version" : 1,
	"creationdate" : 3696858298,
	"modificationdate" : 3697549602,
	"viewrect" : [ 923.0, 140.0, 302.0, 612.0 ],
	"autoorganize" : 1,
	"hideprojectwindow" : 0,
	"showdependencies" : 1,
	"autolocalize" : 1,
	"contents" : 	{
		"patchers" : 		{
			"main.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1,
				"toplevel" : 1
			}
,
			"zebraSynth.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1
			}
,
			"LAM.EqualLoudnessCurve.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1
			}

		}
,
		"media" : 		{
			"video.mov" : 			{
				"kind" : "moviefile",
				"local" : 1
			}

		}
,
		"code" : 		{
			"compute_mean_vector.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"compute_std_div.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"normalized_by_max.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"normalized_by_overall_max.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"comp_group_average.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"thresh.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"reset_toggles.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"threshold_std_var.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"compute_tot.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"toolSet.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}

		}
,
		"data" : 		{
			"roitext.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"clustersGain.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"means_raw.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"clustersdict.json" : 			{
				"kind" : "json",
				"local" : 1
			}
,
			"groupsColor.json" : 			{
				"kind" : "json",
				"local" : 1
			}
,
			"note_test2.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}

		}
,
		"other" : 		{
			"note_1" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"clusters.coll" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"exportROI_txt.m" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"RoiSet.zip" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"ReadImageJROI.m" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"note_test2" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"notes_2" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"notes_3" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"notes_bass" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"exportClusters.m" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"read_resultsImageJ.m" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"Results.csv" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"ResultsMinMax.csv" : 			{
				"kind" : "file",
				"local" : 1
			}

		}

	}
,
	"layout" : 	{

	}
,
	"searchpath" : 	{

	}
,
	"detailsvisible" : 0,
	"amxdtype" : 0,
	"readonly" : 0,
	"devpathtype" : 0,
	"devpath" : ".",
	"sortmode" : 0,
	"viewmode" : 1
}
