var rptSrc = "jasper_report_demo/mmo/Avg_Wages_Summary_HK_Reg_Seafarer.pdf";
var chk_para_ind = window.location.search;
var color_code_ind = -1;
 
	if (chk_para_ind > "") {
			chk_para_ind = chk_para_ind.substring(1, chk_para_ind.length);
			color_code_ind = chk_para_ind.split("&")[0].split("=")[1];
			
	} else {
			color_code_ind = 5; // def.

	}


var sectionTitle = 	
	isc.Label.create({
		width: "75%",
		width: "75%",
		height: 20,
		//padding: 5,
		align: "left",
		valign: "top",
		wrap: false,
		contents: "<p><b><font size=2px>Distribution of Crew by Rank/Rating by Nationality</font></b></p>"
	});

	
	
var searchForm = 
	isc.ReportDynamicForm.create({
		ID:"RPT_MMO_008_Form",
		numCols: 4,	
		fields: [
					{name: "reportDate", 	title: "Report Date", defaultValue : new Date(), type: "date", required:true, displayFormat:"dd/MM/yyyy"},
					{name: "nationalityId", title: "Nationality", required:true, optionDataSource:nationalityDS, valueField:"id",    displayField:"engDesc", allowEmptyValue:true}					
				]
	});
	

var searchFormToolBar = 
	isc.ReportToolbar.create({
		buttons: [
			{ name:"generateBtn", title:"Generate Report", autoFit: true, disabled: false,
			  click : function () {
				  if(RPT_MMO_008_Form.validate()){
						var requestArguments = ["RPT_MMO_008", RPT_MMO_008_Form.getValues()]; 
						ReportViewWindow.displayReport(requestArguments);
					} 
			  }
			}
		]
	});	

	
var searchSectionContent = 
	isc.ReportSectionStack.create({
		sections: [
		
			{ title: "Report", expanded: true, resizeable: false, 
				items: [ isc.HLayout.create({membersMargin:10, members:[searchForm, searchFormToolBar]}) ]
			}

		]

});	




var contentLayout = 
	isc.VLayout.create({ 
	width: "75%", 
	padding: 10, 
    members: [ sectionTitle, searchSectionContent ]


});

isc.HLayout.create({
	ID: "mainLayout", 
	width: "100%",
	height: "100%", 
	members: [ contentLayout ]
});
