{
	"name" : "zebrasound__KarplusStrong",
	"version" : 1,
	"creationdate" : 3696858298,
	"modificationdate" : 3702986536,
	"viewrect" : [ 282.0, 140.0, 458.0, 586.0 ],
	"autoorganize" : 1,
	"hideprojectwindow" : 0,
	"showdependencies" : 1,
	"autolocalize" : 1,
	"contents" : 	{
		"patchers" : 		{
			"testPatch.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1
			}
,
			"testSynth.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1
			}
,
			"LAM.EqualLoudnessCurve.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1
			}
,
			"zebraSynth.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1
			}
,
			"main.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1,
				"toplevel" : 1
			}
,
			"graph.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1
			}
,
			"graphGroup.maxpat" : 			{
				"kind" : "patcher",
				"local" : 1
			}

		}
,
		"media" : 		{
			"sigma.png" : 			{
				"kind" : "imagefile",
				"local" : 1
			}
,
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
			"thresh_vector.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"groupItems.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"thresh.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"simpleKS_with_envFollower.gendsp" : 			{
				"kind" : "gendsp",
				"local" : 1
			}
,
			"computeGroupSize.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"reset_toggles.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"switchClusters.js" : 			{
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
,
			"addGraph.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"normalizeSizes.js" : 			{
				"kind" : "javascript",
				"local" : 1
			}
,
			"runningAverage.js" : 			{
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
			"means_raw.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_bell.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"clustersGain.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_3.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notesCombFilter.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_tierce.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"note_1.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"roitext_explant2.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"means_explant2.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"clusters_explant2.txt" : 			{
				"kind" : "textfile",
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
,
			"clustersdict.json" : 			{
				"kind" : "json",
				"local" : 1
			}
,
			"notes_2.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_AminorChord.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_AmionorNatural.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_CmajorChord.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_CmajorPentatonic_octaves.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_CmajorPentatonic_one_octaves.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_glass_harmonica.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_major_scale.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_metallic_percusstion.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_octave.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}
,
			"notes_SciFi.txt" : 			{
				"kind" : "textfile",
				"local" : 1
			}

		}
,
		"other" : 		{
			"dyn-range-comp.genexpr" : 			{
				"kind" : "genexpr",
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
,
			"CorrToROI2.m" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"GCaMPLinReg.m" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"plotClusteredROI.m" : 			{
				"kind" : "file",
				"local" : 1
			}
,
			"workspace.mat" : 			{
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
	"detailsvisible" : 1,
	"amxdtype" : 0,
	"readonly" : 0,
	"devpathtype" : 0,
	"devpath" : ".",
	"sortmode" : 0,
	"viewmode" : 1
}
