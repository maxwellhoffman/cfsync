<cfscript>
	
	sourceObj = createObject("component","source");
	syncObj = createObject("component","synchronized");
	syncObj = syncObj.getSynchronizedObject(sourceObj);
	cfthread(name="thread1"){
		sourceObj.sourceMethod();
	}
	cfthread(name="thread2"){
		sourceObj.sourceMethod();
	}
	
	sleep(2000);
	
	cfthread(name="thread1"){
		syncObj.sourceMethod();
	}
	cfthread(name="thread2"){
		syncObj.sourceMethod();
	}
	
</cfscript>